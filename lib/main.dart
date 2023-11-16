import 'package:flutter/material.dart';
import 'package:more_widgets/carts_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CartPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String title = "Cat";
String dropDownValue = "KIA";

class _HomePageState extends State<HomePage> {
  Color color = Colors.red;
  bool isExpansioned = false;
  List colors = ["Red", "Blue"];
  String slectedColor = "Red";
  bool isSelected = false;
  bool isDeleted = false;
  Color selectedChipColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Draggable(
                childWhenDragging: const Text("Daragged done"),
                data: Colors.orange,
                feedback: Container(
                  color: Colors.orange.withOpacity(0.5),
                  width: 250,
                  height: 250,
                  child: const Center(
                    child: Text(
                      "Drag me",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                child: Container(
                  color: Colors.orange,
                  width: 200,
                  height: 200,
                  child: const Center(
                    child: Text(
                      "Drag me ....",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              DragTarget(onAccept: (Color newColor) {
                setState(() {
                  color = newColor;
                });
              }, builder: (context, accepted, rejected) {
                return Container(
                  color: accepted.isEmpty ? color : Colors.grey.shade200,
                  width: 300,
                  height: 300,
                  child: const Center(
                    child: Text(
                      "Drag to here",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
          ExpansionTile(
            // trailing: isExpansioned
            //     ? const Icon(Icons.arrow_drop_down_circle)
            //     : const Icon(Icons.arrow_drop_down),
            onExpansionChanged: (value) {
              setState(() {
                isExpansioned = value;
              });
            },
            backgroundColor: Colors.orange,
            title: const Text("User1"),
            children: const [
              Text("id: 123"),
              Text("name : Mohammad"),
              Text("age : 25"),
            ],
          ),
          ListTile(
            title: Text(title),
            trailing: PopupMenuButton(
              initialValue: "Cat",
              onSelected: (value) => setState(
                () {
                  title = value;
                },
              ),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: "Cat",
                  child: Text("Cat"),
                ),
                const PopupMenuItem(
                  value: "Dog",
                  child: Text("Dog"),
                ),
                const PopupMenuItem(
                  value: "Hammster",
                  child: Text("Hammster"),
                ),
              ],
            ),
          ),
          DropdownButton(
            isExpanded: true,
            value: dropDownValue,
            items: const [
              DropdownMenuItem<String>(
                value: "BMW",
                child: Text("BMW"),
              ),
              DropdownMenuItem<String>(
                value: "DODGE",
                child: Text("DODGE"),
              ),
              DropdownMenuItem<String>(
                value: "KIA",
                child: Text("KIA"),
              ),
            ],
            onChanged: (value) {
              setState(
                () {
                  dropDownValue = value!;
                },
              );
            },
          ),
          Tooltip(
            message: "Show Bottom Sheet",
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    isDismissible: false,
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 500,
                        child: Center(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Close")),
                        ),
                      );
                    });
              },
              child: const Text("Show BottomSheet"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Warning"),
                    content: const Text("Alert"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Close"),
                      )
                    ],
                  );
                },
              );
            },
            child: const Text("Show Dialog"),
          ),
          ListTile(
            title: const Text("Red"),
            leading: Radio(
              value: colors[0],
              groupValue: slectedColor,
              onChanged: (value) {
                setState(() {
                  slectedColor = value.toString();
                });
              },
            ),
          ),
          ListTile(
            title: const Text("Blue"),
            leading: Radio(
              value: colors[1],
              groupValue: slectedColor,
              onChanged: (value) {
                setState(() {
                  slectedColor = value.toString();
                });
              },
            ),
          ),
          const Chip(
            avatar: CircleAvatar(
              child: Text("A"),
            ),
            label: Text("Chip"),
          ),
          FilterChip(
            selected: isSelected,
            label: const Text("Filter Chip"),
            onSelected: (value) => setState(
              () {
                isSelected = value;
              },
            ),
          ),
          isDeleted
              ? Container()
              : InputChip(
                  label: const Text("input Chip"),
                  onDeleted: () {
                    setState(
                      () {
                        isDeleted = !isDeleted;
                      },
                    );
                  },
                ),
          ActionChip(
            tooltip: "Action Chip",
            label: const Text("Action Chip"),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("I Was Called By Action Chip"),
                ),
              );
            },
          ),
          ChoiceChip(
            backgroundColor: Colors.yellow,
            selectedColor: selectedChipColor,
            // disabledColor: Colors.yellow,
            // color: MaterialStateProperty.all(Colors.red),
            // isSelected ? Colors.red : Colors.yellow),
            label: const Text("Choise Chip"),
            selected: isSelected,
            onSelected: (value) {
              setState(
                () {
                  isSelected = value;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
