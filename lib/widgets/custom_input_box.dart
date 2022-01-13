import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputBox extends StatefulWidget {
  final String headerText;
  final String hintText;
  final Function(String val) onChanged;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final String? initialValue;
  const CustomInputBox({
    Key? key,
    required this.headerText,
    required this.hintText,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.number,
    required this.onChanged,
    this.initialValue,
  }) : super(key: key);

  @override
  State<CustomInputBox> createState() => _CustomInputBoxState();
}

class _CustomInputBoxState extends State<CustomInputBox> {
  late FocusNode _focusNode;
  late TextEditingController _textEditingController;
  bool isFilled = false;
  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.initialValue);
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          isFilled = true;
        });
      } else if (_textEditingController.text == "") {
        setState(() {
          isFilled = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 4, 10),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: (isFilled) ? Colors.white : const Color(0xFFF7F7F7),
        border: (isFilled)
            ? Border.all(
                color: const Color(0xFFE0E0E0),
              )
            : const Border(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.headerText,
            style: GoogleFonts.nunitoSans(
              fontSize: 12,
              color: const Color(0xFF828282),
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: _textEditingController,
            focusNode: _focusNode,
            onChanged: widget.onChanged,
            onFieldSubmitted: (val) {
              if (val == '') {
                setState(() {
                  isFilled = false;
                });
              }
            },
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            cursorColor: const Color(0xFF303030),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isCollapsed: true,
              hintText: widget.hintText,
              hintStyle: GoogleFonts.nunitoSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFBDBDBD),
              ),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
