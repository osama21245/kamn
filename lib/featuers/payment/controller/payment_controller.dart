import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:get/get.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/featuers/payment/screens/toggle_screen.dart';
import '../../../core/constants/routesname.dart';
import '../../../core/data/payment_data.dart';
import '../../../core/providers/handlingdata.dart';
import '../../../core/providers/storage_repository.dart';
import '../../../theme/pallete.dart';
import '../screens/ref_code_screen.dart';

final paymentControllerProvider =
    StateNotifierProvider<paymentController, StatusRequest>((ref) =>
        paymentController(
            storageRepository: ref.watch(storageRepositoryProvider), ref: ref));

class paymentController extends StateNotifier<StatusRequest> {
  final Ref _ref;
  final StorageRepository _storageRepository;

  paymentController(
      {required Ref ref, required StorageRepository storageRepository})
      : _ref = ref,
        _storageRepository = storageRepository,
        super(StatusRequest.success);
  String apikey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RRNE1UZ3hMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuT0VPZkVWbGtrQ0JrRm1rRlNoV1RQWF92U21IWkE3b3NQZjVYZ2VzallHY3o5ZTJMaVpjVUpGcE04SzVpaGNxTGFnMjMtN0VsMVpJVi0zNUU0cUM1VUE=";
  PaymentData paymentdata = PaymentData(Get.find());
  String token = '';
  String finaltoken = "";
  String orderPaymentid = "";
  String refid = "";
  int integrationid = 4422085;
  int kioskintegrationid = 4422353;
  int mobileWalletintegrationid = 4422362;
  int kioskRef = 0;
  String visaUrl =
      'https://accept.paymobsolutions.com/api/acceptance/iframes/810645?payment_token={payment_key_obtained_previously}';
  String redirectMobileWalletUrl = "";

//***************************** payment ********************* */

// {
//   "source": {
//     "identifier": "AGGREGATOR",
//     "subtype": "AGGREGATOR"
//   },
//   "payment_token": "ZXlKMGVYQWlULjRi2T2...",
//   "aggregator_data": {
//     "integration_id": "YOUR_PAYMOB_FAWRY_INTEGRATION_ID"
//   },
//   "kiosk_payment": {
//     "provider": "FAWRY"
//   }
// }

  gettoken() async {
    state = StatusRequest.loading;
    var response = await paymentdata.getauthtoken(apikey);
    print("==================$response");
    state = handlingData(response);
    if (state == StatusRequest.success) {
      if (response["token"] != "") {
        token = response['token'];
        print(token);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "erorr at connect");
      }
    }
  }

  //****************************visa**************************************** */

  getid(String price) async {
    state = StatusRequest.loading;
    var response = await paymentdata.getid(token, price);
    print("==================$response");
    state = handlingData(response);
    if (state == StatusRequest.success) {
      if (response["id"] != "") {
        orderPaymentid = response['id'].toString();
        print("=================1");
        payment(price);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Erorr at connect");
      }
    }
  }

  payment(String price) async {
    state = StatusRequest.loading;
    var response = await paymentdata.getpayment(
        orderPaymentid, token, integrationid, price);
    print("==================$response");
    state = handlingData(response);
    if (state == StatusRequest.success) {
      if (response["token"] != "") {
        finaltoken = response['token'];
        visaUrl =
            "https://accept.paymobsolutions.com/api/acceptance/iframes/810645?payment_token=$finaltoken";
        //&amount_cents=500000
        print(finaltoken);

        launch(
          visaUrl,
          customTabsOption: CustomTabsOption(
            toolbarColor: Pallete.primaryColor,
            enableDefaultShare: true,
            enableUrlBarHiding: true,
            showPageTitle: true,
            animation: CustomTabsSystemAnimation.slideIn(),
            extraCustomTabs: const <String>[
              // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
              'org.mozilla.firefox',
              // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
              'com.microsoft.emmx',
            ],
          ),
          safariVCOption: SafariViewControllerOption(
            preferredBarTintColor: Pallete.primaryColor,
            preferredControlTintColor: Pallete.whiteColor,
            barCollapsingEnabled: true,
            entersReaderIfAvailable: false,
            dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
          ),
        );
      } else {
        Get.defaultDialog(title: "Warning", middleText: "erorr at connect");
      }
    }
  }

  //***********************************Mobile WAllet ***************************** */

  getidMobileWallet(String price, String phone) async {
    state = StatusRequest.loading;
    var response = await paymentdata.getid(token, price);
    print("==================$response");
    state = handlingData(response);
    if (state == StatusRequest.success) {
      if (response["id"] != "") {
        orderPaymentid = response['id'].toString();
        print("=================1");
        paymentMobileWallet(price, phone);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Erorr at connect");
      }
    }
  }

  paymentMobileWallet(String price, String phone) async {
    state = StatusRequest.loading;
    var response = await paymentdata.getpayment(
        orderPaymentid, token, mobileWalletintegrationid, price);
    print("==================$response");
    state = handlingData(response);
    if (state == StatusRequest.success) {
      if (response["token"] != "") {
        finaltoken = response['token'];
        print(finaltoken);
        mobileWallet(phone);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "erorr at connect");
      }
    }
  }

  mobileWallet(String phone) async {
    state = StatusRequest.loading;
    var response = await paymentdata.mobileWalletPayment(finaltoken, phone);
    print("==================$response");
    state = handlingData(response);
    if (state == StatusRequest.success) {
      redirectMobileWalletUrl = response['redirect_url'];
      print("===============$redirectMobileWalletUrl");

      launch(
        redirectMobileWalletUrl,
        customTabsOption: CustomTabsOption(
          toolbarColor: Pallete.primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Pallete.primaryColor,
          preferredControlTintColor: Pallete.whiteColor,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    }
  }

  //**********************************kiosk**************************** */

  getidKiosk(String price) async {
    state = StatusRequest.loading;
    var response = await paymentdata.getid(token, price);
    print("==================$response");
    state = handlingData(response);
    if (state == StatusRequest.success) {
      if (response["id"] != "") {
        orderPaymentid = response['id'].toString();
        print("=================1");
        paymentKiosk(price);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Erorr at connect");
      }
    }
  }

  paymentKiosk(String price) async {
    state = StatusRequest.loading;
    var response = await paymentdata.getpayment(
        orderPaymentid, token, kioskintegrationid, price);
    print("==================$response");
    state = handlingData(response);
    if (state == StatusRequest.success) {
      if (response["token"] != "") {
        finaltoken = response['token'];
        print(finaltoken);
        kiosk();
      } else {
        Get.defaultDialog(title: "Warning", middleText: "erorr at connect");
      }
    }
  }

  kiosk() async {
    state = StatusRequest.loading;
    var response = await paymentdata.kioskpayment(finaltoken);
    print("==================$response");
    state = handlingData(response);
    if (state == StatusRequest.success) {
      kioskRef = response['id'];
      Get.to(() => ReferenceScreen());
    }

    orderStatus() async {
      state = StatusRequest.loading;
      var response = await paymentdata.orderStatment(visaUrl);
      print("==================$response");
      state = handlingData(response);
      if (state == StatusRequest.success) {
        if (response["status"] == "success") {
          kioskRef = response['id'];
          bool success = response['obj']['success'];
          print(success);

          Get.toNamed(AppRoutes.Orderarchive);
        } else {
          Get.defaultDialog(title: "Warning", middleText: "erorr at connect");
        }
      }
    }
  }
}
