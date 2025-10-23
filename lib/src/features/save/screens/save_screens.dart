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
    {
      'imagePath': 'assets/images/memo_2.jpg',
      'tags': '#Ambition    #Inspiration    #Motivational',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      // AppBar similar to audio_list_screen.dart
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
          // New Tab Buttons
          _buildTabBar(context),
          // Content based on selected tab
          Expanded(
            child: IndexedStack(
              index: _selectedTabIndex,
              children: [
                // Audios Tab Content
                _buildAudioContent(),
                // Quotes Tab Content
                _buildQuotesContent(),
                // Wallpapers Tab Content
                _buildWallpapersContent(),
                // Memorial Card Tab Content
                _buildMemorialCardContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build the tab bar
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
              iconPath: 'assets/icons/cardinal_sounds.svg', // Using your icon
              index: 0,
            ),
            const SizedBox(width: 12),
            _buildTabButton(
              context: context,
              text: 'Quotes',
              iconPath: 'assets/icons/cardinal_quotes.svg', // Using your icon
              index: 1,
            ),
            const SizedBox(width: 12),
            _buildTabButton(
              context: context,
              text: 'Wallpapers',
              iconPath: 'assets/icons/wallpaper.svg', // Using your icon
              index: 2,
            ),
            const SizedBox(width: 12),
            _buildTabButton(
              context: context,
              text: 'Memorial Card',
              iconPath: 'assets/icons/memorial_cards.svg', // Using your icon
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
  }) {
    final bool isSelected = _selectedTabIndex == index;
    final colorScheme = Theme.of(context).colorScheme;
    final constantColor = colorScheme.onSurface;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.onPrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: colorScheme.onPrimary, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 16,
              width: 16,
              colorFilter: ColorFilter.mode(
                isSelected ? constantColor : colorScheme.onPrimary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? constantColor : colorScheme.onPrimary,
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
          title: _wiperAudio['title']!,
          imagePath: _wiperAudio['imagePath']!,
          tags: _wiperAudio['tags']!,
        ),
        // Add more saved audios here...
      ],
    );
  }

  // Placeholder content for 'Quotes' tab
  Widget _buildQuotesContent() {
    return Center(
      child: Text(
        'Saved Quotes will appear here.',
        style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
      ),
    );
  }

  // Placeholder content for 'Wallpapers' tab
  Widget _buildWallpapersContent() {
    return Center(
      child: Text(
        'Saved Wallpapers will appear here.',
        style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16),
      ),
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
