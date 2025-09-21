import 'package:flutter/material.dart';

class FeaturedSection extends StatelessWidget {
  final String title;
  final List<String> imagePaths;
  final bool isSingleItem;

  const FeaturedSection({super.key,
    required this.title,
    required this.imagePaths,
    this.isSingleItem = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final screenWidth = MediaQuery.of(context).size.width;
    // The new parent Padding has a left padding of 24.
    final availableWidth =
        screenWidth - (24.0 + 16.0); // 24 left, 16 right (from parent ListView)
    // Formula to show ~2.2 items.
    final cardWidth = (availableWidth - (1.2 * 12.0)) / 2.5;

    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: colorScheme.onPrimary,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 0),
          SizedBox(
            height: isSingleItem ? 160 : 130,
            child: isSingleItem
                ? Padding(
              padding: const EdgeInsets.only(right: 23.0, bottom: 21),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePaths.first,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(color: Colors.grey),
                ),
              ),
            )
                : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      imagePaths[index],
                      width: cardWidth,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}