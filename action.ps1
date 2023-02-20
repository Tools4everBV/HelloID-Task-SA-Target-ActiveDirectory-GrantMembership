# HelloID-Task-SA-Target-ActiveDirectory-GrantMembership
########################################################
# Form mapping
$formObject = @{
    Identity = $form.GroupName
    Members  = $form.MemberSamAccountName
}

try {
    Write-Information "Executing ActiveDirectory action: [GrantMembership] for user: [$($formObject.Members)] on group: [$($formObject.Identity)]"
    Import-Module ActiveDirectory -ErrorAction Stop
    $group = Get-ADgroup -Identity $($formObject.Identity)
    if($group) {
        $updatedGroup = Add-ADGroupMember @formObject -PassThru
        $auditLog = @{
            Action            = 'GrantMembership'
            System            = 'ActiveDirectory'
            TargetDisplayName = $($formObject.Identity)
            TargetIdentifier  = ($updatedGroup).SID.value
            Message           = "ActiveDirectory action: [GrantMembership] for user: [$($formObject.Members)] on group: [$($formObject.Identity)] executed successfully"
            IsError           = $false
        }
        Write-Information -Tags 'Audit' -MessageData $auditLog
        Write-Information "ActiveDirectory action: [GrantMembership] for user: [$($formObject.Members)] on group: [$($formObject.Identity)] executed successfully"
    }
} catch {
    $ex = $_
    $auditLog = @{
        Action            = 'GrantMembership'
        System            = 'ActiveDirectory'
        TargetDisplayName = $($formObject.Identity)
        TargetIdentifier  = ''
        Message           = "Could not execute ActiveDirectory action: [GrantMembership] for user: [$($formObject.Members)] on group: [$($formObject.Identity)], error: $($ex.Exception.Message)"
        IsError           = $true
    }
    Write-Information -Tags "Audit" -MessageData $auditLog
    Write-Error "Could not execute ActiveDirectory action: [GrantMembership] for user: [$($formObject.Members)] on group: [$($formObject.Identity)], error: $($ex.Exception.Message)"
}
########################################################
