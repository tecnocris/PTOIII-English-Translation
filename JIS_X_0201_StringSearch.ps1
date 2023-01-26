# Get input string
$inputString = Read-Host "Enter input string"

# Initialize output string
$outputString = ""

# Iterate through every two characters in the input string
for ($i = 0; $i -lt $inputString.Length; $i += 2) {
    $matchingChars = $inputString.Substring($i, 2)
    # Search for the matching characters in the file
    $result = Select-String -Path "JIS_X_0201.txt" -Pattern $matchingChars
    # If a match is found, add the second character after the matching characters to the output string
    if ($result) {
        $outputString += $result[0].Line.Substring($result[0].Character + 3, 1)
    }
}

# Print the final output string
Write-Host $outputString
