import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../base/utils/constants/string_constants.dart';
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
        padding: EdgeInsets.only(top: 16.0, left: 16.0),
        child: Text(
          notificationText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: kBlackColor,
          ),
        ),
      );

  Widget _customListView() => Expanded(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: user.length,
          itemBuilder: (BuildContext context, int index) {
            return Align(
              alignment: Alignment.centerRight,
              child: Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.13,
                  motion: const ScrollMotion(),
                  children: [
                    if (MediaQuery.of(context).viewInsets.right == 0)
                      Container(
                        width: 50.0,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          color: kSlidableColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                          ),
                        ),
                        child: const Icon(
                          Icons.delete_outline,
                          size: 30,
                          color: kWhiteColor,
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
                  child: _customListTile(index),
                ),
              ),
            );
          },
        ),
      );

  Widget _customListTile(int index) => ListTile(
        leading: _userPhoto(index),
        title: _userName(index),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _userDescription(index),
            _userTime(index),
          ],
        ),
      );

  Widget _userPhoto(int index) => CircleAvatar(
        backgroundColor: kWhiteColor,
        backgroundImage: AssetImage(user[index].imagepath),
      );

  Widget _userName(index) => Text(
        user[index].name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: kBlackColor,
        ),
      );

  Widget _userDescription(index) => Text(
        user[index].title,
        style: const TextStyle(
          fontSize: 14.0,
          color: kGreyColor,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _userTime(index) => Text(
        user[index].time,
        style: const TextStyle(
          fontSize: 10.0,
          color: kLightGreyColor,
          fontWeight: FontWeight.bold,
        ),
      );
}

class UserData {
  final String imagepath;
  final String name;
  final String title;
  final String time;

  UserData({
    required this.imagepath,
    required this.name,
    required this.title,
    required this.time,
  });
}

List<UserData> user = [
  UserData(
    imagepath: userImage1,
    name: "Tanaz Shekh",
    title: "This is amazing",
    time: "6 minutes ago",
  ),
  UserData(
    imagepath: userImage2,
    name: "Rushi Gandhi",
    title: "shared your post on travel addict",
    time: "10 hours ago",
  ),
  UserData(
    imagepath: userImage3,
    name: "Dhruvi Pandya",
    title: "liked your post",
    time: "21 seconds ago",
  ),
  UserData(
    imagepath: userImage4,
    name: "kishan Chudasma",
    title: "helpfull ",
    time: "8 minutes ago",
  ),
  UserData(
    imagepath: userImage5,
    name: "Drashti Rajyaguru",
    title: "This is amazing",
    time: "4 hours ago",
  ),
  UserData(
    imagepath: userImage6,
    name: "Tanaz Shekh",
    title: "This is amazing",
    time: "6 minutes ago",
  ),
  UserData(
    imagepath: userImage7,
    name: "Rushi Gandhi",
    title: "shared your post on travel addict",
    time: "10 hours ago",
  ),
  UserData(
    imagepath: userImage8,
    name: "Dhruvi Pandya",
    title: "liked your post",
    time: "21 seconds ago",
  ),
  UserData(
    imagepath: userImage9,
    name: "kishan Chudasma",
    title: "helpfull ",
    time: "8 minutes ago",
  ),
  UserData(
    imagepath: userImage10,
    name: "Drashti Rajyaguru",
    title: "This is amazing",
    time: "4 hours ago",
  ),
];
