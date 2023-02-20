# HelloID-Task-SA-Target-ActiveDirectory-GrantMembership

## Prerequisites

- [ ] The HelloID SA on-premises agent installed

- [ ] The `ActiveDirectory` module is installed on the server where the HelloID SA on-premises agent is running.

## Description

This code snippet will grant a group membership to a  user within Active Directory and executes the following tasks:

1. Define a hash table `$formObject`. The keys of the hash table represent the properties of the `Add-ADGroupMember` cmdlet, while the values represent the values entered in the form.

> To view an example of the form output, please refer to the JSON code pasted below.

```json
{
    "GroupName": "",
    "MemberSamAccountName": ""
}
```

> :exclamation: It is important to note that the names of your form fields might differ. Ensure that the `$formObject` hash table is appropriately adjusted to match your form fields.

2. Imports the ActiveDirectory module.

3. Execute the `Add-ADGroupMember`. The hash table called `$formObject` is passed to the `Add-ADGroupMember` cmdlet using the `@` symbol in front of the hash table name.

> :bulb: Splatting is a technique in PowerShell where you store the parameters and their values in a hash table, and then pass the hash table to a cmdlet or function.
