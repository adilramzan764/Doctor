import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class viewjk extends StatefulWidget {
  const viewjk({Key? key}) : super(key: key);

  @override
  State<viewjk> createState() => _viewjkState();
}

class _viewjkState extends State<viewjk> {
  final List<String> names = ['shadw', 'john','smith'];

  final List<String> items = ['call back', 'home','call back'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(items[index],
                ),
                // if(items[index]=='call back')
                Text(names[index],style: TextStyle(color: items[index]=='call back'? Colors.grey :Colors.black),)
              ],
            );
          },
        )
    );

  }
}
