import 'package:socket_io_client/socket_io_client.dart'
    show io, OptionBuilder, Socket;

class RealTime {
  late Socket socket;

  RealTime() {
    Socket socket = io(
        'http://ip172-18-0-8-cbt6kuav7vjg00da4t1g-5000.direct.labs.play-with-docker.com',
        OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket.on('connect', (data) {
      print('connected');
    });
  }
}
