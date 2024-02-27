# Import the ImportExcel module
Import-Module ImportExcel

# Specify the path to the Excel file
$excelFilePath = "C:\Users\ABHIRAJ SARDAR\Desktop\index.xlsx"

# Load the Excel data
$excelData = Import-Excel -Path $excelFilePath

# Print the data in a tabular format
$filterData=$excelData
$filterData | Format-Table