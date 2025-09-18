import 'package:kamn/core/const/image_links.dart';
import '../../../../../core/const/icon_links.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentOptionsModel {
  List<PaymentDataModel> paymentOptions = [
    PaymentDataModel(PaymentOptionType.bank, IconLinks.bank),
    PaymentDataModel(PaymentOptionType.kamn, ImageLinks.loginLogo),
    PaymentDataModel(PaymentOptionType.cash, IconLinks.cashIcon),
    PaymentDataModel(PaymentOptionType.visa, IconLinks.visa),
    PaymentDataModel(PaymentOptionType.fawry, IconLinks.fawry),
    PaymentDataModel(PaymentOptionType.paypal, IconLinks.paypal),
  ];
}

enum PaymentOptionType { bank, kamn, cash, visa, fawry, paypal }

class PaymentDataModel {
  final PaymentOptionType type;
  final String iconLink;

  PaymentDataModel(this.type, this.iconLink);
}
