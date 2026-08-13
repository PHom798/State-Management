import 'package:flutter/material.dart';
import 'package:task1_nextgenatix/screens/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isFirstTaskDone = false;
  bool _isSecondTaskDone = false;
  bool _isThirdTaskDone = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Home header content
              Row(
                children: [
                  Text(
                    "Good morning, ",
                    style: TextStyle(
                      fontFamily: 'Fraunces',
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Color(0xff171827),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Hom 👋",
                      style: TextStyle(
                        fontFamily: 'Fraunces',
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        color: Color(0xff171827),
                      ),
                    ),
                  ),
                  Icon(Icons.notifications_active_outlined),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                "Let's get things done.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Color(0xff77798A),
                ),
              ),

              //Progress Card
              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xffF4F1FF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        const Text(
                          'Today\'s Progress',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff171827),
                          ),
                        ),
                        const Text(
                          '4 / 7 Tasks',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff77798A),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 4 / 7,
                        minHeight: 10,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              //Section Header
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  const Text(
                    "Today's tasks",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff171827),
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        color: Color(0xff77798A),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              TaskCard(
                text1: 'Complete Flutter UI',
                text2: 'Today · 10:00 AM',
                isCompleted: _isFirstTaskDone,
                onChanged: (bool? value) {
                  setState(() {
                    _isFirstTaskDone = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 10),

              TaskCard(
                text1: 'Review Code Structure',
                text2: 'Tomorrow · 2:00 PM',
                isCompleted: _isSecondTaskDone,
                onChanged: (bool? value) {
                  setState(() {
                    _isSecondTaskDone = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 10),

              TaskCard(
                text1: 'Define unit and widget tests',
                text2: 'Tomorrow · 9:00 PM',
                isCompleted: _isThirdTaskDone,
                onChanged: (bool? value) {
                  setState(() {
                    _isThirdTaskDone = value ?? false;
                  });
                },
              ),
              const SizedBox(height: 10),

              TaskCard(
                text1: 'Review Project Structure',
                text2: 'Completed',
                isCompleted: _isThirdTaskDone,
                onChanged: (bool? value) {
                  setState(() {
                    _isThirdTaskDone = value ?? false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Add task"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
