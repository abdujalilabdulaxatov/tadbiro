import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadbiro_ap/controller/event_controller.dart';
import 'package:tadbiro_ap/data/event_model.dart';
import 'package:tadbiro_ap/services/events/event_http_services.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _nameController = TextEditingController();
  final _dayController = TextEditingController();
  final _timeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _globalKey = GlobalKey<FormState>();

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
      initialDate: DateTime.now(),
    );
    if (_picked != null) {
      _dayController.text = _picked.toString().split(" ")[0];
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        initialEntryMode: TimePickerEntryMode.dial);
    if (timeOfDay != null) {
      _timeController.text = "${timeOfDay.hour}:${timeOfDay.minute}";
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventController = Provider.of<EventController>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Tadbir qo'shish",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 40,
            )),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          const Gap(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Iltimos tadbir nomini kiriting !";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Tadbir nomi",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow))),
                  ),
                  const Gap(20),
                  TextFormField(
                    readOnly: true,
                    controller: _dayController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Iltimos tadbir kunini kiriting !";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            _selectDate();
                          },
                          icon: const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "kuni",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow))),
                  ),
                  const Gap(20),
                  TextFormField(
                    readOnly: true,
                    controller: _timeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Iltimos tadbir vaqtini kiriting !";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: "Vaqti",
                        suffixIcon: IconButton(
                          onPressed: () {
                            _selectTime();
                          },
                          icon: Icon(
                            Icons.access_time,
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow))),
                  ),
                  const Gap(20),
                  SizedBox(
                    height: 150,
                    child: TextFormField(
                      controller: _descriptionController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Iltimos tadbir haqida ma'lumot kiriting !";
                        }
                        return null;
                      },
                      maxLines: null,
                      expands: true,
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.white),
                          hintText: "Tadbir haqida ma'lumot:",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow))),
                    ),
                  ),
                  const Gap(20),
                  const Text(
                    "Rasim yoki video yuklash",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 180,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.grey,
                                size: 60,
                              ),
                              Text(
                                "Rasim",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.videocam_outlined,
                                color: Colors.grey,
                                size: 70,
                              ),
                              Text(
                                "Video",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(40),
                  const Text(
                    "Manzilni belgilash",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const Gap(10),
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  const Gap(80),
                  GestureDetector(
                    onTap: () async {
                      if (_globalKey.currentState!.validate()) {
                        final pref = await SharedPreferences.getInstance();
                        await eventController.addEvent(EventModel(
                            event_id: "",
                            event_user_id: pref.getString("localId").toString(),
                            description: _descriptionController.text,
                            name: _nameController.text,
                            event_time: _timeController.text,
                            event_location: _locationController.text,
                            event_date: _dayController.text));
                        Navigator.pop(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.yellowAccent, width: 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            "Saqlash",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
