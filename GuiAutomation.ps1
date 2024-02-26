# Import Selenium module
Import-Module Selenium

# Set the path to the browser driver (ChromeDriver in this example)
$driverPath = "C:\Users\ABHIRAJ SARDAR\Desktop\Powershell-Commands\Driver"  # Replace with your actual path

# Create a new Chrome WebDriver
$chromeOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$chromeDriver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($driverPath, $chromeOptions)

# Navigate to Google
$chromeDriver.Navigate().GoToUrl("https://www.google.com")

