from sendgrid import *
from sendgrid.helpers.mail import *
import base64


class SendGridEmail:
    """
    Class responsabilite from send of email general.
    Use web api v3 by SendGrid
    """

    def send_me(self, name, email, message):
        sg = sendgrid.SendGridAPIClient(apikey="")
        data = {
            "personalizations": [
                {
                    "to": [
                        {
                            "email": "tiagovizoto@yahoo.com.br"
                        }
                    ],
                    "subject": "Hello Worffffffffld from the SendGrid Python Library!"
                }
            ],
            "from": {
                "email": str(email)
            },
            "content": [
                {
                    "type": "text/plain",
                    "value": str("Messsagem: %s   Nome: %s" % (message,name))
                }
            ]
        }
        response = sg.client.mail.send.post(request_body=data)
        print(response.status_code)
        print(response.body)
        print(response.headers)

    def send_rh(self, nome, email, message,curriculum, emailRH, id_job):

        """with open("c.pdf", "rb") as image_file:
            encoded_string = base64.b64encode(image_file.read())

        attachment = Attachment()
        attachment.set_content(str(encoded_string))
        attachment.set_type("application/pdf")
        attachment.set_filename("c.pdf")
        attachment.set_disposition("attachment")
        attachment.set_content_id("Balance Sheet")
        mail.add_attachment(attachment)"""

        with open(curriculum, 'rb') as f:
            file = f.read()
            f.close()

        encoded = base64.b64encode(file).decode('ascii')
        data = {
            "personalizations": [
                {
                    "to": [
                        {
                            "email": emailRH
                        }
                    ],
                    "subject": "Curriculo para a Vaga %s" % id_job
                }
            ],
            "from": {
                "email": email
            },
            "attachments": [
                {
                    "content": encoded,
                    "filename": "c.pdf",
                    "name": "c",
                    "type": "pdf"
                }
            ],
            "content": [
                {
                    "type": "text/plain",
                    "value": "Nova Canditadura na vaga %s \n Nome: %s \n Messagem: %s \n EnigmaJob.xyz Simples e Eficiente" % (id_job, nome, message)
                }
            ]
        }

        print(str(encoded))
        print(type(data))
        sg = sendgrid.SendGridAPIClient(apikey="")
        response = sg.client.mail.send.post(request_body=data)
        print(response.status_code)
        print(response.headers)
        print(response.body)





