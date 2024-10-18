import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

if __name__ == "__main__":

    # Accept arguments directly from the command line using sys.argv
    import sys
    if len(sys.argv) != 3:
        print("Usage: python script_name.py RAM + CPU")
    else:
        # Pass command-line arguments to the function
        ram = sys.argv[1]
        cpu = sys.argv[2]
        smtpObj = smtplib.SMTP('smtp.gmail.com', <PORT>) #typically 587 is used
        smtpObj.ehlo()
        smtpObj.starttls()
	#Enter below your emaill address and the <most likely> app password you need to generate
        smtpObj.login('< EMAIL ADDRESS >', "<< MAIL PASSWORD >>")

        # Create the email message object
        msg = MIMEMultipart()
	#Enter below your email address, sender email address and edit subjecti if needed
        msg['From'] = "<EMAIL ADDRESS >"
        msg['To'] = "<SENDER ADDRESS>"
        msg['Subject'] = "SubjecT: This is a test email"

        # Add the body of the email as plain text
        body = "Please check the following!: " + ram + " \n" + cpu
        msg.attach(MIMEText(body, 'plain'))
	
	#This can send the message multiple times - add your email and sender email
        for i in range(2):
            smtpObj.sendmail("<YOUR EMAIL>", "<SENDER EMAIL>", msg.as_string())

        smtpObj.quit()
