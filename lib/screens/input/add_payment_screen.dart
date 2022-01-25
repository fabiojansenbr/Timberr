import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/add_payment_controller.dart';
import 'package:timberr/widgets/buttons/custom_elevated_button.dart';
import 'package:timberr/widgets/cards/payment_card_view.dart';
import 'package:timberr/widgets/input/custom_input_box.dart';

class AddPaymentScreen extends StatelessWidget {
  AddPaymentScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final _controller = Get.put(AddPaymentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: kOffBlack,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          "ADD PAYMENT METHOD",
          style: kMerriweatherBold,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Obx(
                () {
                  return PaymentCardView(
                    cardHolderName: (_controller.name.isEmpty)
                        ? "XXXXXX"
                        : _controller.name.value,
                    expiryDateString: (_controller.dateString.isEmpty)
                        ? "XX/XX"
                        : _controller.dateString.value,
                    lastFourDigits: (_controller.lastFourDigits.isEmpty)
                        ? "XXXX"
                        : _controller.lastFourDigits.value,
                  );
                },
              ),
              const SizedBox(height: 30),
              CustomInputBox(
                headerText: "CardholderName",
                hintText: "Ex: Aditya R",
                textInputType: TextInputType.name,
                onChanged: (val) {
                  _controller.name.value = val;
                },
                validator: (val) {
                  return (val?.isNotEmpty ?? false) ? null : "Enter a name";
                },
              ),
              CustomInputBox(
                headerText: "Card Number",
                hintText: "Ex: XXXX XXXX XXXX 3456",
                textInputType: TextInputType.number,
                maxLength: 20,
                inputFormatters: [CreditCardFormatter()],
                onChanged: (val) {
                  _controller.cardNumber = int.parse(val.replaceAll(" ", ""));
                  if (val.length >= 16) {
                    _controller.lastFourDigits.value = val.substring(15);
                  } else {
                    _controller.lastFourDigits.value = "";
                  }
                },
                validator: (val) {
                  return (val != null && val.length == 20)
                      ? null
                      : "Enter a Valid Credit Card Number";
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomInputBox(
                      headerText: "CVV",
                      hintText: "Ex: 123",
                      maxLength: 3,
                      obscureText: true,
                      onChanged: (val) {
                        _controller.cvv = int.parse(val);
                      },
                      validator: (val) {
                        return (val != null && val.length == 3)
                            ? null
                            : "Enter CVV";
                      },
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: CustomInputBox(
                      headerText: "Expiration Date",
                      hintText: "Ex: 22/04",
                      maxLength: 5,
                      textInputAction: TextInputAction.done,
                      inputFormatters: [DateFormatter()],
                      onChanged: (val) {
                        _controller.dateString.value = val;
                        if (val.length == 5) {
                          _controller.month = int.parse(val[0] + val[1]);
                          _controller.year = int.parse(val[3] + val[4]);
                        }
                      },
                      validator: (val) {
                        return (_controller.month > 0 &&
                                _controller.month < 13 &&
                                _controller.year > 21)
                            ? null
                            : "Enter a Valid Date";
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _controller.addCardDetail();
                    }
                  },
                  text: "ADD NEW CARD"),
            ],
          ),
        ),
      ),
    );
  }
}
