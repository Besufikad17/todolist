import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:todolist/presentation/components/popup.dart';
import 'package:todolist/presentation/components/text.dart';
import 'package:todolist/presentation/screens/home.dart';
import 'package:todolist/utils/constants/enums.dart';
import 'package:todolist/utils/constants/strings.dart';

class MySideBar extends StatelessWidget {
  const MySideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onPrimary;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: CachedNetworkImage(
                imageUrl: defaultProfilePicture,
                placeholder: (context, url) => CircularProgressIndicator(color: textColor,),
                errorWidget: (context, url, error) => Icon(Icons.error, color: textColor,),
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(height: 20,),
            MyText(text: "Besufikad Micheal", size: 16, isBold: true,),
            const SizedBox(height: 40,),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
              },
              child: Row(
                children: [
                  const Icon(Icons.home),
                  const SizedBox(width: 10,),
                  MyText(text: "Home", size: 16)
                ],
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                
              },
              child: Row(
                children: [
                  const Icon(Icons.archive),
                  const SizedBox(width: 10,),
                  MyText(text: "Archive", size: 16)
                ],
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                
              },
              child: Row(
                children: [
                  const Icon(Icons.settings),
                  const SizedBox(width: 10,),
                  MyText(text: "Settings", size: 16)
                ],
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context, 
                  builder: (BuildContext context) {
                    return AlertPopup(
                      title: "About", 
                      type: AlertType.message, 
                      body: Expanded(
                        child: MyText(
                          text: "Todolist is a simple todo list app using clean architecture and" 
                          "other best practices used in flutter. Don't forget to 🌟 the repo 😜.", 
                          size: 12,
                          overflow: TextOverflow.visible
                        ),
                      )
                    );
                  }
                );
              },
              child: Row(
                children: [
                  const Icon(Icons.info),
                  const SizedBox(width: 10,),
                  MyText(text: "About", size: 16)
                ],
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                
              },
              child: Row(
                children: [
                  const Icon(Icons.logout),
                  const SizedBox(width: 10,),
                  MyText(text: "Logout", size: 16)
                ],
              ),
            ),
            const SizedBox(height: 200,),
            MyText(text: "Todolist", size: 12),
            const SizedBox(height: 5,),
            MyText(text: "V0.0.2", size: 13, isBold: true,)
          ],
        ),
      ),
    );
  }
}