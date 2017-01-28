import os
from time import gmtime, strftime


class PdfCreate:
    def __init__(self):
        pass
    def renameTest(self,caminho):
        caminho = caminho
        teste = '/home/mago/files/%s/' %(caminho)

        arquivo = os.listdir(teste)

        name, ext = arquivo[0].split('.')
        a = teste+"" +arquivo[0]

        newName = teste + strftime("%Y-%m-%d-%H:%M:%S", gmtime()) +"." + ext
        os.rename(a , newName)
        return newName
