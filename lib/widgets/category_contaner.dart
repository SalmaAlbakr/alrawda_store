import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  NewWidget({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(

        child: Column(
          children: [
            Container(
              height: 100,
                width: 100,
                child: Image.network(image)
            ),

            SizedBox(
              height: 15,
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
