Import-Module ActiveDirectory

#SET THE LOCATION OF THE CSV USER FILE TO IMPORT

$file = Import-csv <LOCATION_OF_USER_FILE>\users.csv

foreach ($f in $file){
    $name = $f.NAME
	$User = Get-ADUser -filter {sAMAccountName -eq $name}
    If ($User -eq $null){"$name does not exist"}
    Else {"$User found"}
}
