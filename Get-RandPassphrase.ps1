function virtualDice
{
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [array]$wordList,
        [Parameter(Mandatory=$false)]
        [int]$count=2            
    )

    [int]$counter=1    
    $randomWords = @()   
    
    # get 3-random words
    for ($i=1; $i -le $count; $i++)
    {
        # get random word
        do {
            # virtualDice: get 5-random digits
            $arr = for($j = 1;$j -le 5;$j++)
            {
                Get-Random -Minimum 1 -Maximum 6
            } # end for $j

            $counter++
        } While ($counter -le $count)
  
        [int]$index = $arr -join ""
        [string]$string = $wordList -match $index
        [int]$key = $string.LastIndexOf("`t") + 1
        [int]$length = $($string.length) - $key
        $randomWords += $string.Substring($key,$length)
        } # end for $i

        return $randomWords
} # end function virtualDice

function randomDigit
{
    # random digit ascii decimal 48..57
    $digits = 48..57 | Get-Random -Count 3
    $numArr = @()
    foreach ( $digit in $digits )
    {
        $numArr += [char]$digit
    }

    return [string]$($numArr -join "")
}

function randomSpecialChar
{
    # random special character (ascii decimal 33..47)
    $digits = 33..47 | Get-Random -Count 1
    foreach ( $digit in $digits )
    {
        $specialCharArr += [char]$digit
    }

    return [string]$($specialCharArr -join "")
}

Clear-Host
$listPath = $PSScriptRoot + "\eff_large_wordlist.txt"
$arrList = Get-Content -Path $listPath 

<# $count = 3
$passPhrase = @()
for($j=1;$j -le $count; $j++){
    $passPhrase += virtualDice -wordList $arrList
} #>

$passPhrase = virtualDice -wordList $arrList
$nums = randomDigit
$specialChars = randomSpecialChar

$word0 = $($passPhrase[0].Substring(0,1)).ToUpper() + $($passPhrase[0].Substring(1,$($passPhrase[0].Length)-1))
$word1 = $($passPhrase[1].Substring(0,1)).ToUpper() + $($passPhrase[1].Substring(1,$($passPhrase[1].Length)-1))
# $word2 = $($passPhrase[2].Substring(0,1)).ToUpper() + $($passPhrase[2].Substring(1,$($passPhrase[2].Length)-1))

$newPassPhrase = $word0 + " " + $specialChars + $nums + " " + $word1 # + " " + $word2

$newPassPhrase
$newPassPhrase.Length

# [string]$newPassphrase = $passPhrase -join " "

# insert random digit 


# inserr random special character

# $newPassphrase.length
# $newPassphrase
