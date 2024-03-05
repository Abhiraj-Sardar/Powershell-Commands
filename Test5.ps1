# Import Selenium module
Import-Module Selenium

# Create a Chrome WebDriver
$driverPath = "C:\Users\ABHIRAJ SARDAR\Desktop\Powershell-Commands\Driver"

# Start a new Selenium session with Chrome (maximized)
$driverService = [OpenQA.Selenium.Chrome.ChromeDriverService]::CreateDefaultService($driverPath)
$driverService.HideCommandPromptWindow = $true
$driverOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$driverOptions.AddArgument("--start-maximized")
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($driverService, $driverOptions)

# Navigate to a webpage with a search query input
$driver.Navigate().GoToUrl("https://www.google.com")

# Find the search query input element
$searchBox = $driver.FindElementByName("q")
$searchBox.SendKeys("hello")

#$searchQueryInput = $driver.FindElementByCssSelector("input[type='search']")

# Simulate pressing Ctrl + A to select all text in the search query input
$searchBox.SendKeys([OpenQA.Selenium.Keys]::Control + 'a')

# Simulate pressing the Delete key to delete the selected text
$searchBox.SendKeys([OpenQA.Selenium.Keys]::Delete)

Start-Sleep -Seconds 5
# Optionally, you can set focus back to the search query input
$searchBox.SendKeys([OpenQA.Selenium.Keys]::Tab)
#$searchBox.SendKeys("Hello")

# Quit the WebDriver
#$driver.Quit()
