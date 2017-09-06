# Line comment
<#
    Block comment
#>
'Single Quoted string'
"Double Quoted string"
7
-10lkb
0x9
0x25l
-999e-10dmb
+6.e-6lkb
+.6
-.9e+5dmb
.6tb
+4.9e+5dmb
4.5
-9.9
+7.4
$myVariable
$my-Variable
$local:myVariable
$global:myVariable
$script:myVariable
$private:myVariable
$using:myVariable
$env:COMPUTERNAME
$Function:help
$Alias:cat
$Cert:myCert
$Variable:ast
$HKCU:System
$HKLM:System
$WSMan:localhost
${myVariable}
${my-Variable}
${local:myVariable}
${global:myVariable}
${script:myVariable}
${private:myVariable}
${using:myVariable}
${env:COMPUTERNAME}
${Function:help}
${Alias:cat}
${Cert:myCert}
${Variable:ast}
${HKCU:System}
${HKLM:System}
${WSMan:localhost}
command.exe $par1 --% $par2 #comment
command.execute
$$
'''str''ing'
enum myEnum {}
@(1,2,3)
(1,2,3)
(1,2,3).Count
@{1 = 1}
{}
"$($subExpression)"
Get-Service @par
$var:
Write-Warning -Message "Warning"
class myClass {}
1 -is [int]
1 -as [string]
1 -isnot [int]
"c" -in [char[]]"abc"
"c" -notin [char[]]"abc"
1,2 -join ";"
1,2 -split ","
1 -eq 2
1 -ne 2
1 -gt 2
1 -lt 2
1 -ge 2
1 -le 2
1 -like 2
1 -notlike 2
"abc" -replace("b","c")
1,2,3 -contains(2)
1,2,3 -notcontains(2)
"a" -match("\w")
"a" -notmatch("\w")
102 -shl 2
102 -shr 2
5 -band 3
-bnot 5
5 -bor 0x03
5 -bxor 3
(1 -gt 2) -and (2 -gt 1)
(1 -gt 2) -or (2 -gt 1)
(1 -eq 1) -xor (2 -eq 2)
-not (1 -eq 1)
!(1 -eq 1)
"{0} {1,-10} {2:N}" -f 1,"hello",[math]::pi
$a = 1
$a += 1
$a -= 1
$a *= 1
$a /= 1
$a %= 1
$a++
++$a
$a--
--$a
2*2
2/2
2+2
2-2
+$a
-$a
1..4
& $a