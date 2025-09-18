import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kamn/core/theme/app_pallete.dart';
import 'package:kamn/gym_feature/add_gym/data/models/document_item.dart';

class Constants {
  static const List<String> topics = [
    'Technology',
    'Business',
    'Programming',
    'Entertainment',
  ];
  static final List<DocumentItem> mandatoryDocuments = [
    const DocumentItem(
      title: 'Gym Operating License',
      translation: 'رخصه تشغيل الجيم',
      isValid: false,
    ),
    const DocumentItem(
      title: 'ID or Passport of Owner',
      translation: 'صورة البطاقة الشخصية أو جواز السفر لصاحب الملكيه/الجيم',
      fontSize: 6,
      isValid: false,
    ),
    const DocumentItem(
      title: 'Ownership Contract',
      translation: 'عقد ايجار او ملكيه المكان',
      isValid: false,
    ),
  ];
  static const overview = 'Overview';
  static const salesOverView = 'Salesoverview';
  static const noConnectionErrorMessage = 'Not connected to a network!';
  static const directions = 'Dirextions';
  static const playGroundFeatures = 'Playground Features';
  static const available = 'Available';
  static const bookNow = 'Book Now';
  static const logout = 'Logout';
  static const login = 'Login';
  static const forgetPassword = 'forget apssword';
  static const signUp = 'Sign Up';
  static const password = 'password';
  static const myProfile = 'My Profile';
  static const phoneNumber = '+1 654 785 4462';
  static const userName = 'Mahmoud Sayed';
  static const userEmail = 'josphamdes@gmail.com';
  static const pleaseComplete = 'please complete the following information ';
  static const pleasePassword = 'please enter your password ';
  static const pleaseName = 'please enter your name';
  static const addData = 'Add your data about your sevice';
  static const editData = 'Edit your data about your sevice';
  static const addGroundImage = 'Add ground Images';
  static const addOwnershipImage = 'Add Land ownership images';
  static const detailsClear = ' (make sure every detail is clear)';
  static const numOfImage = ' (from 2, 3 images size 2mb)';
  static const fullName = 'Full name';
  static const name = ' Name';
  static const phone = 'Phone';
  static const address = 'Service address';
  static const groundSize = 'Ground Size';
  static const governate = 'Governate';
  static const price = 'Price per hour';
  static const priceHint = 'Enter ground price';
  static const description = 'Description';
  static const descriptionHint = 'Enter ground description';
  static const optional = ' (Optional)';
  static const fullNameHint = ' Enter your full name';
  static const nameHint = ' Enter your  name';
  static const passwordHint = ' Enter your  password';
  static const phoneHint = ' Enter your phone number';
  static const passwordShouldBe = 'password should be >6 & <30';

  static const addressHint = 'Enter service address';
  static const groundSizeHint = ' Enter ground Size';
  static const governateHint = ' Choose governate';
  static const howManyPeople = '  (how many people can fit)';
  static const finish = 'Finish';
  static const inUse = 'In use';
  static const underRepairs = 'Under Repairs';
  static const availability = 'Availability';

  static const groundsScreenTitle = "Football";
  static const hintTextForSearch = "Search for a stadium";
  static const reservation = "Your reservation";
  static const showAll = "show all";
  static const nextMatch = "Your next match will start at:";
  static const serviceSuccessfullyAdded = "Your service \nsuccessfully added";
  static const whichSportYouServe = "Which Sport you want to service?";
  static const yourServices = "Your Services";
  static const chooseYourGame = "Choose your game";
  static const chooseYourAddedServices = "Choose your added services";
  static const teamPlay = "Team play";
  static const fourOrMore = "4 or more players";
  static const individualPlay = "Individual play";
  static const oneOrMore = "1 or more player";
  static const football = "Football";
  static const basketball = "Basketball";
  static const tennis = "Tennis";
  static const volleyball = "Volleyball";
  static const skyDiving = "Sky Diving";
  static const swimming = "Swimming";

  static const welcomeToManagementSystem = 'Welcome to\nManagement System';
  static const financialReports = 'Financial Reports';
  static const paymentOptions = 'Choose payment\noption';
  static const termsAndConditions = 'Terms and Conditions';
  static const String restaurantName = "Sarah's House";
  static const String foodTitle = "Quinoa Salad with Grilled Chicken";
  static const String details =
      "A delicious grilled chicken salad packed with vibrant greens, colorful vegetables, and topped with a light vinaigrette. The tender chicken adds a lean source of protein, while the mix of nuts and seeds provides healthy fats and essential micronutrients.";
  static const String ingredientsTitle = "Ingredients";
  static const String detailsTitle = "Details";
  static const termsAndConditionsContent = '''1. Introduction
  
  
  
  
  
  
  

Welcome to KAMN. By using our services, you agree to the following Terms of Service. Please read them carefully.

2. Payment Process

When paying by Visa, please note that the transaction may take between 24 to 48 hours to process, depending on your bank. This timeframe also applies in case of refunds, as the processing duration is subject to the policies of the bank you are using.

3. Refund Policy

If you request a refund, the processing time will follow the same timeframe as outlined in Section 2, taking between 24 to 48 hours based on your bank’s processing rules.''';

  static const popularFood = 'Popular Food';
  static const openRestaurants = 'Open Restaurants';
  static const kCal = 'KCal';
  static const egp = '£GP';
  static const minute = 'min';

  static const List<String> egyptGovernorates = [
    "Cairo",
    "Giza",
    "Alexandria",
    "Qalyubia",
    "Port Said",
    "Suez",
    "Ismailia",
    "Aswan",
    "Asyut",
    "Beheira",
    "Beni Suef",
    "Dakahlia",
    "Damietta",
    "Faiyum",
    "Gharbia",
    "Kafr El Sheikh",
    "Luxor",
    "Matrouh",
    "Minya",
    "Monufia",
    "New Valley",
    "North Sinai",
    "Red Sea",
    "Qena",
    "Sharqia",
    "Sohag",
    "South Sinai"
  ];

  static num kImageSliderHeight = 380.h;
  static num additionHightToToolBar = 300.h;

  static List<SportDetail> teamSportList = [
    SportDetail(
      Sport.football.displayName,
      Sport.football.sportColor,
    ),
    SportDetail(
      Sport.basketball.displayName,
      Sport.basketball.sportColor,
    ),
    SportDetail(
      Sport.tennis.displayName,
      Sport.tennis.sportColor,
    ),
    SportDetail(
      Sport.volleyball.displayName,
      Sport.volleyball.sportColor,
    ),
  ];
  static List<SportDetail> individualSportList = [
    SportDetail(
      Sport.skyDiving.displayName,
      Sport.football.sportColor,
    ),
    SportDetail(
      Sport.swimming.displayName,
      Sport.swimming.sportColor,
    ),
  ];
}

class SportDetail {
  final String title;
  final Color color;

  SportDetail(this.title, this.color);
}

enum Sport {
  football,
  basketball,
  tennis,
  volleyball,
  skyDiving,
  swimming,
}

extension SportExtension on Sport {
  String get displayName {
    switch (this) {
      case Sport.football:
        return "Football";
      case Sport.basketball:
        return "Basketball";
      case Sport.tennis:
        return "Tennis";
      case Sport.volleyball:
        return "Volleyball";
      case Sport.skyDiving:
        return "Sky Diving";
      case Sport.swimming:
        return "Swimming";
    }
  }

  Color get sportColor {
    switch (this) {
      case Sport.football:
        return AppPallete.greenColor;
      case Sport.basketball:
        return AppPallete.pinkColor;
      case Sport.tennis:
        return AppPallete.orangeColor;
      case Sport.volleyball:
        return AppPallete.yellowColor;
      case Sport.skyDiving:
        return AppPallete.lightVoivetteColor;
      case Sport.swimming:
        return AppPallete.lightBlueColor;
    }
  }
}
final List<String> categories = [
  'All',
  'Gyms',
  'Courts',
  'Home Cooks',
  'Restaurants'
];
