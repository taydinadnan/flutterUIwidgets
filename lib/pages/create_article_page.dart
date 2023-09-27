import 'package:flutter/material.dart';
import 'package:flutter_ui_widgets/models/form_data.dart';

class CreateArticlePage extends StatefulWidget {
  const CreateArticlePage({super.key});

  @override
  State<CreateArticlePage> createState() => _CreateArticlePageState();
}

class _CreateArticlePageState extends State<CreateArticlePage> {
  FormData formData = FormData();
  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    const Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern as String);
    if (!regex.hasMatch(value!))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Article'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter Title' : null,
                    onSaved: (value) => formData.title = value,
                  ),
                  SwitchListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: const Text('Is Breaking News'),
                    value: formData.isBreaking!,
                    onChanged: (bool value) =>
                        setState(() => formData.isBreaking = value),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Image Url'),
                    validator: (value) => !Uri.parse(value!).isAbsolute
                        ? 'Please enter valid url'
                        : null,
                    onSaved: (value) => formData.imageUrl = value,
                  ),
                  TextFormField(
                    maxLines: 3,
                    // maxLines: null,
                    // keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(labelText: 'Content'),
                    validator: (value) => value!.isEmpty || value.length < 10
                        ? 'Content too short'
                        : null,
                    onSaved: (value) => formData.content = value,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: const Text('Category'),
                  ),
                  Column(
                    children: <Widget>[
                      RadioListTile<int>(
                        title: const Text('Sport'),
                        value: 1,
                        groupValue: formData.category,
                        onChanged: (value) {
                          setState(() {
                            formData.category = value;
                          });
                        },
                      ),
                      RadioListTile<int>(
                        title: const Text('Entertainment'),
                        value: 2,
                        groupValue: formData.category,
                        onChanged: (value) {
                          setState(() {
                            formData.category = value;
                          });
                        },
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Your Email'),
                    validator: validateEmail,
                    onSaved: (value) => formData.email = value,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final form = _formKey.currentState!;
                      if (form.validate()) {
                        form.save();
                        print(formData);
                        form.reset();
                        setState(() {
                          formData.isBreaking = false;
                          formData.category = null;
                        });
                      }
                      FocusScope.of(context).unfocus();
                    },
                    child: const Text('Save'),
                  ),
                ],
              )),
        ));
  }
}
