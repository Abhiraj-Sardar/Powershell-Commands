# Import Selenium module
Import-Module Selenium

# Specify the path to the ChromeDriver executable
$driverPath = "C:\Users\ABHIRAJ SARDAR\Desktop\Powershell-Commands\Driver"

# Start a new Selenium session with Chrome (maximized)
$driverService = [OpenQA.Selenium.Chrome.ChromeDriverService]::CreateDefaultService($driverPath)
$driverService.HideCommandPromptWindow = $true
$driverOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$driverOptions.AddArgument("--start-maximized")
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($driverService, $driverOptions)

# Task 1: Open Google
$driver.Navigate().GoToUrl("https://www.google.com")

# Task 2: Type "hello world" in the search bar
$searchBox = $driver.FindElementByName("q")  # Locate the search box element
$searchBox.SendKeys("hello world")  # Type "hello world" in the search box
$searchBox.SendKeys([OpenQA.Selenium.Keys]::Enter)  # Press Enter to perform the search

# Wait for a while (optional)
Start-Sleep -Seconds 5

# Open a new tab
$driver.ExecuteScript("window.open();")

# Switch to the newly opened tab
$driver.SwitchTo().Window($driver.WindowHandles[1])

# Task 3: Navigate to YouTube
$driver.Navigate().GoToUrl("https://www.youtube.com")

# Wait for a while (optional)
Start-Sleep -Seconds 5

# Close the browser
$driver.Quit()
