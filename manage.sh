Write-Host "Starting HRMS deployment..." -ForegroundColor Green

# Move to Terraform infra folder
Set-Location ".\infra"

Write-Host "Checking Terraform initialization..."

if (!(Test-Path ".terraform")) {
    Write-Host "Terraform not initialized. Running init..."
    terraform init
} else {
    Write-Host "Terraform already initialized. Skipping init."
}

Write-Host "Applying Terraform infrastructure..."
terraform apply -auto-approve

Write-Host "Infrastructure ready."

# Backend test
$ALB="http://hrms-prod-alb-876229343.ap-south-1.elb.amazonaws.com"

Write-Host "Testing health endpoint..."
Invoke-RestMethod "$ALB/api/hrms/health"

Write-Host "Testing login API..."

$response = Invoke-RestMethod `
-Uri "$ALB/api/hrms/login" `
-Method POST `
-Headers @{ "Content-Type"="application/json" } `
-Body '{"username":"admin@codeboardtech.com","password":"123456"}'

$token = $response.accessToken

Write-Host "Login successful. Token received."

Write-Host "Testing protected endpoint..."

Invoke-RestMethod `
-Uri "$ALB/api/hrms/getempdata" `
-Method POST `
-Headers @{
Authorization="Bearer $token"
"Content-Type"="application/json"
} `
-Body '{"userId":1}'

Write-Host "Deployment and testing completed successfully!" -ForegroundColor Green