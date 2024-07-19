import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 30,
              )),
          title: Text("Xabarlar"),
        ),
        body: ListView.builder(
            itemCount: 4,
            itemBuilder: (ctx, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("asset/images/tadbiro_logo.png"),
                        radius: 25,
                      ),
                      title: Text(
                        "Botir Murodov",
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text("22:00 19-iyun 2024"),
                    ),
                    Container(
                      width: 400,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                          "Universitetlar bo'yicha tadbirda qatnashish uchun niyatim bor edi, qabul qila olasizmi ?"),
                    )
                  ],
                ),
              );
            }));
  }
}
