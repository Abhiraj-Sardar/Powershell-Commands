# Specify the path to the text file
$textFilePath = "C:\Users\ABHIRAJ SARDAR\Desktop\hello.txt"

# Create a new Excel COM object
$excel = New-Object -ComObject Excel.Application
$excel.Visible = $true  # Set to true if you want to see Excel in action

# Add a workbook
$workbook = $excel.Workbooks.Add()

# Attempt to add a worksheet
$worksheet = $workbook.Worksheets.Item(1)
if (-not $worksheet) {
    Write-Error "Failed to add a worksheet."
    return
}

# Specify the starting row for writing the data
$row = 1

# Read the text file line by line and write each line to the Excel sheet
Get-Content -Path $textFilePath | ForEach-Object {
    # Split the line into data based on commas
    $data = $_ -split ','

    # Write each piece of data to the worksheet
    for ($i = 0; $i -lt $data.Count; $i++) {
        if ($worksheet.Cells.Item($row, $i + 1)) {
            $worksheet.Cells.Item($row, $i + 1).Value2 = $data[$i].Trim('"')  # Trim double quotes from each item
        } else {
            Write-Error "Failed to access cell ($row, $($i + 1))"
        }
    }

    # Move to the next row
    $row++
}

# Specify the file path to save the Excel workbook
$excelFilePath = "C:\Users\ABHIRAJ SARDAR\Desktop\output.xlsx"

# Save the Excel workbook
$workbook.SaveAs($excelFilePath)

# Close the workbook and Excel application
$workbook.Close()
$excel.Quit()

Write-Output "Data from text file copied to Excel sheet: $excelFilePath"
