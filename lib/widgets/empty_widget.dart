import 'package:flutter/material.dart';

Widget emptyWidget(BuildContext context){
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.blue,
            image: const DecorationImage(
              image: AssetImage('assets/images/empty.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          "Nothing to see here...",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "Montserrat",
          ),
        )
      ],
    ),
  );
}