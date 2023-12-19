import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

/// tile class
class Tile {
  int state;
  String job;

  Tile(this.state, this.job);
}

class _HomePageState extends State<HomePage> {
  List<Tile> tileList = [];

  List<Tile> sortedList(int state) {
    List<Tile> sortedList = [];

    for (Tile tile in tileList) {
      if (tile.state == state) {
        sortedList.add(tile);
      }
    }
    return sortedList;
  }

  @override
  Widget build(BuildContext context) {
    var backlogList = sortedList(0);
    var progressList = sortedList(1);
    var doneList = sortedList(2);

    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List with three state"),
      ),
      body: tileList.isEmpty
          ? Center(child: Text("Please make a Tile!"))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: SizedBox(
                      height: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Card(
                              elevation: 5,
                              child: SizedBox(
                                height: 36,
                                width: 128,
                                child: Center(
                                  child: Text(
                                    "Backlog",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: ListView.builder(
                                itemCount: backlogList.length,
                                itemBuilder: (context, index) {
                                  Tile tile = backlogList[index];
                                  return ListTile(
                                    title: Text(
                                      tile.job,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(CupertinoIcons.delete),
                                      onPressed: () {
                                        showDeleteDialog(
                                          context,
                                          tile,
                                        );
                                      },
                                    ),
                                    onTap: () {
                                      setState(() {
                                        tile.state = tile.state + 1;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: SizedBox(
                      height: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Card(
                              elevation: 5,
                              child: SizedBox(
                                height: 36,
                                width: 128,
                                child: Center(
                                  child: Text(
                                    "Progress",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: ListView.builder(
                                itemCount: progressList.length,
                                itemBuilder: (context, index) {
                                  Tile tile = progressList[index];
                                  return ListTile(
                                    title: Text(
                                      tile.job,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(CupertinoIcons.delete),
                                      onPressed: () {
                                        showDeleteDialog(
                                          context,
                                          tile,
                                        );
                                      },
                                    ),
                                    onTap: () {
                                      setState(() {
                                        tile.state = tile.state + 1;
                                      });
                                    },
                                    onLongPress: () {
                                      setState(() {
                                        tile.state = tile.state - 1;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: SizedBox(
                      height: double.infinity,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Card(
                              elevation: 5,
                              child: SizedBox(
                                height: 36,
                                width: 128,
                                child: Center(
                                  child: Text(
                                    "Done",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: ListView.builder(
                                itemCount: doneList.length,
                                itemBuilder: (context, index) {
                                  Tile tile = doneList[index];
                                  return ListTile(
                                    title: Text(
                                      tile.job,
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(CupertinoIcons.delete),
                                      onPressed: () {
                                        showDeleteDialog(
                                          context,
                                          tile,
                                        );
                                      },
                                    ),
                                    onLongPress: () {
                                      setState(() {
                                        tile.state = tile.state - 1;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          String? job = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CreatePage()),
          );
          if (job != null) {
            setState(() {
              Tile newTile = Tile(0, job);
              tileList.add(newTile);
            });
          }
        },
      ),
    );
  }

  void showDeleteDialog(BuildContext context, Tile tile) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Do you want to delete this tile?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tileList.remove(tile);
                });
                Navigator.pop(context);
              },
              child: Text(
                "Yes",
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Making new tile page
class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController textController = TextEditingController();

  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Making Tile"),
        leading: IconButton(
          icon: Icon(CupertinoIcons.chevron_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: textController,
              autofocus: true,
              decoration: InputDecoration(
                errorText: error,
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                child: Text(
                  "add",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  String job = textController.text;
                  if (job.isEmpty) {
                    setState(() {
                      error = "Please typing contents.";
                    });
                  } else {
                    setState(() {
                      error = null;
                    });
                    Navigator.pop(context, job);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
