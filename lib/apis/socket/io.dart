import 'package:socket_io_client/socket_io_client.dart' show io,OptionBuilder,Socket;
class RealTime{
  late Socket socket;

  RealTime(){
    Socket socket = io('http://localhost:5000',
        OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .setExtraHeaders({'foo': 'bar'}) // optional
          .build());
    socket.on('connect', (data) {
      print('connected');
    });
  }
  
}