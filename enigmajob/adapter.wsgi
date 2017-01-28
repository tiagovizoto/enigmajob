import sys, os, bottle

sys.path = ['/var/www/enigmajob/'] + sys.path
os.chdir(os.path.dirname(__file__))
 # This loads your application
import app as application
application = bottle.default_app()
