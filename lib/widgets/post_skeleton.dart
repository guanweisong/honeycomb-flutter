import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class PostSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> postInfo = [];
    for (var i = 0; i < 4; i++) {
      postInfo.add(
        Row(
          children: const [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.circle, width: 14, height: 14),
            ),
            SizedBox(width: 2),
            SkeletonLine(
              style: SkeletonLineStyle(
                height: 14,
                width: 50,
                alignment: AlignmentDirectional.center,
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.all(12),
      child: SkeletonItem(
        child: Column(
          children: [
            const SizedBox(height: 18),
            const SkeletonLine(
              style: SkeletonLineStyle(
                height: 16,
                width: 200,
                alignment: AlignmentDirectional.center,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: postInfo,
            ),
            const SizedBox(height: 12),
            const SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: double.infinity,
                height: 200,
              ),
            ),
            SkeletonParagraph(
              style: SkeletonParagraphStyle(
                lines: 3,
                spacing: 6,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 10,
                  borderRadius: BorderRadius.circular(8),
                  minLength: 50,
                  maxLength: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
