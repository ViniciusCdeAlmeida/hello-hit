import 'package:hellohit/models/usuario_model.dart';

class Message {
  final Usuario sender;
  final String
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
// final Usuario currentUser = Usuario(
//   id: 0,
//   nome: 'Current User',
//   imagem: 'assets/images/usuarios/pantera.jpg',
// );

// // USERS
// final Usuario greg = Usuario(
//   id: 1,
//   nome: 'Greg',
//   imagem: 'assets/images/usuarios/thor.jpg',
// );
// final Usuario james = Usuario(
//   id: 2,
//   nome: 'James',
//   imagem: 'assets/images/usuarios/hulk.jpeg',
// );
// final Usuario john = Usuario(
//   id: 3,
//   nome: 'John',
//   imagem: 'assets/images/usuarios/tony.jpg',
// );
// final Usuario olivia = Usuario(
//   id: 4,
//   nome: 'Olivia',
//   imagem: 'assets/images/usuarios/viuva.jpg',
// );
// final Usuario sam = Usuario(
//   id: 5,
//   nome: 'Sam',
//   imagem: 'assets/images/usuarios/soldado.jpg',
// );
// final Usuario sophia = Usuario(
//   id: 6,
//   nome: 'Sophia',
//   imagem: 'assets/images/usuarios/wanda.jpg',
// );
// final Usuario steven = Usuario(
//   id: 7,
//   nome: 'Steven',
//   imagem: 'assets/images/usuarios/capitao.jpg',
// );

// // FAVORITE CONTACTS
// List<Usuario> favorites = [sam, steven, olivia, john, greg];

// // EXAMPLE CHATS ON HOME SCREEN
// List<Message> chats = [
//   Message(
//     sender: james,
//     time: '5:30 PM',
//     text: 'Hey, how\'s it going? What did you do today?',
//     isLiked: false,
//     unread: true,
//   ),
//   Message(
//     sender: olivia,
//     time: '4:30 PM',
//     text: 'Hey, how\'s it going? What did you do today?',
//     isLiked: false,
//     unread: true,
//   ),
//   Message(
//     sender: john,
//     time: '3:30 PM',
//     text: 'Hey, how\'s it going? What did you do today?',
//     isLiked: false,
//     unread: false,
//   ),
//   Message(
//     sender: sophia,
//     time: '2:30 PM',
//     text: 'Hey, how\'s it going? What did you do today?',
//     isLiked: false,
//     unread: true,
//   ),
//   Message(
//     sender: steven,
//     time: '1:30 PM',
//     text: 'Hey, how\'s it going? What did you do today?',
//     isLiked: false,
//     unread: false,
//   ),
//   Message(
//     sender: sam,
//     time: '12:30 PM',
//     text: 'Hey, how\'s it going? What did you do today?',
//     isLiked: false,
//     unread: false,
//   ),
//   Message(
//     sender: greg,
//     time: '11:30 AM',
//     text: 'Hey, how\'s it going? What did you do today?',
//     isLiked: false,
//     unread: false,
//   ),
// ];

// // EXAMPLE MESSAGES IN CHAT SCREEN
// List<Message> messages = [
//   Message(
//     sender: james,
//     time: '5:30 PM',
//     text: 'Hey, how\'s it going? What did you do today?',
//     isLiked: true,
//     unread: true,
//   ),
//   Message(
//     sender: currentUser,
//     time: '4:30 PM',
//     text: 'Just walked my doge. She was super duper cute. The best pupper!!',
//     isLiked: false,
//     unread: true,
//   ),
//   Message(
//     sender: james,
//     time: '3:45 PM',
//     text: 'How\'s the doggo?',
//     isLiked: false,
//     unread: true,
//   ),
//   Message(
//     sender: james,
//     time: '3:15 PM',
//     text: 'All the food',
//     isLiked: true,
//     unread: true,
//   ),
//   Message(
//     sender: currentUser,
//     time: '2:30 PM',
//     text: 'Nice! What kind of food did you eat?',
//     isLiked: false,
//     unread: true,
//   ),
//   Message(
//     sender: james,
//     time: '2:00 PM',
//     text: 'I ate so much food today.',
//     isLiked: false,
//     unread: true,
//   ),
// ];
