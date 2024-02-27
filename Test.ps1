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
$driver.Navigate().GoToUrl("https://customerportal.solarwinds.com/login");

$email=$driver.FindElementByXPath('/html/body/cp-root/cp-login/div/div/div[2]/cp-authentication/div/form/div/cp-input[1]/div/input')
$email.SendKeys("abhirajsardar2003@gmail.com")