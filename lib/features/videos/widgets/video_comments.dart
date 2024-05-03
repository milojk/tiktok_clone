import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  final ScrollController _scrollController = ScrollController();

  void _onClosedPressed() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = isDarkMode(context);
    return Container(
      height: size.height * 0.75,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            backgroundColor: isDark ? null : Colors.grey.shade50,
            appBar: AppBar(
              backgroundColor: isDark ? null : Colors.grey.shade50,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: _onClosedPressed,
                  icon: const FaIcon(
                    FontAwesomeIcons.xmark,
                  ),
                ),
              ],
              title: const Text('24234 comments'),
            ),
            body: GestureDetector(
              onTap: _stopWriting,
              child: Stack(
                children: [
                  Scrollbar(
                    controller: _scrollController,
                    child: ListView.separated(
                      controller: _scrollController,
                      padding: const EdgeInsets.only(
                        top: Sizes.size10,
                        bottom: Sizes.size96 + Sizes.size20,
                        left: Sizes.size16,
                        right: Sizes.size16,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundColor:
                                isDark ? Colors.grey.shade700 : null,
                            child: const Text('Nico'),
                          ),
                          Gaps.h10,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nico',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    fontSize: Sizes.size14,
                                  ),
                                ),
                                Gaps.v3,
                                Text(
                                  'Reloaded 1 of 780 libraries in 276ms (compile: 21 ms, reload: 90 ms)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500,
                                    fontSize: Sizes.size14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gaps.h10,
                          Column(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.heart,
                                size: Sizes.size20,
                                color: Colors.grey.shade500,
                              ),
                              Gaps.v2,
                              Text(
                                '52.2K',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade500,
                                  fontSize: Sizes.size14,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      separatorBuilder: (context, index) => Gaps.v20,
                    ),
                  ),
                  Positioned(
                    width: constraints.maxWidth,
                    bottom: 0,
                    child: BottomAppBar(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: Sizes.size2,
                          right: Sizes.size2,
                          //bottom: Sizes.size1,
                          //top: Sizes.size1,
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.grey.shade500,
                              foregroundColor: Colors.white,
                              foregroundImage: const NetworkImage(
                                'https://d1telmomo28umc.cloudfront.net/media/public/avatars/milojk-avatar.jpg',
                              ),
                              child: const Text('Milo'),
                            ),
                            Gaps.h10,
                            Expanded(
                              child: SizedBox(
                                height: Sizes.size44,
                                child: TextField(
                                  onTap: _onStartWriting,
                                  expands: true,
                                  maxLines: null,
                                  minLines: null,
                                  textInputAction: TextInputAction.newline,
                                  cursorColor: Theme.of(context).primaryColor,
                                  decoration: InputDecoration(
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(
                                        right: Sizes.size14,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const FaIcon(
                                            FontAwesomeIcons.at,
                                          ),
                                          Gaps.h5,
                                          const FaIcon(
                                            FontAwesomeIcons.gift,
                                          ),
                                          Gaps.h5,
                                          const FaIcon(
                                            FontAwesomeIcons.faceSmile,
                                          ),
                                          Gaps.h5,
                                          if (_isWriting)
                                            GestureDetector(
                                              onTap: _stopWriting,
                                              child: FaIcon(
                                                FontAwesomeIcons.circleArrowUp,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    hintText: 'Write a Comment ...',
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: Sizes.size12,
                                      //vertical: Sizes.size10,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        Sizes.size12,
                                      ),
                                      borderSide: BorderSide.none,
                                    ),
                                    filled: true,
                                    fillColor: isDark
                                        ? Colors.grey.shade800
                                        : Colors.grey.shade200,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
