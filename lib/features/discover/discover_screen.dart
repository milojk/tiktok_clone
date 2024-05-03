import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController(
    text: 'Initial text',
  );

  void _onSearchSubmitted(String value) {
    print('_onSearchSubmitted - $value');
  }

  void _onSearchChanged(String value) {
    print('_onSearchChanged - $value');
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Container(
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: CupertinoSearchTextField(
              onSubmitted: _onSearchSubmitted,
              onChanged: _onSearchChanged,
              controller: _textEditingController,
              style: TextStyle(
                color: isDarkMode(context) ? Colors.white : Colors.black,
              ),
            ),
          ),
          bottom: TabBar(
            onTap: (value) => FocusManager.instance.primaryFocus?.unfocus(),
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size1,
            ),
            isScrollable: true,
            splashFactory: NoSplash.splashFactory,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(
                Sizes.size6,
              ),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                childAspectRatio: 9 / 21,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
              ),
              itemBuilder: (context, index) => LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.size4),
                        ),
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: 'assets/images/image04.png',
                              image:
                                  'https://images.unsplash.com/photo-1586810724476-c294fb7ac01b?q=80&w=2836&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                        ),
                      ),
                      Gaps.v5,
                      const Text(
                        'It is  very long caption for my GridView. It is only for deleopting purpose.',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: Sizes.size16 + Sizes.size2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v8,
                      if (constraints.maxWidth > 250 ||
                          constraints.maxWidth < 200)
                        DefaultTextStyle(
                          style: TextStyle(
                            color: isDarkMode(context)
                                ? Colors.grey.shade300
                                : Colors.grey.shade600,
                            fontWeight: FontWeight.w600,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.grey.shade500,
                                foregroundColor: Colors.white,
                                foregroundImage: const NetworkImage(
                                  'https://d1telmomo28umc.cloudfront.net/media/public/avatars/milojk-avatar.jpg',
                                ),
                              ),
                              Gaps.h4,
                              const Expanded(
                                child: Text(
                                  'My Avator nmae is long and loooong',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Gaps.h4,
                              FaIcon(
                                FontAwesomeIcons.heart,
                                size: Sizes.size16,
                                color: Colors.grey.shade600,
                              ),
                              Gaps.h2,
                              const Text(
                                '2.5M',
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size28,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
