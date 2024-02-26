# Set paths for source text file and destination Excel file
$textFilePath = "C:\Users\ABHIRAJ SARDAR\Desktop\hello.txt"
$excelFilePath = "C:\Users\ABHIRAJ SARDAR\Desktop\index.xlsx"

# Load the Excel COM Object
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false

# Open the Excel workbook
$workbook = $excel.Workbooks.Open($excelFilePath)
$worksheet = $workbook.Sheets.Item(1)

# Read data from the text file
$data = Get-Content -Path $textFilePath

# Write data to Excel
$startRow = 1
$startColumn = 1
$row = $startRow
$col = $startColumn

foreach ($line in $data) {
    $items = $line -split '\s+'  # Split line by spaces
    foreach ($item in $items) {
        $worksheet.Cells.Item($row, $col).Value2 = $item
        $col++
    }
    $row++
    $col = $startColumn
}

# Save changes and close Excel
$workbook.Save()
$workbook.Close()

# Release COM objects from memory
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

Write-Output "Data copied from text file and pasted into Excel file successfully."
