
#Don't Run This

# Specify the sender and recipient email addresses
$from = "abhirajsardar2003@gmail.com"
$to = "abhiraj123sardar@gmail.com"

# Create a MailMessage object
$mailMessage = New-Object System.Net.Mail.MailMessage($from, $to)

# Set the email subject and body
$mailMessage.Subject = "Test Email"
$mailMessage.Body = "This is a test email sent using PowerShell automation."

# Specify the SMTP server details
$smtpServer = "smtp.google.com"
$smtpPort = 465

# Create a SmtpClient object
$smtpClient = New-Object System.Net.Mail.SmtpClient($smtpServer, $smtpPort)
#$smtpClient.EnableSsl = $true

# Specify the credentials for authentication (replace with your actual credentials)
$smtpClient.Credentials = New-Object System.Net.NetworkCredential("abhirajsardar2003@gmail.com", "AbHi2003")

# Send the email
$smtpClient.Send($mailMessage)

# Output a message indicating that the email has been sent
Write-Host "Email sent successfully."
