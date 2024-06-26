import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/wigets/persistent_tabbar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });
  final String username, tab;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final isDark = isDarkMode(context);
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: widget.tab == "likes" ? 1 : 0,
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Text(widget.username),
                  actions: [
                    IconButton(
                      onPressed: _onGearPressed,
                      icon: const FaIcon(
                        FontAwesomeIcons.gear,
                        size: Sizes.size20,
                      ),
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gaps.v20,
                      CircleAvatar(
                        radius: 45,
                        foregroundImage: const NetworkImage(
                            'https://avatars.githubusercontent.com/u/32942355'),
                        child: Text(widget.username),
                      ),
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '@${widget.username}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h5,
                          FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            color: Colors.blue.shade500,
                            size: Sizes.size16,
                          )
                        ],
                      ),
                      Gaps.v14,
                      SizedBox(
                        height: Sizes.size40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const PopBlock(title: '37', subtitle: 'Following'),
                            VerticalDivider(
                              thickness: Sizes.size1,
                              width: Sizes.size32,
                              color: Colors.grey.shade400,
                              indent: Sizes.size14,
                              endIndent: Sizes.size14,
                            ),
                            const PopBlock(
                                title: '10.5M', subtitle: 'Followers'),
                            VerticalDivider(
                              thickness: Sizes.size1,
                              width: Sizes.size32,
                              color: Colors.grey.shade400,
                              indent: Sizes.size14,
                              endIndent: Sizes.size14,
                            ),
                            const PopBlock(title: '149.3M', subtitle: 'Likes'),
                          ],
                        ),
                      ),
                      Gaps.v14,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size10,
                              horizontal: Sizes.size36,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  Sizes.size3,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Follow',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.size14,
                              ),
                            ),
                          ),
                          Gaps.h4,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size8,
                              horizontal: Sizes.size8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white,
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.youtube,
                              size: Sizes.size20,
                            ),
                          ),
                          Gaps.h4,
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size8,
                              horizontal: Sizes.size8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.white,
                            ),
                            child: const FaIcon(
                              FontAwesomeIcons.chevronDown,
                              size: Sizes.size20,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v14,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size32,
                        ),
                        child: Text(
                          'All highlights and where to watch live matches on FIFA+. I wonder how will it loook when it is long.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            //color: Colors.black87,
                            fontWeight: FontWeight.w300,
                            fontSize: Sizes.size12,
                          ),
                        ),
                      ),
                      Gaps.v14,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.link,
                            size: Sizes.size12,
                          ),
                          Gaps.h4,
                          Text(
                            'https://www.fifa.com/fifaplus/en/home',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              //color: Colors.black,
                              //fontWeight: FontWeight.w300,
                              fontSize: Sizes.size12,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v5,
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                GridView.builder(
                  padding: EdgeInsets.zero,
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 40,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: size.width > Breakpoints.lg ? 5 : 3,
                    childAspectRatio: 9 / 13,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                  ),
                  itemBuilder: (context, index) => Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 9 / 13,
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/image04.png',
                            image:
                                'https://images.unsplash.com/photo-1586810724476-c294fb7ac01b?q=80&w=2836&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 4,
                        child: Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.play,
                              color: Colors.white,
                              size: Sizes.size12,
                            ),
                            Gaps.h5,
                            Text(
                              'No. $index',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.size12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text('Page 2'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PopBlock extends StatelessWidget {
  const PopBlock({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizes.size16,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            //fontWeight: FontWeight.w300,
            fontSize: Sizes.size12,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
