# Import Selenium module
Import-Module Selenium

# Specify the path to the ChromeDriver executable
$driverPath = "C:\Users\ABHIRAJ SARDAR\Desktop\Powershell-Commands\Driver"

# Start a new Selenium session with Chrome
$driverService = [OpenQA.Selenium.Chrome.ChromeDriverService]::CreateDefaultService($driverPath)
$driverService.HideCommandPromptWindow = $true
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($driverService)

# Check if WebDriver initialization was successful
if ($driver -eq $null) {
    Write-Error "Failed to initialize WebDriver. Exiting script."
    return
}

Write-Host "WebDriver initialized successfully."

# Navigate to Figma website
$driver.Navigate().GoToUrl("https://www.figma.com/")

# Wait for the user to log in to Figma
Write-Host "Please log in to Figma and press Enter to continue."
$null = Read-Host "Press Enter to continue."

# Create a new tab and navigate to Canva website
$driver.ExecuteScript("window.open('https://www.canva.com/', '_blank');")

# Switch to the newly opened tab
#$driver.SwitchTo().Window($driver.WindowHandles | Select-Object -Last 1)

# Wait for the user to log in to Canva
Write-Host "Please log in to Canva and press Enter to continue."
$null = Read-Host "Press Enter to continue."

# Select the home option (assuming it's available)
# Add your code here to select the home option in Canva website

# Create a new tab and navigate to YouTube
$driver.ExecuteScript("window.open('https://www.youtube.com/', '_blank');")

# Switch to the newly opened tab
#$driver.SwitchTo().Window($driver.WindowHandles | Select-Object -Last 1)

# Wait for the user to search for "code with harry" on YouTube and select the first video
Write-Host "Please search for 'code with harry' on YouTube and press Enter to continue."
$null = Read-Host "Press Enter to continue."

# Selecting the first video (assuming it's already visible)
$firstVideo = $driver.FindElementByCssSelector("ytd-video-renderer.style-scope:nth-child(1) #thumbnail")
$firstVideo.Click()

# Wait for the user to like the video
Write-Host "Please like the video on YouTube and press Enter to continue."
$null = Read-Host "Press Enter to continue."

# Close the browser
$driver.Quit()

Write-Host "Script completed successfully."
