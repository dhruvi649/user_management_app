import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../base/utils/constants/string_constants.dart';
import '../../../base/utils/methods/validation_methods.dart';
import '../../user_list/screens/user_list_screen.dart';
import '../widgets/social_media_button.dart';
import '../widgets/custom_clipper_button_shape.dart';
import '../widgets/custom_text_form_field.dart';
import '../../../base/utils/constants/color_constants.dart';
import '../../../base/utils/constants/asset_constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _userEditingController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _userFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _appLogo(),
                      _welcomeText(),
                      _customText(),
                      _profilePhoto(),
                      _usernameTextFormField(context),
                      _emailTextFormField(context),
                      _passwordTextFormField(context),
                      _confirmPasswordFormField(),
                      _submitButton(),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      _socialMediaText(),
                      _socialMediaButton(),
                      _customRichText(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appLogo() => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Image.asset(appLogo),
      );

  Widget _welcomeText() => Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: welcomeText,
                style: TextStyle(
                  fontSize: 20.0,
                  color: kBlackColor,
                ),
              ),
              TextSpan(
                text: appName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: kBlackColor,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _customText() => const Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Text(
          registrationText,
          style: TextStyle(
            fontSize: 13.0,
            color: kGreyColor,
          ),
        ),
      );

  Widget _profilePhoto() => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: kBlackColor),
                borderRadius: const BorderRadius.all(
                  Radius.circular(40.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: kLightGreyColor,
                  child: SvgPicture.asset(
                    profileImage,
                    height: 25.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            const Text(
              profilePhoto,
              style: TextStyle(fontSize: 15.0),
            )
          ],
        ),
      );

  Widget _usernameTextFormField(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextFormField(
          hintText: userText,
          focusNode: _userFocusNode,
          onSubmit: (String? value) {
            _fieldFocusChange(
              context,
              _userFocusNode,
              _emailFocusNode,
            );
          },
          controller: _userEditingController,
          labelText: userText,
          icon: Icons.person_outline,
          validator: validateUsername,
          textInputType: TextInputType.name,
        ),
      );

  Widget _emailTextFormField(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextFormField(
          icon: Icons.email_outlined,
          hintText: emailText,
          focusNode: _emailFocusNode,
          onSubmit: (String? _value) {
            _fieldFocusChange(
              context,
              _emailFocusNode,
              _passwordFocusNode,
            );
          },
          controller: _emailController,
          labelText: emailText,
          validator: validateEmail,
          textInputType: TextInputType.emailAddress,
        ),
      );

  Widget _passwordTextFormField(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextFormField(
          icon: Icons.lock_outline,
          hintText: passwordText,
          focusNode: _passwordFocusNode,
          onSubmit: (String? value) {
            _fieldFocusChange(
              context,
              _emailFocusNode,
              _confirmPasswordFocus,
            );
          },
          controller: _passwordEditingController,
          labelText: passwordText,
          validator: validatePassword,
          textInputType: TextInputType.visiblePassword,
        ),
      );

  Widget _confirmPasswordFormField() => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CustomTextFormField(
          hintText: passwordText,
          focusNode: _confirmPasswordFocus,
          onSubmit: (String? value) {},
          controller: _confirmPasswordController,
          labelText: confirmPasswordText,
          icon: Icons.lock_outline,
          validator: validatePassword,
          textInputType: TextInputType.visiblePassword,
        ),
      );

  Widget _submitButton() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ClipPath(
              child: Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserListScreen(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kGreenColor,
                    shadowColor: kBlackColor,
                    elevation: 3.0,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 15.0,
                      bottom: 15.0,
                    ),
                    child: Center(
                      child: Text(
                        submitButton,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              clipper: CustomClipperButtonShape(),
            ),
          ),
        ],
      );

  Widget _socialMediaText() => const Padding(
        padding: EdgeInsets.only(top: 30.0),
        child: Center(
          child: Text(socialMediaText),
        ),
      );

  Widget _socialMediaButton() => Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocialMediaButton(
                svgPictureUrl: facebookIcon,
                height: 20.0,
                text: facebookText,
                color: Colors.blue[800]!,
              ),
              const SocialMediaButton(
                svgPictureUrl: googleIcon,
                height: 20.0,
                text: googleText,
                color: kBlackColor,
              ),
              const SocialMediaButton(
                svgPictureUrl: appleIcon,
                height: 30.0,
                text: appleText,
                color: kBlackColor,
              ),
            ],
          ),
        ),
      );

  Widget _customRichText(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: alreadyAccount,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: kBlackColor,
                    ),
                  ),
                  TextSpan(
                    text: signInText,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      color: kGreenColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
