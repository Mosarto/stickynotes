import 'package:flutter/material.dart';
import 'package:stickynotes/data/data.dart';
import 'package:stickynotes/widget/background.dart';
import 'package:intl/intl.dart';

class NoteScreen extends StatefulWidget {
  final String documentID;
  const NoteScreen({
    Key? key,
    required this.documentID,
  }) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Document document;

  bool share = true;
  String data = '';

  void showShare() {
    setState(() {
      share = !share;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      if (share) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 265),
    );
    super.initState();
    super.initState();
    document = documents.firstWhere(
      (element) => element.id == widget.documentID,
    );
    DateTime dt = DateFormat('dd/MM/yyyy').parse(document.date);
    data = DateFormat('d MMM, yyyy').format(dt);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            data,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showShare();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/png/share.png',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/png/check.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          leading: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 22),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  alignment: Alignment.center,
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset('assets/png/arrow_left.png'),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      document.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 32,
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                            left: 8,
                            right: 12,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.all(
                              Radius.circular(44),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add_circle_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Add tag',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        for (final categorie in document.categories) ...[
                          Container(
                            height: 32,
                            margin: const EdgeInsets.only(left: 6),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 8,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.all(
                                Radius.circular(44),
                              ),
                            ),
                            child: Text(
                              categorie,
                              style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 22,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: document.image,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      document.note,
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                    for (final argunt in document.argunts) ...[
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.all(12),
                        height: 102,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            width: 1,
                            color: const Color(0xffE7E7E7),
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 78,
                              width: 111,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                  image: argunt.image,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        argunt.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 20,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            width: 1,
                                            color: const Color(0xffE7E7E7),
                                          ),
                                        ),
                                        child: Image.asset(
                                          'assets/png/more.png',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 22.0),
                                    child: Text(
                                      argunt.decription,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                        height: 1.4,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Image.asset('assets/png/source.png'),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        argunt.url,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: share ? 60 : MediaQuery.of(context).size.height / 2.1,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
              horizontal: share ? 20 : 0, vertical: share ? 14 : 0),
          padding: EdgeInsets.only(
            top: share ? 20 : 12,
            left: 20,
            right: 20,
            bottom: share ? 20 : 22,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(share ? 76 : 30),
              topRight: Radius.circular(share ? 76 : 30),
              bottomLeft: Radius.circular(share ? 76 : 0),
              bottomRight: Radius.circular(share ? 76 : 0),
            ),
            boxShadow: [
              share
                  ? const BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 0,
                      blurRadius: 74,
                      offset: Offset(0, 34), // changes position of shadow
                    )
                  : const BoxShadow(
                      color: Colors.black45,
                      spreadRadius: 0,
                      blurRadius: 74,
                      offset: Offset(0, -34),
                    ),
            ],
          ),
          child: share == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/png/font.png',
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset('assets/png/mic2.png'),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset('assets/png/gallery.png'),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset('assets/png/pencil.png'),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset('assets/png/more2.png'),
                    ),
                  ],
                )
              : FadeTransition(
                  opacity: _controller,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 2,
                        width: 65,
                        decoration: BoxDecoration(
                          color: const Color(0xff979797),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const Text(
                        'Share with your friends',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 50,
                              child: Column(
                                children: [
                                  Container(
                                    height: 42,
                                    width: 42,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 0,
                                          blurRadius: 12,
                                          offset: Offset(
                                            8,
                                            8,
                                          ), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      'assets/png/whatsapp.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    'Whatsapp',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 50,
                              child: Column(
                                children: [
                                  Container(
                                    height: 42,
                                    width: 42,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 0,
                                          blurRadius: 12,
                                          offset: Offset(
                                            8,
                                            8,
                                          ), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      'assets/png/email.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    'Email',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 50,
                              child: Column(
                                children: [
                                  Container(
                                    height: 42,
                                    width: 42,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 0,
                                          blurRadius: 12,
                                          offset: Offset(
                                            8,
                                            8,
                                          ), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      'assets/png/messenger.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    'Messenger',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: 50,
                              child: Column(
                                children: [
                                  Container(
                                    height: 42,
                                    width: 42,
                                    decoration: const BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 0,
                                          blurRadius: 12,
                                          offset: Offset(
                                            8,
                                            8,
                                          ), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Image.asset(
                                      'assets/png/instagram.png',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    'Instagram',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 60,
                            width: 65,
                            child: Column(
                              children: [
                                Container(
                                  height: 42,
                                  width: 42,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 0,
                                        blurRadius: 12,
                                        offset: Offset(
                                          8,
                                          8,
                                        ), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    'assets/png/person1.png',
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  'Floyd Miles',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: 65,
                            child: Column(
                              children: [
                                Container(
                                  height: 42,
                                  width: 42,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 0,
                                        blurRadius: 12,
                                        offset: Offset(
                                          8,
                                          8,
                                        ), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    'assets/png/person2.png',
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  'Mylonzin',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: 65,
                            child: Column(
                              children: [
                                Container(
                                  height: 42,
                                  width: 42,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 0,
                                        blurRadius: 12,
                                        offset: Offset(
                                          8,
                                          8,
                                        ), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    'assets/png/person3.png',
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  'Jane Cooper',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            width: 65,
                            child: Column(
                              children: [
                                Container(
                                  height: 42,
                                  width: 42,
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 0,
                                        blurRadius: 12,
                                        offset: Offset(
                                          8,
                                          8,
                                        ), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    'assets/png/person4.png',
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                const Text(
                                  'Kristin Watson',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 78,
                        decoration: BoxDecoration(
                          color: const Color(
                            0xffF2F8FF,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 38,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Copy Link:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '00089799/How to becocome a productiv...',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: const Color(0xff171c26)
                                          .withOpacity(0.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset('assets/png/copy.png'),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            share = true;
                          });
                          _controller.reverse();
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(
                              0xff35B67F,
                            ),
                            borderRadius: BorderRadius.circular(56),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
