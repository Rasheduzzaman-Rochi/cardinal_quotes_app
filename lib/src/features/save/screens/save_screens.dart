import 'package:cardinal_quotes_app/src/common_widgets/memorial_image_card.dart';
import 'package:cardinal_quotes_app/src/features/sounds/widgets/AudioCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  int _selectedTabIndex = 0;

  // Data for the 'Wiper' audio card, as requested
  static const Map<String, String> _wiperAudio = {
    'title': 'Wiper',
    'imagePath': 'assets/images/dummy_car.jpg',
    'tags': '#Ambition    #Inspiration    #Motivational',
  };

  // Dummy data for memorial cards
  static const List<Map<String, String>> _memorialItems = [
    {
      'imagePath': 'assets/images/memo_1.jpg',
      'tags': '#Ambition    #Inspiration    #Motivational',
    },
  ];

  static const List<Map<String, String>> _wallpaperItems = [
    {
      'imagePath': 'assets/images/memo_1.jpg',
      'tags': '#Ambition   #Inspiration...',
    },
    {
      'imagePath': 'assets/images/memo_1.jpg',
      'tags': '#Ambition   #Inspiration...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 2),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_outlined,
                    color: colorScheme.onPrimary,
                    size: 35,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 5),
                Text(
                  'Save',
                  style: TextStyle(
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _buildTabBar(context),
          Expanded(
            child: IndexedStack(
              index: _selectedTabIndex,
              children: [
                _buildAudioContent(),
                _buildQuotesContent(),
                _buildWallpapersContent(),
                _buildMemorialCardContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 21.0),
            _buildTabButton(
              context: context,
              text: 'Audios',
              iconPath: 'assets/icons/sounds.svg',
              filledIconPath: 'assets/icons/sounds_filled.svg',
              index: 0,
            ),
            const SizedBox(width: 12),
            _buildTabButton(
              context: context,
              text: 'Quotes',
              iconPath: 'assets/icons/top.svg',
              filledIconPath: 'assets/icons/top_filled.svg',
              index: 1,
            ),
            const SizedBox(width: 12),
            _buildTabButton(
              context: context,
              text: 'Wallpapers',
              iconPath: 'assets/icons/wallpaper.svg',
              filledIconPath: 'assets/icons/wallpaper.svg',
              index: 2,
            ),
            const SizedBox(width: 12),
            _buildTabButton(
              context: context,
              text: 'Memorial Card',
              iconPath: 'assets/icons/memorial_cards.svg',
              filledIconPath: 'assets/icons/memorial_cards.svg',
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build individual tab buttons (styled like screenshot)
  Widget _buildTabButton({
    required BuildContext context,
    required String text,
    required String iconPath,
    required int index,
    required String? filledIconPath,
  }) {
    final bool isSelected = _selectedTabIndex == index;
    final colorScheme = Theme.of(context).colorScheme;
    final selectedColor = colorScheme.onSurface;

    final String currentIconPath = (isSelected && filledIconPath != null)
        ? filledIconPath
        : iconPath;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.onPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: colorScheme.onPrimary, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              currentIconPath,
              height: 18,
              width: 18,
              colorFilter: ColorFilter.mode(
                isSelected ? selectedColor : colorScheme.onPrimary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? selectedColor : colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Content for 'Audios' tab
  Widget _buildAudioContent() {
    return ListView(
      padding: const EdgeInsets.only(
        left: 21.0,
        right: 21.0,
        top: 0,
        bottom: 10.0,
      ),
      children: [
        // Reusing the AudioCard as requested
        AudioCard(
          title: _wiperAudio['title'] ?? '',
          imagePath: _wiperAudio['imagePath'] ?? '',
          tags: _wiperAudio['tags'] ?? '',
          isSavedScreen: true,
        ),
        // Add more saved audios here...
      ],
    );
  }

  // Placeholder content for 'Quotes' tab
  Widget _buildQuotesContent() {
    return ListView.builder(
      padding: const EdgeInsets.only(
        left: 21.0,
        right: 21.0,
        top: 0,
        bottom: 10.0,
      ),
      itemCount: _memorialItems.length,
      itemBuilder: (context, index) {
        final item = _memorialItems[index];
        return MemorialImageCard(
          imagePath: item['imagePath']!,
          tags: item['tags']!,
        );
      },
    );
  }

  // Placeholder content for 'Wallpapers' tab
  Widget _buildWallpapersContent() {
    return GridView.builder(
      padding: const EdgeInsets.all(24.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 16,
        childAspectRatio: 0.86,
      ),
      itemCount: _wallpaperItems.length,
      itemBuilder: (context, index) {
        final item = _wallpaperItems[index];
        return _buildWallpaperGridItem(
          context: context,
          imagePath: item['imagePath']!,
          tags: item['tags']!,
        );
      },
    );
  }

  Widget _buildWallpaperGridItem({
    required BuildContext context,
    required String imagePath,
    required String tags,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tags,
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 6),
              Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey.withAlpha(204),
                child: const Center(child: Icon(Icons.image_not_supported)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Content for 'Memorial Card' tab
  Widget _buildMemorialCardContent() {
    // Reusing the MemorialImageCard
    return ListView.builder(
      padding: const EdgeInsets.only(
        left: 21.0,
        right: 21.0,
        top: 0,
        bottom: 10.0,
      ),
      itemCount: _memorialItems.length,
      itemBuilder: (context, index) {
        final item = _memorialItems[index];
        return MemorialImageCard(
          imagePath: item['imagePath']!,
          tags: item['tags']!,
        );
      },
    );
  }
}
