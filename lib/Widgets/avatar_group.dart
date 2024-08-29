import 'package:flutter/material.dart';

class AvatarGroup extends StatelessWidget {
  final List<String> avatars;
  final double avatarSize;
  final int maxVisibleAvatars;

  const AvatarGroup({
    super.key,
    required this.avatars,
    this.avatarSize = 40.0,
    this.maxVisibleAvatars = 4,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate available width and the number of avatars that fit
        int visibleAvatars = avatars.length <= maxVisibleAvatars
            ? avatars.length
            : maxVisibleAvatars - 1; // Leave space for the counter

        return Wrap(
          spacing: -avatarSize / 4, // Slight overlap of avatars
          children: [
            for (int i = 0; i < visibleAvatars; i++) _buildAvatar(avatars[i]),
            if (avatars.length > maxVisibleAvatars)
              _buildCounter(avatars.length - visibleAvatars),
          ],
        );
      },
    );
  }

  Widget _buildAvatar(String avatarUrl) {
    return ClipOval(
      child: Image.asset(
        avatarUrl,
        width: avatarSize,
        height: avatarSize,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildCounter(int hiddenCount) {
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[400],
      ),
      child: Center(
        child: Text(
          '+$hiddenCount',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
