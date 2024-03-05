# Import the Selenium and ImportExcel modules
Import-Module Selenium
Import-Module ImportExcel

# Specify the path to the Excel files
$inputExcelFilePath = "C:\Users\ABHIRAJ SARDAR\Desktop\index.xlsx"
$outputExcelFilePath = "C:\Users\ABHIRAJ SARDAR\Desktop\Output.xlsx"

# Load the Excel data
$excelData = Import-Excel -Path $inputExcelFilePath

# Create an empty array to store matching data
$matchingData = @()

# Loop through each row in the Excel data
foreach ($row in $excelData) {
    $totalData = $row.Name

    # Start a new Chrome session
    $driverPath = "C:\Users\ABHIRAJ SARDAR\Desktop\Powershell-Commands\Driver"  # Specify the path to ChromeDriver
    $driverService = [OpenQA.Selenium.Chrome.ChromeDriverService]::CreateDefaultService($driverPath)
    $driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($driverService)

    # Open Google in the browser
    $driver.Navigate().GoToUrl("https://www.google.com")

    # Find the search box and insert the data
    $searchBox = $driver.FindElementByName("q")
    $searchBox.SendKeys($totalData)
    $searchBox.SendKeys([OpenQA.Selenium.Keys]::Enter)

    # Wait for the search results to load
    Start-Sleep -Seconds 5

    # Get the text of the first search result (if any)
    $firstText = $null
    try {
        $firstText = $driver.FindElementByXPath('//*[@id="rso"]/div[1]/div/div/div/div/div/div/div/div[1]/div/span/a/h3').Text #will throw error if the element does not appea
    } catch {
        Write-Host "No search result found."
    }

    # Check if the $firstText variable is not empty
    if ($firstText -ne "") {
        # If the text contains "YouTube", extract the text before ":"
        if ($firstText -match "YouTube") {
            $extractedText = $firstText.Split(":")[0]
            Write-Host("$extractedText : YES")
            
            # Add the matching data to the array
            $matchingData += [PSCustomObject]@{
                Name = $totalData
                Work = "Content Creation"
            }
        } else {
            Write-Host "No match found for 'YouTube'."
        }
    } else {
        Write-Host "No search result text found."
    }

    # Optionally, you can close the browser session after each search
    $driver.Quit()
}

# Export the matching data to a new Excel sheet
$matchingData | Export-Excel -Path $outputExcelFilePath -AutoSize -WorksheetName "MatchingData" -ClearSheet -Show
