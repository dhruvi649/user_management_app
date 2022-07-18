import 'package:flutter/material.dart';
import 'package:user_management_app/src/base/utils/constants/string_constants.dart';
import '../../../base/utils/constants/asset_constants.dart';
import '../../../base/utils/constants/color_constants.dart';
import '../../auth/widgets/custom_clipper_button_shape.dart';

class UserDetailScreen extends StatefulWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBarColor,
      appBar: _customAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: 16.0,
                          left: 16.0,
                          top: 50.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            _customText(userName),
                            _customCard(context, nameText),
                            _customText(email),
                            _customCard(context, emailId),
                            _logoutButton(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  _userPhoto(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _customAppbar() => AppBar(
        backgroundColor: kAppBarColor,
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          appbarText,
          style: TextStyle(
            fontSize: 18.0,
            color: kWhiteColor,
          ),
        ),
      );

  Widget _userPhoto() => const Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          child: CircleAvatar(
            radius: 40.0,
            backgroundColor: kLightGreyColor,
            backgroundImage: AssetImage(userImage),
          ),
        ),
      );

  Widget _customCard(BuildContext context, String text) => SizedBox(
        height: 40.0,
        width: MediaQuery.of(context).size.width,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 3.0),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: kGreyColor,
              ),
            ),
          ),
        ),
      );

  Widget _logoutButton() => Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ClipPath(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: kGreenColor,
              shadowColor: kBlackColor,
              elevation: 3.0,
            ),
            child: const Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15.0,
                bottom: 15.0,
              ),
              child: Center(
                child: Text(
                  logoutText,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          clipper: CustomClipperButtonShape(),
        ),
      );

  Widget _customText(String text) => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: kBlackColor,
          ),
        ),
      );
}
