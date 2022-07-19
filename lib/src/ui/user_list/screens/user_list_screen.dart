import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'user_detail_screen.dart';
import '../../../base/utils/constants/asset_constants.dart';
import '../../../base/utils/constants/color_constants.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBarColor,
      appBar: _customAppbar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
            color: kWhiteColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _notificationText(),
              _customListView(),
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
        title: Image.asset(appbarLogo),
      );

  Widget _notificationText() => const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Notifications",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: kBlackColor,
          ),
        ),
      );

  Widget _customListView() => Expanded(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 35,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              endActionPane: ActionPane(
                extentRatio: 0.15,
                motion: const ScrollMotion(),
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 60.0,
                      height: 95.0,
                      decoration: const BoxDecoration(
                        color: kSlidableColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                        ),
                      ),
                      child: const Icon(Icons.delete),
                    ),
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserDetailScreen(),
                    ),
                  );
                },
                child: _customListTile(),
              ),
            );
          },
        ),
      );

  Widget _customListTile() => ListTile(
        leading: _userPhoto(),
        title: _userName(),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userDescription(),
            _userTime(),
          ],
        ),
      );

  Widget _userPhoto() => const CircleAvatar(
        backgroundColor: kWhiteColor,
        backgroundImage: AssetImage(userImage),
      );

  Widget _userName() => const Text(
        "Maoo.lopez",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: kBlackColor,
        ),
      );

  Widget _userDescription() => const Text(
        "This is amazing! What a great way.",
        style: TextStyle(
          fontSize: 14.0,
          color: kGreyColor,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _userTime() => const Text(
        "20 min ago",
        style: TextStyle(
          fontSize: 10.0,
          color: kLightGreyColor,
          fontWeight: FontWeight.bold,
        ),
      );
}
