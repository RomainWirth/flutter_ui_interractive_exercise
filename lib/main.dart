import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Gender {man, woman}

class _MyHomePageState extends State<MyHomePage> {
  List<String> ageList = ['18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48'];

  late TextEditingController firstNameEditingController;
  late TextEditingController lastNameEditingController;
  late String ageValue;
  // late TextEditingController passwordController;
  late Gender gender;

  @override
  void initState() {
    super.initState();
    firstNameEditingController = TextEditingController();
    lastNameEditingController = TextEditingController();
    ageValue = ageList[0];
    // passwordController = TextEditingController();
    gender = Gender.man;
  }

  @override
  void dispose() {
    firstNameEditingController.dispose();
    lastNameEditingController.dispose();
    // passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.greenAccent,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://media.istockphoto.com/id/1309328823/fr/photo/verticale-headshot-de-lemploy%C3%A9-masculin-de-sourire-dans-le-bureau.jpg?s=612x612&w=0&k=20&c=hCqYTwKfIW4Fp6_j_P-p8kMXB4b0H3mrajayCBd7JJw='),
                            radius: 50,
                          ),
                          Text(' ${firstNameEditingController.text} ${lastNameEditingController.text}'),
                          Text(' ${ageValue} y/o')
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     if (gender == Gender.woman) {
                      //       Icon(
                      //         Icons.female,
                      //       ),
                      //       Text(gender),
                      //     } else {
                      //       Icon(
                      //         Icons.male,
                      //       ),
                      //       Text(gender),
                      //     }
                      //   ]
                      // )
                    ],
                  )
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: firstNameEditingController,
                        onChanged: ((value) => setState(() {})),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: lastNameEditingController,
                        onChanged: ((value) => setState(() {})),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Select your age :'),
                          DropdownButton<String>(
                            items: ageList.map((age) {
                              return DropdownMenuItem(
                                value: age,
                                child: Text(age),
                              );
                            }).toList(),
                            value: ageValue,
                            onChanged: (newValue) {
                              setState(() {
                                ageValue = newValue!;
                              });
                            }
                          ),
                        ],
                      )
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        children: [
                          const Text('I\'m...'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RadioListTile(
                                title: const Text('man'),
                                value: Gender.man,
                                groupValue: gender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                }
                              ),
                              RadioListTile(
                                title: const Text('woman'),
                                value: Gender.woman,
                                groupValue: gender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                }
                              ),
                            ],
                          )
                        ],
                      )
                    )
                  ],
                )
              ]
            ),
          ],
        ),
      ),
    );
  }
}
