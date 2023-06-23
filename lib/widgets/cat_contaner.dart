import 'package:flutter/material.dart';

class NewWidget extends StatelessWidget {
  NewWidget({
    Key? key,
    required this.MyList1,
    required this.i,
  }) : super(key: key);

  final List MyList1;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(),
        ),
        child: Column(
          children: [
            Image.asset(MyList1[i][1]),
            Text(MyList1[i][0]),
          ],
        ),
      ),
    );
  }
}