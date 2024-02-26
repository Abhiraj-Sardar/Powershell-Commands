Import-Module Selenium

# Specify the path to the ChromeDriver executable
$driverPath = "C:\Users\ABHIRAJ SARDAR\Desktop\Powershell-Commands\Driver"

# Start a new Selenium session with Chrome (maximized)
$driverService = [OpenQA.Selenium.Chrome.ChromeDriverService]::CreateDefaultService($driverPath)
$driverService.HideCommandPromptWindow = $true
$driverOptions = New-Object OpenQA.Selenium.Chrome.ChromeOptions
$driverOptions.AddArgument("--start-maximized")
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver($driverService, $driverOptions)

# Open Google
$driver.Navigate().GoToUrl("https://www.google.com");

$searchBox = $driver.FindElementByName("q")
$searchBox.SendKeys("Youtube") #Typing youtube
$searchBox.SendKeys([OpenQA.Selenium.Keys]::Enter)



# Find and click the first search result link
$firstResultLink = $driver.FindElementByXPath('//*[@id="rso"]/div[1]/div/div/div/div/div/div/div/div[1]/div/span/a/h3')
$firstResultLink.Click()

#Youtube Search
$YTsearchBox = $driver.FindElementByName("search_query")
$YTsearchBox.SendKeys("Code With Harry")
$YTsearchBox.SendKeys([OpenQA.Selenium.Keys]::Enter)

Start-Sleep -Seconds 10

$firstVideoTemplate = $driver.FindElementByCssSelector("ytd-video-renderer.style-scope:nth-child(1) #thumbnail")
$firstVideoTemplate.Click()

Start-Sleep -Seconds 10

# Find the element using CSS selector
$shareButton = $driver.FindElementByXPath('//*[@id="top-level-buttons-computed"]/yt-button-view-model/button-view-model/button/yt-touch-feedback-shape/div/div[2]')
$shareButton.Click()