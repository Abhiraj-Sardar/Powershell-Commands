# Set the path to the Microsoft Edge WebDriver executable
#$edgeDriverPath = "C:\Windows\System32\"  # Update this path with the actual path to your WebDriver executable

# Import Selenium module
Import-Module Selenium

# Set the path to the Microsoft Edge WebDriver executable
$edgeDriverPath = "C:\Program Files\WindowsPowerShell\Modules\Selenium\3.0.1\assemblies\"  # Update this path with the actual path to your WebDriver executable

# Create a Microsoft Edge WebDriver
$driver = New-Object OpenQA.Selenium.Edge.EdgeDriver($edgeDriverPath)

# Navigate to a webpage
$driver.Navigate().GoToUrl("https://bing.com")

# Find the search box element by ID
$searchBox = $driver.FindElementById("sb_form_q")

# Send keys to the search box to enter text
$searchBox.SendKeys("WebDriver")

# Submit the search form
$searchBox.Submit()

# Wait for 5 seconds (adjust as needed)
Start-Sleep -Seconds 5

# Quit the WebDriver
$driver.Quit()
