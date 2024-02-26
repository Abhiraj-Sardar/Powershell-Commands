# Import the Excel module
Import-Module -Name ImportExcel

# Specify the path to the Excel file
$excelFilePath = "C:\Users\ABHIRAJ SARDAR\Desktop\index.xlsx"

# Load the Excel data into a variable
$excelData = Import-Excel -Path $excelFilePath -NoHeader

# Specify the path for the output text file
$outputFilePath = "C:\Users\ABHIRAJ SARDAR\Desktop\hello.txt"

# Write data to the text file
$excelData | Export-Csv -Path $outputFilePath -NoTypeInformation

Write-Output "Data from Excel printed to $outputFilePath"
