// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:test01/state.dart';

// class InfoScreen extends StatelessWidget {
//   final int index;
//   final int number;
//   final IconData icon;
//   final Function(int, int, IconData) onAddTask;

//   const InfoScreen({
//     Key? key,
//     required this.index,
//     required this.number,
//     required this.icon,
//     required this.onAddTask,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           ListTile(
//             title: Text('Number: $number'),
//             subtitle: Text('Index: $index'),
//             trailing: Icon(icon, size: 50),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Provider.of<Todo>(context, listen: false).addTask2({
//                 "index": index,
//                 "number": number,
//                 "icon": icon,
//               });
//               Navigator.pop(context); // Close the bottom sheet
//             },
//             child: Text('Add Task'),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test01/state.dart';

class InfoScreen extends StatelessWidget {
  final int index;
  final int number;
  final IconData icon;

  const InfoScreen({
    Key? key,
    required this.index,
    required this.number,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todo = context.watch<Todo>();
    var symbols2 = todo.symbols2.where((task) => task["icon"] == icon).toList();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: symbols2.length,
              itemBuilder: (context, idx) {
                bool isSelected = todo.lastSelectedIndex == idx;
                return GestureDetector(
                  onTap: () {
                    todo.updateLastSelectedIndex(idx);
                    Provider.of<Todo>(context, listen: false).addTask2(
                        symbols2[idx]["index"],
                        symbols2[idx]["number"],
                        symbols2[idx]["icon"]);
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: isSelected
                        ? Colors.green.withOpacity(0.5)
                        : Colors.transparent,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Number: ${symbols2[idx]["number"]}'),
                          subtitle: Text('Index: ${symbols2[idx]["index"]}'),
                          trailing: Icon(symbols2[idx]["icon"], size: 50),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
