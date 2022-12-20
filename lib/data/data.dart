import 'package:flutter/material.dart';

class Note {
  String title;
  String date;

  Note({
    required this.title,
    required this.date,
  });
}

class Argunts {
  String title;
  String decription;
  String url;
  AssetImage image;
  Argunts({
    required this.title,
    required this.decription,
    required this.url,
    required this.image,
  });
}

class Document {
  String id;
  String title;
  String date;
  List<String> categories;
  AssetImage image;
  String note;
  List<Argunts> argunts;

  Document({
    required this.id,
    required this.title,
    required this.date,
    required this.categories,
    required this.image,
    required this.note,
    required this.argunts,
  });
}

class Categorie {
  String name;
  Image image;

  Categorie({
    required this.name,
    required this.image,
  });
}

List<Note> notas = [
  Note(title: 'Review my personal pro..', date: '19th Sep,2022'),
  Note(title: 'UX Design tips and tricks', date: '18th Sep,2022'),
  Note(title: 'New Idea Design', date: '12th Sep,2022'),
];

List<Document> documents = [
  Document(
    id: '0',
    title: 'User Interview questions',
    date: '06/08/2022',
    note:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
    categories: [
      'UX Design',
      'Research',
    ],
    image: const AssetImage('assets/png/imagenote1.png'),
    argunts: [
      Argunts(
        title: 'Ux Design Process',
        decription:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
        url: 'https://uxdesign.cc',
        image: const AssetImage('assets/png/colortheory2.png'),
      ),
      Argunts(
        title: 'Ui Design tricks',
        decription:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
        url: 'https://uxdesign.cc',
        image: const AssetImage('assets/png/colortheory4.png'),
      ),
      Argunts(
        title: '10 Color theory',
        decription:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
        url: 'https://uxdesign.cc',
        image: const AssetImage('assets/png/colortheory1.png'),
      ),
    ],
  ),
  Document(
      id: '1',
      title: 'UX Principles & Design Process',
      date: '19/07/2022',
      note:
          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
      categories: [
        'UX Design',
        'Career Advice',
      ],
      image: const AssetImage('assets/png/imagenote2.png'),
      argunts: [
        Argunts(
          title: '10 Color theory',
          decription:
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
          url: 'https://uxdesign.cc',
          image: const AssetImage('assets/png/colortheory3.png'),
        ),
        Argunts(
          title: 'Ux Design Process',
          decription:
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
          url: 'https://uxdesign.cc',
          image: const AssetImage('assets/png/colortheory4.png'),
        ),
        Argunts(
          title: 'Ui Design tricks',
          decription:
              'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
          url: 'https://uxdesign.cc',
          image: const AssetImage('assets/png/colortheory1.png'),
        ),
      ]),
  Document(
    id: '2',
    title: 'How to become more productive in my ux career',
    date: '19/05/2022',
    note:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
    categories: [
      'Blog',
      'UX Design',
      'Career Advice',
    ],
    image: const AssetImage('assets/png/imagenote3.png'),
    argunts: [
      Argunts(
        title: '10 Color theory',
        decription:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
        url: 'https://uxdesign.cc',
        image: const AssetImage('assets/png/colortheory1.png'),
      ),
      Argunts(
        title: 'Ui Design tricks',
        decription:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
        url: 'https://uxdesign.cc',
        image: const AssetImage('assets/png/colortheory4.png'),
      ),
      Argunts(
        title: 'Ux Design Process',
        decription:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
        url: 'https://uxdesign.cc',
        image: const AssetImage('assets/png/colortheory2.png'),
      ),
    ],
  ),
  Document(
    id: '3',
    title: 'How to become a UX Designer',
    date: '23/02/2022',
    note:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
    categories: [
      'UX Design',
      'Research',
    ],
    image: const AssetImage('assets/png/imagenote4.png'),
    argunts: [
      Argunts(
        title: 'Ux Design Process',
        decription:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
        url: 'https://uxdesign.cc',
        image: const AssetImage('assets/png/colortheory2.png'),
      ),
      Argunts(
        title: 'Ui Design tricks',
        decription:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
        url: 'https://uxdesign.cc',
        image: const AssetImage('assets/png/colortheory4.png'),
      ),
      Argunts(
        title: '10 Color theory',
        decription:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
        url: 'https://uxdesign.cc',
        image: const AssetImage('assets/png/colortheory1.png'),
      ),
    ],
  ),
];

List<Categorie> categories = [
  Categorie(
    name: 'All Documents',
    image: const Image(
      image: AssetImage(
        'assets/png/note.png',
      ),
      color: Colors.white,
      height: 12,
    ),
  ),
  Categorie(
    name: 'Reminder',
    image: const Image(
      image: AssetImage(
        'assets/png/reminder.png',
      ),
      height: 12,
    ),
  ),
  Categorie(
    name: 'Image',
    image: const Image(
      image: AssetImage(
        'assets/png/image.png',
      ),
      height: 12,
    ),
  ),
  Categorie(
    name: 'Audio',
    image: const Image(
      image: AssetImage(
        'assets/png/audio.png',
      ),
      height: 12,
    ),
  ),
];
