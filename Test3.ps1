# Import the Selenium module
Import-Module Selenium

# Specify the path to the Excel file
$excelFilePath = "C:\Users\ABHIRAJ SARDAR\Desktop\index.xlsx"

# Load the Excel data
$excelData = Import-Excel -Path $excelFilePath

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

    #getting the first text value
    $firstText = $driver.FindElementByXPath('//*[@id="rso"]/div[1]/div/div/div/div/div/div/div/div[1]/div/span/a/h3')
    $text=$firstText.Text
    
    #matching the text

    if($text -match "YouTube")
    {
        $extractedText=$text.Split(":")
        $extractedText=$extractedText[0]
        Write-Host("$extractedText : YES") 
    }
    
    Start-Sleep -Seconds 10
    # Optionally, you can close the browser session after each search
    $driver.Quit()
}
