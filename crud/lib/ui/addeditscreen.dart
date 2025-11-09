import 'package:crud/controllers/item_controller.dart';
import 'package:crud/utils/app_button.dart';
import 'package:crud/utils/app_colors.dart';
import 'package:crud/utils/textfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addeditscreen extends StatefulWidget {
  final bool isEditing;
  final int? index;
  final String? initialText;
  final String? initialDuration;
  const Addeditscreen({
    super.key,
    required this.isEditing,
    this.index,
    this.initialText,
    this.initialDuration,
  });

  @override
  State<Addeditscreen> createState() => _AddeditscreenState();
}

class _AddeditscreenState extends State<Addeditscreen> {
  final ItemController _controller = Get.find();
  final _textController = TextEditingController();
  final _durationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      _textController.text = widget.initialText ?? '';
      _durationController.text = widget.initialDuration ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: GestureDetector(
          onTap: Get.back,
          child: Icon(Icons.arrow_back_ios, color: theme.iconTheme.color),
        ),
        title: Text(
          widget.isEditing ? 'Edit Item' : 'Add Item',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            AppTextField(
              textEditingController: _textController,
              hint: 'Enter Item',
            ),
            SizedBox(height: 20),
            AppTextField(
              textEditingController: _durationController,
              hint: 'Enter Duration',
            ),

            SizedBox(height: 20),
            AppButton(
              onPressed: () {
                final title = _textController.text.trim();
                final duration = _durationController.text.trim();

                if (title.isEmpty || duration.isEmpty) {
                  Get.snackbar(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    'Error',
                    'Title and Duration cannot be empty',
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                if (widget.isEditing) {
                  _controller.updateItem(widget.index!, title, duration);
                } else {
                  _controller.addItem(title, duration);
                }

                Get.back();
              },
              title: widget.isEditing ? 'Save Changes' : 'Add',
            ),
          ],
        ),
      ),
    );
  }
}
