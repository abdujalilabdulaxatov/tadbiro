import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tadbiro_ap/ui/screens/home/home_screen.dart';

class ReminderAlertDialog extends StatefulWidget {
  const ReminderAlertDialog({super.key});

  @override
  State<ReminderAlertDialog> createState() => _ReminderAlertDialogState();
}

class _ReminderAlertDialogState extends State<ReminderAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Eslatma kuni",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 300,
          ),
          Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                      hintText: "dd/mm/yyyy",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_month)),
                ),
              ),
              const Gap(20),
              const Text(
                "Eslatma vaqti",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
              ),
              const Gap(20),
              GestureDetector(
                onTap: () {},
                child: TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                      hintText: "hh : mm",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.access_time)),
                ),
              ),
              const Gap(40),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context, builder: (ctx) => const HomeScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        "Eslatish",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
