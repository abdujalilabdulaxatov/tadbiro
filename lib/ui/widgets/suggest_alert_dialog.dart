import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tadbiro_ap/ui/screens/home/home_screen.dart';
import 'package:tadbiro_ap/ui/widgets/reminder_alert_dialog.dart';

class SuggestAlertDialog extends StatefulWidget {
  const SuggestAlertDialog({super.key});

  @override
  State<SuggestAlertDialog> createState() => _SuggestAlertDialogState();
}

class _SuggestAlertDialogState extends State<SuggestAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Image(
            image: AssetImage("asset/images/check.gif"),
            height: 250,
          ),
          const Text(
            "Tabriklaymiz!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          const Gap(20),
          const Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (ctx) => const ReminderAlertDialog());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    "Eslatmani belgilash",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              showDialog(context: context, builder: (ctx) => HomeScreen());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                    )),
                child: const Center(
                  child: Text(
                    "Bosh sahifa",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
