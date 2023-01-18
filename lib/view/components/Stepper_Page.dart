import 'package:flutter/material.dart';

class Stepper_Page extends StatefulWidget {
  const Stepper_Page({Key? key}) : super(key: key);

  @override
  State<Stepper_Page> createState() => _Stepper_PageState();
}

class _Stepper_PageState extends State<Stepper_Page> {
  @override
  int initialstap = 0;

  Widget build(BuildContext context) {
    return Container(
      child: Stepper(
        currentStep: initialstap,
        type: StepperType.vertical,
        onStepTapped: (value) {
          setState(() {
            initialstap = value;
          });
        },
        onStepContinue: () {
          setState(() {
            if (initialstap < 2) {
              ++initialstap;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (initialstap > 0) {
              --initialstap;
            }
          });
        },
        controlsBuilder: (context, detaile) {
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      child: Text("Next"), onPressed: detaile.onStepContinue),
                ),
                SizedBox(width: 7),
                Expanded(
                  child: OutlinedButton(
                      child: Text("Cancel"), onPressed: detaile.onStepCancel),
                ),
              ],
            ),
          );
        },
        steps: [
          Step(
            title: const Text("PROFILE PHOTO"),
            content: Stack(
              alignment: Alignment.bottomRight,
              children: [
               const CircleAvatar(
                  radius: 50,
                  child: Image(
                    image: AssetImage("assets/images/Profile.png"),
                  ),
                  backgroundColor: Colors.grey,
                ),
                FloatingActionButton(
                    onPressed: () {}, child: Icon(Icons.add), mini: true),
              ],
            ),
            isActive: (initialstap >= 0) ? true : false,
            label: const Text("Labal 1"),
            subtitle: const Text("Add profile photo"),
            state: StepState.indexed,
          ),
          Step(
            title: const Text("NAME"),
            content: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ex. Arshit Vadsak",
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            isActive: (initialstap >= 1) ? true : false,
            label: const Text("Labal 2"),
            subtitle: const Text("Enter name"),
            //state: ,
          ),
          Step(
            title: const Text("DISCRIPTION"),
            content: TextFormField(
              decoration: InputDecoration(
                hintText: "Ex. Welcome to....",
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            isActive: (initialstap >= 2) ? true : false,
            label: const Text("Labal 3"),
            subtitle: const Text("Enter discription"),
            //state: ,
          ),
        ],
      ),
    );
  }
}
