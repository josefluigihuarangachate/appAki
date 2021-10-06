from suds.client import Client
import sys

data = sys.argv[1] # OBTENGO EL ID

client = Client('https://www.sigerp.com/SOAPAKI/arsoap.aspx?wsdl')
return client.service.Execute(str(data))