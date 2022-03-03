import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miarma_app_flutter/src/models/posts/create_post_dto.dart';
import 'package:miarma_app_flutter/src/ui/pages/create_post_page.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Expanded(
            flex: 1,
            child: SvgPicture.asset(
              'assets/images/logo_miarmapp.svg',
              width: MediaQuery.of(context).size.width * 0.27,
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreatePostPage()),
                    );
                  }),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/add.svg'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.favorite_border),
                ),
                Padding(
                  padding: EdgeInsets.all(11.0),
                  child: SvgPicture.asset('assets/icons/share.svg'),
                )
              ],
            ))
      ]),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
