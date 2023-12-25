import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kman/HandlingDataView.dart';
import 'package:kman/core/class/statusrequest.dart';
import 'package:kman/core/common/textfield.dart';
import 'package:kman/core/providers/valid.dart';
import 'package:kman/featuers/benefits/controller/benefits_controller.dart';
import 'package:kman/featuers/coaches-gyms/controller/coaches-gyms_controller.dart';
import 'package:kman/theme/pallete.dart';

class EditCollaboratorStateScreen extends ConsumerStatefulWidget {
  String collection;
  String userId;
  String id;
  EditCollaboratorStateScreen(
      {super.key,
      required this.collection,
      required this.userId,
      required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditCollaboratorStateScreenState();
}

class _EditCollaboratorStateScreenState
    extends ConsumerState<EditCollaboratorStateScreen> {
  TextEditingController? userId;
  @override
  void initState() {
    userId = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userId!.dispose();
    super.dispose();
  }

  activeCoach(
    WidgetRef ref,
  ) {
    ref
        .watch(coachesGymsControllerProvider.notifier)
        .activeCoach(widget.id, userId!.text, context);
  }

  activeGym(
    WidgetRef ref,
  ) {
    ref
        .watch(coachesGymsControllerProvider.notifier)
        .activegym(widget.id, userId!.text, context);
  }

  activeMedical(
    WidgetRef ref,
  ) {
    ref
        .watch(benefitsControllerProvider.notifier)
        .activeMedical(widget.id, userId!.text, context);
  }

  activeNutrition(
    WidgetRef ref,
  ) {
    ref
        .watch(benefitsControllerProvider.notifier)
        .activeNutrition(widget.id, userId!.text, context);
  }

  @override
  Widget build(BuildContext context) {
    StatusRequest statusRequest =
        widget.collection == "coach" || widget.collection == "gym"
            ? ref.watch(coachesGymsControllerProvider)
            : ref.watch(benefitsControllerProvider);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: HandlingDataView(
          statusRequest: statusRequest,
          widget: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.03,
                        horizontal: size.width * 0.06),
                    child: TextFiled(
                      validator: (val) {
                        return validinput(val!, 11, 11, "");
                      },
                      name: "userId",
                      controller: userId!,
                      color: Pallete.lightgreyColor2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: ElevatedButton(
                      onPressed: () => widget.collection == "coach"
                          ? activeCoach(ref)
                          : widget.collection == "gym"
                              ? activeGym(ref)
                              : widget.collection == "medical"
                                  ? activeMedical(ref)
                                  : activeNutrition(ref),
                      child: Text(
                        'Finish',
                        style: TextStyle(
                            color: Pallete.whiteColor,
                            fontFamily: "Muller",
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w600),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 5,
                          fixedSize: Size(size.width, size.height * 0.06),
                          backgroundColor: Pallete.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.02))),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
