import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itbeesolutionstest/config/task_model.dart';
import 'package:itbeesolutionstest/utils/color_constant.dart';

class DialogWidget {
  DialogWidget._();

  static final DialogWidget _instance = DialogWidget._();

  static DialogWidget get instance => _instance;

  Future<bool?> showYesNoDialog(BuildContext context, String title, String message) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(message),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text("No", style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text("Yes", style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
  void popupHandTask(
      BuildContext context,Function(int id,String title, String description, String date, String priority)
          onCreate ,{TaskModel? task} ) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    DateTime? selectedDate;
    String priority = "MEDIUM";
    if(task != null){
      nameController.text = task.title ?? '';
      descriptionController.text = task.description ?? '';
      selectedDate = DateFormat("dd/MM/yyyy").parse(task.dueDate);
      priority = task.priority?.name == 'high' ? 'HIGH' : 'MEDIUM';
    }
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Task",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    _buildShadowTextField(
                      label: "Name",
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildShadowTextField(
                      label: "Description",
                      child: TextField(
                        controller: descriptionController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildShadowTextField(
                      label: "Select Date",
                      child: InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null) {
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Text(
                            selectedDate == null
                                ? "Choose a date"
                                : DateFormat('dd/MM/yyyy')
                                    .format(selectedDate!),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildShadowTextField(
                      label: "Priority",
                      child: DropdownButtonFormField<String>(
                        value: priority,
                        items: ["HIGH", "MEDIUM"].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            priority = newValue!;
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        onCreate(
                          task?.id ?? -1,
                          nameController.text,
                          descriptionController.text,
                          selectedDate != null
                              ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                              : DateFormat('yyyy-MM-dd').format(
                                  DateTime.now().add(Duration(days: 360))),
                          priority,
                        );
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.welcomeBack,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(task!= null ? "Update Task" : "Create Task"),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildShadowTextField({required String label, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),

            child: child,
          ),
        ),
      ],
    );
  }
// Navigator.of(context, rootNavigator: true).pop(true),
}
