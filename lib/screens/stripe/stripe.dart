import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CardFormScreen extends StatelessWidget {
  const CardFormScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pay with a Credit Card'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Card Form"),
              SizedBox(height: 20),
              CardFormField(
                controller: CardFormEditController(),
              )
            ],
          ),
        ));
  }
}
