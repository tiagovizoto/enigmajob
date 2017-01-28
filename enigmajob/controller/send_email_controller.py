import smtplib

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders


class SendEmail:
    def __init__(self):
        pass

    def sendEmailRH(self, name, email, message):
        smtp = smtplib.SMTP('smtp.sendgrid.net', 587)

        smtp.login("", "")
        msg = MIMEMultipart()
        de = email
        para = 'r'
        msg['From'] = de
        msg['To'] = para
        msg['Subject'] = 'New message'

        bady = """
        Name: %s
        E-mail: %s
        Messagem:
        %s

        Email by Enigma Jobs
            """ % (name, email, message)

        msg.attach(MIMEText(bady, 'plain'))
        msg = msg.as_string()

        smtp.sendmail(de, para, msg)

        smtp.quit()


    def sendEmailMe(self, nome, email, message, file, emailRH, id_job):
        server = smtplib.SMTP('smtp.sendgrid.net', 587)
        fromaddr = "noreply@enigmajobs.xyz"
        toaddr = emailRH

        msg = MIMEMultipart()

        msg['From'] = fromaddr
        msg['To'] = toaddr
        msg['Subject'] = "Curriculo para a Vaga %s" % id_job

        body = """"Segue Curriculum do Candidato %s  -- email: %s

    %s""" %(nome, email, message)

        msg.attach(MIMEText(body, 'plain'))

        attachment = open(file, "rb")



        part = MIMEBase('application', 'octet-stream')
        part.set_payload((attachment).read())
        encoders.encode_base64(part)
        part.add_header('Content-Disposition', "attachment; filename= %s" % file)

        msg.attach(part)


        server.starttls()
        server.login("", "")
        text = msg.as_string()
        server.sendmail(fromaddr, toaddr, text)
        server.quit()




    def sendEmail(self):
        smtp = smtplib.SMTP_SSL('smtp.gmail.com', 465)

        smtp.login("m", "")
        msg = MIMEMultipart()
        de = ""
        para = ''
        msg['From'] = de
        msg['To'] = para
        msg['Subject'] = 'New message'

        bady = """
          Name: ddddd
          E-mail: ddddd
          Messagem:
          dddddd

          Email by Enigma Jobs
              """

        msg.attach(MIMEText(bady, 'plain'))
        msg = msg.as_string()

        smtp.sendmail(de, para, msg)

        smtp.quit()
