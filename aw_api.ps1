$aw_base_api = 'https://as866.awmdm.com/API'
$aw_device_api = 'https://as866.awmdm.com/API/mdm/devices/search'

# Build Basic Auth (UN/PW/API Tenant Key).
function Get-BasicAuth {
    # TO-DO: Encrypt and embed Credentials
    Write-Host "================Authorizing to Airwatch================"
    $Username = Read-Host -Prompt 'Enter the Username'
    $Password = Read-Host -Prompt 'Enter the Password' -AsSecureString
    $apikey = Read-Host -Prompt 'Enter the API Key'

    # Secure Entered Password
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)
    $UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

    # Base64 Encode AW Username and Password
    $combined = $Username + ":" + $UnsecurePassword
    $encoding = [System.Text.Encoding]::ASCII.GetBytes($combined)
    $cred = [Convert]::ToBase64String($encoding)

    # Develop Header inputs
    $script:header = @{
        "Authorization" = "Basic $cred";
        "aw-tenant-code" = $apikey;
        
        ## "Accept" = "application/json;version=2";
        "Content-Type" = "application/json";
    }
}

# Rest Query to return deivec
Function Get-DeviceList{
    Write-Host "================Searching for User Data================"
    # $devicetype = 'iPad'
    # $devices = Invoke-RestMethod -Method Get -Uri "https://as866.awmdm.com/API/mdm/devices/search" -ContentType "application/json" -Header $header
    # $ipads = $devices.devices.id.value
    # $devicelist = $devices.devices | where-object -filterscript {$_.enrollmentstatus -eq "Enrolled"}
    # $ipads = $devicelist.id.value

    $UserToSearch = Read-Host -Prompt 'Enter user to search'

    $devices = Invoke-RestMethod -Method Get -Uri "https://as866.awmdm.com/API/mdm/devices/search?user=$UserToSearch" -ContentType "application/json" -Header $header 
    
    # $info = @(
    #     $serialNumber = $device.SerialNumber
    #     $userEmailAddress = $device.userEmailAddress
    #     $lastSeen = $device.LastSeen
    # )

    Return $devices.Devices
}

    $serialNumber = $device.SerialNumber
    $userEmailAddress = $device.userEmailAddress
    $lastSeen = $device.LastSeen