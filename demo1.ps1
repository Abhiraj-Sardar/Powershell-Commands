# Import Selenium module
Import-Module Selenium

# Define the URL to navigate to
$Url = 'http://example.com'

# Start a new Chrome browser session
$Driver = Start-SeChrome

# Navigate to the specified URL
Enter-SeUrl -Driver $Driver -Url $Url
