import smtplib
GMAIL_USER = 'myrf@interia.pl'
GMAIL_PASS = 'gufno'
SMTP_SERVER = 'smtp.interia.pl'
SMTP_PORT = 587

def send_email(recipient, subject, text):
	smtpserver = smtplib.SMTP(SMTP_SERVER, SMTP_PORT)
	smtpserver.ehlo()
	smtpserver.starttls()
	smtpserver.ehlo
	smtpserver.login(GMAIL_USER, GMAIL_PASS)
	header = 'To:' + recipient + '\n' + 'From: ' + GMAIL_USER
	header = header + '\n' + 'Subject:' + subject + '\n'
	msg = header + '\n' + text + ' \n\n'
	smtpserver.sendmail(GMAIL_USER, recipient, msg)
	smtpserver.close()
send_email('roslonek@gmail.com', 'Subject', 'this is text')