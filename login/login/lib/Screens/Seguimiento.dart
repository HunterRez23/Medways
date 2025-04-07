import 'package:flutter/material.dart';
import 'package:login/Screens/PantallaPrincipal.dart';
import 'package:login/Screens/Consultorios.dart';

class Seguimiento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessageScreen(),
    );
  }
}

// clase para almacenar mensajes
class GlobalMessages {
  static Map<String, List<Message>> messages = {};
}

class MessageScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(
        sender: 'Dr. Erick Alejandro',
        text: 'Buenas tardes, su próxima cita será en 7 días',
        time: '10:30 a.m.'),
    Message(
        sender: 'Dr. César Castaños',
        text: 'Sus resultados de laboratorio indican que todo está bien, no es necesaria otra cita',
        time: '22/03/2024'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seguimiento médico',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(235, 255, 255, 255),
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Color.fromARGB(183, 2, 57, 129),
        toolbarHeight: 57.2,
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return ListTile(
            leading: SizedBox(
              width: 50.0, // Ajusta el ancho según el tamaño deseado
              height: 50.0, // Ajusta la altura según el tamaño deseado
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 108, 158, 199),
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
            title: Text(message.sender),
            subtitle: Text(
              message.text.length > 30
                  ? message.text.substring(0, 30) + '...'
                  : message.text,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (message.time != null) Text(message.time!),
                if (message.date != null) Text(message.date!),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    sender: message.sender,
                    initialMessage: message,
                  ),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 62,
        elevation: 0,
        color: const Color.fromARGB(215, 109, 141, 190),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.medical_services_outlined),
              color: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaPrincipal()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.healing_sharp),
              color: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Consultorios()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String sender;
  final Message initialMessage;

  ChatScreen({required this.sender, required this.initialMessage});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Message> _messages = [];
  bool _isComposing = false;

  @override
  void initState() {
    super.initState();
    _messages = GlobalMessages.messages[widget.sender] ?? [];
    if (!_messages.any((msg) =>
        msg.sender == widget.initialMessage.sender &&
        msg.text == widget.initialMessage.text)) {
      _messages.insert(0, widget.initialMessage);
    }
  }

  void _handleSubmitted(String text) {
    _controller.clear();
    setState(() {
      _isComposing = false;
      final newMessage = Message(sender: 'Me', text: text, isMe: true);
      if (!_messages.any((msg) => msg.sender == 'Me' && msg.text == text)) {
        _messages.add(newMessage);
        GlobalMessages.messages[widget.sender] = _messages;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Verificar si el chat es con el Dr. César Castaños Cuevas
    final bool isChatTerminated =
        widget.sender == 'Dr. César Castaños';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.sender,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(235, 255, 255, 255),
            fontSize: 19.0,
          ),
        ),
        backgroundColor: Color.fromARGB(183, 2, 57, 129),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message.isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: message.isMe
                          ? Color.fromARGB(183, 2, 65, 146)
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      message.text,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: message.isMe ? Colors.white : Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: isChatTerminated
                          ? Colors.grey[300]
                          : Colors.white, // Cambia a gris si el chat terminó
                      borderRadius: BorderRadius.circular(25.0),
                      border: Border.all(
                          color: Colors.blueGrey), // Color del borde
                    ),
                    child: TextField(
                      controller: _controller,
                      onChanged: (text) {
                        setState(() {
                          _isComposing = text.isNotEmpty;
                        });
                      },
                      enabled: !isChatTerminated, // Deshabilitar si el chat terminó
                      decoration: InputDecoration(
                        hintText: isChatTerminated
                            ? 'Este chat ha terminado'
                            : 'Escribe un mensaje...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(
                      _isComposing && !isChatTerminated ? Icons.send : Icons.send),
                  onPressed: _isComposing && !isChatTerminated
                      ? () => _handleSubmitted(_controller.text)
                      : null,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final String? time;
  final String? date;
  final bool isMe;

  Message({
    required this.sender,
    required this.text,
    this.time,
    this.date,
    this.isMe = false,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      sender: json['sender'],
      text: json['text'],
      time: json['time'],
      date: json['date'],
      isMe: json['isMe'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sender': sender,
      'text': text,
      'time': time,
      'date': date,
      'isMe': isMe,
    };
  }
}