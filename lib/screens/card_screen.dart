import 'package:flutter/material.dart';
import 'package:fl_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Card Widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: const [
            CustomCardType1(),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  "https://cdn.pixabay.com/photo/2020/04/28/04/05/beautiful-landscape-5102555_960_720.jpg",
              name: "Esto es un campo",
            ),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3K7OYr57WMNadSAuQVC7pR-VmktDNWiR6dw&usqp=CAU",
              name: "Esto antes era campo",
            ),
            SizedBox(height: 10),
            CustomCardType2(
              imageUrl:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRubDCXG9XsagIAd7p-4dZVJlPo9FBuPW9sJQ&usqp=CAU",
              name: "Highway to hell",
            ),
            SizedBox(height: 100),
          ],
        ));
  }
}
