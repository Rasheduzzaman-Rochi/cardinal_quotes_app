import 'package:flutter/material.dart';

class MemorialImageCard extends StatelessWidget {
  final String imagePath;
  final String tags;

  const MemorialImageCard({
    super.key,
    required this.imagePath,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 33),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey,
                  child: const Center(child: Text('Image not found')),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tags,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                _buildActionRow(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionIcon(context, icon: Icons.remove_red_eye, text: '567.57k'),
        _buildActionIcon(context, icon: Icons.share, text: 'Share'),
        _buildActionIcon(context, icon: Icons.download, text: 'Download'),
        _buildActionIcon(context, icon: Icons.bookmark, text: 'Save'),
      ],
    );
  }

  Widget _buildActionIcon(
    BuildContext context, {
    required IconData icon,
    required String text,
  }) {
    final iconColor = Colors.white;
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: iconColor,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
