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
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black ,
                blurRadius: 10
                , blurStyle: BlurStyle.outer
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black54 ,
                        blurRadius: 10
                        , blurStyle: BlurStyle.outer
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(),
                ),
                height: 100,
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(image),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
