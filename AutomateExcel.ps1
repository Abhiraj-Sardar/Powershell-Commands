# Load the Excel COM Object
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false

# Open the Excel workbook
$workbook = $excel.Workbooks.Open("C:\Users\ABHIRAJ SARDAR\Desktop\demo1.xlsx")

# Get the active worksheet
$worksheet = $workbook.ActiveSheet

# Get the dimensions of the data
$rows = $worksheet.UsedRange.Rows.Count
$columns = $worksheet.UsedRange.Columns.Count

# Prepare output string
$output = ""

# Loop through each cell to retrieve data
for ($row = 1; $row -le $rows; $row++) {
    for ($col = 1; $col -le $columns; $col++) {
        $cellValue = $worksheet.Cells.Item($row, $col).Text
        $output += $cellValue + "`t"  # Add tab between values for tabular format
    }
    $output += "`n"  # Add newline after each row
}

# Close Excel
$workbook.Close()
$excel.Quit()

# Write data to a text file
$output | Out-File -FilePath "C:\Users\ABHIRAJ SARDAR\Desktop\hello.txt"

# Release COM objects from memory
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($worksheet) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($workbook) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()
