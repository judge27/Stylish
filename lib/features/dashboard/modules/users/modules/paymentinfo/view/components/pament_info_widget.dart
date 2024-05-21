import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:stylish/core/extension/context_extension.dart';
import 'package:stylish/core/utils/core.dart';
import '../../controller/cubit/paymenyinfo_cubit.dart';

class PaymentInfoWidget extends StatelessWidget {
  const PaymentInfoWidget({super.key, required this.cubit});

  final PaymenyinfoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymenyinfoCubit>.value(
      value: cubit,
      child: BlocBuilder<PaymenyinfoCubit, PaymenyinfoState>(
        builder: (context, state) {
          return Container(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 180,
                  width: context.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft:Radius.circular(40) )
                  ),
                  child: const Text("My Card",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 25
                  ),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(height: 150,),
                    CreditCardWidget(
                      enableFloatingCard: cubit.useFloatingAnimation,
                      // glassmorphismConfig:  cubit.getGlassmorphismConfig,
                      cardNumber: cubit.cardNumber,
                      expiryDate: cubit.expiryDate,
                      cardHolderName:cubit.cardHolderName,
                      cvvCode: cubit.cvvCode,
                      bankName: 'Master Card',
                      frontCardBorder: cubit.useGlassMorphism
                          ? null
                          : Border.all(color: Colors.grey),
                      backCardBorder: cubit.useGlassMorphism
                          ? null
                          : Border.all(color: Colors.grey),
                      showBackView: cubit.isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      cardBgColor: Colors.black,
                      backgroundImage:
                      cubit.useBackgroundImage
                          ? null
                          : null,
                      isSwipeGestureEnabled: true,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                      customCardTypeIcons: const <CustomCardTypeIcon>[
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:20.0),
                          child:  Column(
                              children: <Widget>[
                                CreditCardForm(
                                  formKey: cubit.formKey,
                                  obscureCvv: false,
                                  obscureNumber: false,
                                  cardNumber: cubit.cardNumber,
                                  cvvCode: cubit.cvvCode,
                                  isHolderNameVisible: true,
                                  isCardNumberVisible: true,
                                  isExpiryDateVisible: true,
                                  cardHolderName: cubit.cardHolderName,
                                  expiryDate: cubit.expiryDate,
                                  inputConfiguration: const InputConfiguration(
                                    cardNumberDecoration: InputDecoration(
                                      labelText: 'Number',
                                      hintText: 'XXXX XXXX XXXX XXXX',
                                    ),
                                    expiryDateDecoration: InputDecoration(
                                      labelText: 'Expired Date',
                                      hintText: 'XX/XX',
                                    ),
                                    cvvCodeDecoration: InputDecoration(
                                      labelText: 'CVV',
                                      hintText: 'XXX',
                                    ),
                                    cardHolderDecoration: InputDecoration(
                                      labelText: 'Card Holder',
                                    ),
                                  ), onCreditCardModelChange: (CreditCardModel creditCardModel ) {
                                  cubit.cardNumber=creditCardModel.cardNumber;
                                   cubit.cvvCode= creditCardModel.cvvCode;
                                   cubit.expiryDate= creditCardModel.expiryDate;
                                    cubit.cardHolderName=creditCardModel.cardHolderName;
                                  cubit.isCvvFocused = creditCardModel.isCvvFocused;
                                    cubit.change();
                                },
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                   onTap: (){
                                     cubit.saveUserCard(context: context);
                                   },
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: context.width/4),
                                    child: Core.instance.coreButton(buttonText: "Save", context: context),
                                  )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
