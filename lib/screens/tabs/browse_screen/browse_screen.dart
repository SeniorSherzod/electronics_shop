import 'package:electronics_shop/utils/connstants/app_const.dart';
import 'package:electronics_shop/widgets/universal_textfield.dart';
import 'package:flutter/material.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {

  final TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BrowseScreen"),

      ),
      body: Column(
        children: [
          UniversalTextFormField(
              hintText: "serach",
              onChanged: (value){},
              onSubmit: (v){},
              controller: search,
              errorText: "xato",
              type: TextInputType.name,
              regExp: AppConstants.textRegExp,
              isVisible: false)
        ],
      ),
    );
  }
}
