# Import required modules
Import-Module Selenium
Import-Module ImportExcel

# Specify the path to the ChromeDriver executable
$driverPath = "C:\Users\ABHIRAJ SARDAR\Desktop\Powershell-Commands\Driver"

# Check if a Selenium session is already active
if (-not $global:driver) {
    # Start a new Selenium session with Chrome
    $global:driver = Start-SeChrome -DriverExecutablePath $driverPath
}

# Load Excel data
$excelData = Import-Excel -Path "C:\Users\ABHIRAJ SARDAR\Desktop\Dummy.xlsx"

# Loop through each row in the Excel sheet
foreach ($row in $excelData) {
    $word = $row.Word
    # Open Google in the browser
    $global:driver.Navigate().GoToUrl("https://www.google.com")
    
    # Find the search box and enter the word
    $searchBox = $global:driver.FindElementByName("q")
    $searchBox.SendKeys($word)
    $searchBox.Submit()
    
    # Get the current URL (containing the search query)
    $currentUrl = $global:driver.Url
    
    # Check if the URL contains the word
    if ($currentUrl -like "*$word*") {
        Write-Host "Yes"
    } else {
        Write-Host "No"
    }
}

# Close the browser if it was created in this session
if ($global:driver) {
    $global:driver.Quit()
}
