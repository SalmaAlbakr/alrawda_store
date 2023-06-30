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
      child: Card(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(15),
        //   border: Border.all(),
        // ),
        child: Column(
          children: [
            Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(15),
                //   border: Border.all(),
                // ),
                child: Image.asset(MyList1[i][1])
            ),
            // CircleAvatar(
            //   radius: 60,
            //   backgroundImage: AssetImage(MyList1[i][1]),
            //   // child: Image.asset(MyList1[i][1])
            // ),
            SizedBox(
              height: 15,
            ),
            Text(
              MyList1[i][0],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
