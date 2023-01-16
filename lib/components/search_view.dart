import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
    this.hintText,
    this.readOnly,
    this.onTap,
    this.controller,
    this.searchFocusNode,
    this.isType,
  });

  final String? hintText;
  final bool? readOnly;
  final void Function()? onTap;
  final TextEditingController? controller;
  final FocusNode? searchFocusNode;
  final bool? isType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
        onTap: onTap,
        focusNode: searchFocusNode,
        controller: controller,
        readOnly: readOnly!,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () => controller!.clear(),
                child: Icon(
                  isType! ? Icons.close : Icons.search,
                  size: isType! ? 22.0 : 32.0,
                  color: const Color(0xFF868686).withOpacity(isType! ? 0.5 : 0.3),
                )),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(
                width: 0.0,
                style: BorderStyle.none,
              ),
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(12.0),
            fillColor: const Color(0xFF868686).withOpacity(0.1)),
      ),
    );
  }
}
