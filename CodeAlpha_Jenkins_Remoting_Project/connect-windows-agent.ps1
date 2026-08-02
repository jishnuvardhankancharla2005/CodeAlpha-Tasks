<#
.SYNOPSIS
Connects this Windows machine to the Jenkins Controller as a JNLP agent.

.DESCRIPTION
This script downloads the Jenkins agent.jar, authenticates with the Jenkins controller to retrieve the unique JNLP secret for the 'windows-agent' node, and launches the agent process.
#>

$jenkinsUrl = "http://localhost:8080"
$nodeName = "windows-agent"
$agentDir = "C:\JenkinsAgent"
$creds = "admin:admin"
$encodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($creds))
$headers = @{ Authorization = "Basic $encodedCreds" }

# Create working directory if it doesn't exist
if (-not (Test-Path -Path $agentDir)) {
    New-Item -ItemType Directory -Path $agentDir | Out-Null
}

Write-Host "Waiting for Jenkins Controller to become available at $jenkinsUrl..."
$jenkinsUp = $false
while (-not $jenkinsUp) {
    try {
        $response = Invoke-WebRequest -Uri "$jenkinsUrl/login" -UseBasicParsing -ErrorAction Stop
        if ($response.StatusCode -eq 200) {
            $jenkinsUp = $true
        }
    } catch {
        Start-Sleep -Seconds 5
    }
}
Write-Host "Jenkins is up!"

Write-Host "Downloading agent.jar..."
Invoke-WebRequest -Uri "$jenkinsUrl/jnlpJars/agent.jar" -OutFile "$agentDir\agent.jar" -UseBasicParsing

Write-Host "Retrieving JNLP secret for node '$nodeName'..."
$jnlpUrl = "$jenkinsUrl/computer/$nodeName/jenkins-agent.jnlp"
$jnlpContent = Invoke-WebRequest -Uri $jnlpUrl -Headers $headers -UseBasicParsing

# Extract the secret from the JNLP XML
[xml]$jnlpXml = $jnlpContent.Content
$secret = $jnlpXml.jnlp.'application-desc'.argument[0]

if (-not $secret) {
    Write-Error "Failed to retrieve the agent secret. Ensure the node is configured correctly."
    exit 1
}

Write-Host "Starting Jenkins Agent..."
Set-Location -Path $agentDir
# Run the agent in the foreground (or background it if you prefer)
$process = Start-Process -FilePath "java" -ArgumentList "-jar", "agent.jar", "-jnlpUrl", $jnlpUrl, "-secret", $secret, "-workDir", $agentDir -NoNewWindow -PassThru -Wait

Write-Host "Agent process exited with code $($process.ExitCode)."
