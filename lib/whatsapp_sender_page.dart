import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_sender/main.dart';

class WhatsappSenderPage extends StatefulWidget {
  const WhatsappSenderPage({Key? key}) : super(key: key);

  @override
  State<WhatsappSenderPage> createState() => _WhatsappSenderPageState();
}

class _WhatsappSenderPageState extends State<WhatsappSenderPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Whatsapp Sender")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _numberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "1234-5678",
                        labelText: "Phone Number *",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Message to send (optional)",
                        labelText: "Message",
                      ),
                      minLines: 3,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => _onGenerateClick(),
                child: const Text("Send!"),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onGenerateClick() async {
    bool isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      String url = "https://wa.me/${_numberController.text.onlyDigits()}?text=${_messageController.text.toString()}";

      if (await canLaunch(url)) {
        launch(url);
      }
    }
  }
}
