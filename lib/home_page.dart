import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test01/info_screen.dart';
import 'package:test01/state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Initialize the Fibonacci sequence with symbols when the widget is created
    Provider.of<Todo>(context, listen: false).fibonacciWithSymbols(41);
  }

  void _openInfoScreen(int index, int number, IconData icon) {
    // Open the InfoScreen in a modal bottom sheet
    showModalBottomSheet(
      context: context,
      builder: (ctx) => InfoScreen(
        index: index,
        number: number,
        icon: icon,
      ),
    );
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Consumer<Todo>(
        builder: (context, todo, child) {
          return ListView.builder(
            itemCount: todo.symbols.length,
            itemBuilder: (context, index) {
              bool isSelected = todo.lastSelectedIndex == index;
              bool isRecentlyAdded = index == todo.lastSelectedIndex;

              return ListTile(
                title: Text(
                  'Index ${todo.symbols[index]["index"]}: Number: ${todo.symbols[index]["number"]}',
                ),
                trailing: Icon(todo.symbols[index]["icon"]),
                tileColor: isRecentlyAdded ? Colors.red.withOpacity(0.5) : null,
                onTap: () {
                  _openInfoScreen(
                    todo.symbols[index]["index"],
                    todo.symbols[index]["number"],
                    todo.symbols[index]["icon"],
                  );
                  Provider.of<Todo>(context, listen: false).addTask(
                      todo.symbols[index]["index"],
                      todo.symbols[index]["number"],
                      todo.symbols[index]["icon"]);

                  Provider.of<Todo>(context, listen: false).delete(index);
                  Provider.of<Todo>(context, listen: false)
                      .updateLastSelectedIndex(index);
                },
              );
            },
          );
        },
      ),
    );
  }
}
