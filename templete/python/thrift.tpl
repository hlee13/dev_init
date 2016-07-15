from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.protocol import TCompactProtocol

ip="127.0.0.1"
port=9890

socket=TSocket.TSocket(ip, port)
socket.setTimeout(100)

transport=TTransport.TFramedTransport(socket)
protocol=TBinaryProtocol.TBinaryProtocol(transport)
client=Client(protocol)
transport.open()

#print client.check_alive(ServerKeepAliveRequest())
#request=ServerKeepAliveRequest()
#response=client.RetrievalPickupPoi(request)
#print response
transport.close()
