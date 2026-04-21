import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'web_helpers/download_helper.dart'
    if (dart.library.html) 'web_helpers/download_helper_web.dart';
import 'web_helpers/url_helper.dart'
    if (dart.library.html) 'web_helpers/url_helper_web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abdullah Ibrahim Mokhtar | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF09111F),
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF67E8F9),
          secondary: Color(0xFFF59E0B),
          surface: Color(0xFF111A2D),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.w800,
            height: 0.95,
            letterSpacing: -2.4,
          ),
          displayMedium: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            height: 1.0,
            letterSpacing: -1.4,
          ),
          headlineMedium: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            height: 1.1,
          ),
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          bodyLarge: TextStyle(
            fontSize: 16,
            height: 1.7,
            color: Color(0xFFD7E3F4),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: Color(0xFF9FB2CC),
          ),
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    'About': GlobalKey(),
    'Experience': GlobalKey(),
    'Projects': GlobalKey(),
    'Skills': GlobalKey(),
    'Contact': GlobalKey(),
  };

  final List<ExperienceItem> _experience = const [
    ExperienceItem(
      role: 'Flutter Developer',
      company: 'MATN',
      period: 'Jul 2025 - Present',
      location: 'Riyadh, Saudi Arabia',
      achievements: [
        'Developed scalable Flutter applications using clean architecture and reusable patterns.',
        'Implemented role-based navigation, notifications, and real-time user flows.',
        'Improved UI consistency across products and collaborated on reliable release cycles.',
      ],
    ),
    ExperienceItem(
      role: 'Flutter Developer',
      company: 'UTD Software Solutions',
      period: 'Nov 2024 - Jul 2025',
      location: 'Giza, Egypt',
      achievements: [
        'Built cross-platform apps centered on streaming, live broadcasting, and real-time communication.',
        'Contributed across the full development lifecycle from product design to deployment.',
        'Resolved complex technical issues to improve performance, scalability, and stability.',
      ],
    ),
    ExperienceItem(
      role: 'Flutter Developer',
      company: 'BAYANATZ',
      period: 'Dec 2023 - Nov 2024',
      location: 'Cairo, Egypt',
      achievements: [
        'Developed and maintained Flutter apps for iOS and Android with production-focused best practices.',
        'Optimized Firebase real-time sync, improving app responsiveness by 25%.',
        'Applied GetX and Bloc-based state management to reduce crashes and support maintainable architecture.',
      ],
    ),
    ExperienceItem(
      role: 'Flutter GDSC Training',
      company: 'Google Developer Student Clubs',
      period: 'Jul 2023',
      location: 'Egypt',
      achievements: [
        'Completed advanced Flutter training focused on scalable apps, Firebase integration, and responsive design.',
      ],
    ),
    ExperienceItem(
      role: 'Flutter Summer Training',
      company: 'ITI Minya',
      period: 'Jun 2022',
      location: 'Minya, Egypt',
      achievements: [
        'Built real-world cross-platform projects and strengthened Dart, REST API, and UI/UX implementation skills.',
      ],
    ),
  ];

  final List<ProjectItem> _projects = const [
    ProjectItem(
      title: 'Tawasol',
      label: 'Social Platform',
      description:
          'A social experience combining live voice rooms, public and private chats, and rich media sharing in one seamless Flutter product.',
      bullets: [
        'Built for engaging community interaction with multilingual support and user-friendly flows.',
        'Focused on smooth communication features and safety-aware interaction patterns.',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.matn.talkcat',
    ),
    ProjectItem(
      title: 'Esfnary User App',
      label: 'Grocery Commerce',
      description:
          'A full grocery shopping experience covering product discovery, wallet recharge, checkout, push notifications, and real-time order tracking.',
      bullets: [
        'Implemented with Clean Architecture, BLoC, Firebase, REST APIs, and Google Maps.',
        'Designed for scalable commerce workflows and dependable customer experience.',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.esfnary.app',
      appStoreUrl:
          'https://apps.apple.com/eg/app/%D8%A5%D8%B3%D9%81%D9%86%D8%A7%D8%B1%D9%8A/id6760651024',
    ),
    ProjectItem(
      title: 'Esfnary Delivery App',
      label: 'Last-Mile Logistics',
      description:
          'A delivery-side application for assigned orders, order-status updates, customer communication, and end-to-end tracking.',
      bullets: [
        'Streamlined delivery operations using REST APIs, location services, and real-time tracking.',
        'Built to support reliable field usage and operational clarity for delivery agents.',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.esfnary.delivery.app',
    ),
    ProjectItem(
      title: 'LiBooking',
      label: 'Booking Platform',
      description:
          'A smart hotel, accommodation, and event reservation app with instant updates, offers, and secure booking flows.',
      bullets: [
        'Focused on intuitive reservation UX and a trustworthy transaction experience.',
        'Created to simplify travel planning with rewards and smooth payment journeys.',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.libooking.app',
      appStoreUrl: 'https://apps.apple.com/eg/app/libooking/id6754592394',
    ),
    ProjectItem(
      title: 'Mushaf Libya',
      label: 'Quran App',
      description:
          'A Quran reading and listening experience with surah browsing, reciter selection, bookmarking, verse search, and a calm, accessible interface.',
      bullets: [
        'Included night mode, audio playback controls, and user-friendly reading flows.',
        'Designed for a smooth spiritual experience across everyday use cases.',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.mushaf.libya_app',
      appStoreUrl:
          'https://apps.apple.com/eg/app/%D9%85%D8%B5%D8%AD%D9%81-%D9%84%D9%8A%D8%A8%D9%8A%D8%A7/id6756428656',
    ),
    ProjectItem(
      title: 'BarterIt',
      label: 'Community Marketplace',
      description:
          'A marketplace app for selling and exchanging products with secure authentication, real-time chat, multilingual support, and map-based interactions.',
      bullets: [
        'Created to support local buying and selling with a smooth buyer-seller journey.',
        'Combined Firebase Authentication, Maps integration, and live communication features.',
      ],
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.barterit.app',
      githubUrl: 'https://github.com/abdallah011588/barterIt',
    ),
    ProjectItem(
      title: 'Marketna E-commerce Suite',
      label: 'Multi-App System',
      description:
          'A complete e-commerce suite spanning user, admin control panel, and delivery apps built with Flutter, PHP, and MVC.',
      bullets: [
        'Included Google Maps, Firebase notifications, real-time updates, and multilingual support.',
        'Delivered coordinated tooling for customers, operators, and delivery workflows.',
      ],
      githubUrl: 'https://github.com/abdallah011588/MARKETNA',
    ),
    ProjectItem(
      title: 'SDTS Security',
      label: 'Graduation Project',
      description:
          'A security-focused application using computer vision and machine learning for real-time detection and tracking of unfamiliar individuals.',
      bullets: [
        'Added monitoring and alert-generation concepts for proactive surveillance scenarios.',
        'Designed as a scalable enhancement layer for existing security systems.',
      ],
      githubUrl: 'https://github.com/abdallah011588/SDTS-Security',
    ),
  ];

  final List<SkillGroup> _skillGroups = const [
    SkillGroup(
      title: 'Core Mobile Stack',
      items: [
        'Flutter',
        'Dart',
        'Clean Architecture',
        'OOP',
        'Responsive UI',
        'Custom Animations',
      ],
    ),
    SkillGroup(
      title: 'State And Data',
      items: ['Bloc', 'Cubit', 'Provider', 'GetX', 'REST APIs', 'Dio', 'Http'],
    ),
    SkillGroup(
      title: 'Firebase And Storage',
      items: [
        'Authentication',
        'Firestore',
        'Messaging',
        'Storage',
        'Realtime Database',
        'Sqflite',
        'Hive',
        'SharedPreferences',
      ],
    ),
    SkillGroup(
      title: 'Delivery And Quality',
      items: [
        'Git',
        'GitHub',
        'GitHub Actions',
        'Unit Testing',
        'Widget Testing',
        'Integration Testing',
        'Play Store Distribution',
        'Firebase App Distribution',
      ],
    ),
  ];

  void _scrollTo(String section) {
    final context = _sectionKeys[section]?.currentContext;
    if (context == null) {
      return;
    }
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeInOutCubic,
      alignment: 0.08,
    );
  }

  Future<void> _copyValue(String label, String value) async {
    await Clipboard.setData(ClipboardData(text: value));
    if (!mounted) {
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$label copied to clipboard'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= 1100;
    final horizontalPadding =
        width >= 1400
            ? 88.0
            : width >= 900
            ? 44.0
            : 20.0;

    return Scaffold(
      body: Stack(
        children: [
          const _PageBackdrop(),
          SafeArea(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _HeaderDelegate(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        horizontalPadding,
                        0,
                        horizontalPadding,
                        0,
                      ),
                      child: _TopBar(
                        isDesktop: isDesktop,
                        onSelectSection: _scrollTo,
                        onDownloadCv: () {
                          downloadFile(
                            url:
                                'assets/documents/abdullah_ibrahim_mokhtar_cv.pdf',
                            fileName: 'Abdullah_Ibrahim_Mokhtar_CV.pdf',
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 28),
                        _HeroSection(
                          isDesktop: isDesktop,
                          onNavigate: _scrollTo,
                          onCopyEmail:
                              () => _copyValue(
                                'Email',
                                'abdullah.ibrahim8855@gmail.com',
                              ),
                          onCopyPhone:
                              () => _copyValue('Phone', '+201158861697'),
                          onDownloadCv: () {
                            downloadFile(
                              url:
                                  'assets/documents/abdullah_ibrahim_mokhtar_cv.pdf',
                              fileName: 'Abdullah_Ibrahim_Mokhtar_CV.pdf',
                            );
                          },
                        ),
                        const SizedBox(height: 28),
                        _SectionShell(
                          key: _sectionKeys['About'],
                          eyebrow: 'About',
                          title:
                              'Building dependable Flutter products with clean architecture and thoughtful UX.',
                          child: _AboutSection(isDesktop: isDesktop),
                        ),
                        const SizedBox(height: 28),
                        _SectionShell(
                          key: _sectionKeys['Experience'],
                          eyebrow: 'Experience',
                          title:
                              'A delivery-focused timeline across product teams, communication apps, and commerce platforms.',
                          child: _ExperienceSection(items: _experience),
                        ),
                        const SizedBox(height: 28),
                        _SectionShell(
                          key: _sectionKeys['Projects'],
                          eyebrow: 'Selected Work',
                          title:
                              'Production-style apps spanning social, commerce, booking, logistics, and security.',
                          child: _ProjectsSection(projects: _projects),
                        ),
                        const SizedBox(height: 28),
                        _SectionShell(
                          key: _sectionKeys['Skills'],
                          eyebrow: 'Capabilities',
                          title:
                              'The tools, architecture patterns, and delivery habits behind my Flutter work.',
                          child: _SkillsSection(skillGroups: _skillGroups),
                        ),
                        const SizedBox(height: 28),
                        _SectionShell(
                          key: _sectionKeys['Contact'],
                          eyebrow: 'Contact',
                          title:
                              'Open to Flutter roles, freelance builds, and product teams that care about quality.',
                          child: _ContactSection(
                            isDesktop: isDesktop,
                            onCopyEmail:
                                () => _copyValue(
                                  'Email',
                                  'abdullah.ibrahim8855@gmail.com',
                                ),
                            onCopyPhone:
                                () => _copyValue('Phone', '+201158861697'),
                            onCopyGitHub:
                                () => _copyValue(
                                  'GitHub',
                                  'https://github.com/abdallah011588',
                                ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        const _Footer(),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({
    required this.isDesktop,
    required this.onSelectSection,
    required this.onDownloadCv,
  });

  final bool isDesktop;
  final ValueChanged<String> onSelectSection;
  final VoidCallback onDownloadCv;

  @override
  Widget build(BuildContext context) {
    final navItems = ['About', 'Experience', 'Projects', 'Skills', 'Contact'];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 0),
      decoration: BoxDecoration(
        color: const Color(0xCC0D1628),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0x1FFFFFFF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 30,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Abdullah Ibrahim Mokhtar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 2),
                Text(
                  'Flutter Developer',
                  style: TextStyle(color: Color(0xFF9FB2CC)),
                ),
              ],
            ),
          ),
          if (isDesktop)
            Wrap(
              spacing: 8,
              children:
                  navItems
                      .map(
                        (item) => TextButton(
                          onPressed: () => onSelectSection(item),
                          child: Text(item),
                        ),
                      )
                      .toList(),
            ),
          const SizedBox(width: 10),
          FilledButton(
            onPressed: onDownloadCv,
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF67E8F9),
              foregroundColor: const Color(0xFF041019),
            ),
            child: const Text('Download CV'),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.isDesktop,
    required this.onNavigate,
    required this.onCopyEmail,
    required this.onCopyPhone,
    required this.onDownloadCv,
  });

  final bool isDesktop;
  final ValueChanged<String> onNavigate;
  final VoidCallback onCopyEmail;
  final VoidCallback onCopyPhone;
  final VoidCallback onDownloadCv;

  @override
  Widget build(BuildContext context) {
    final heroText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF112238),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: const Color(0x2D67E8F9)),
          ),
          child: const Text(
            '3+ years building production Flutter apps for mobile teams',
            style: TextStyle(
              color: Color(0xFF67E8F9),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'Flutter developer crafting scalable products with fast UI, clean architecture, and real-time experiences.',
          style: Theme.of(
            context,
          ).textTheme.displayLarge?.copyWith(fontSize: isDesktop ? 68 : 42),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: const Text(
            'I build polished mobile applications for iOS and Android, with hands-on experience in social platforms, e-commerce, booking, delivery, and real-time communication products.',
          ),
        ),
        const SizedBox(height: 26),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton(
              onPressed: () => onNavigate('Projects'),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFF59E0B),
                foregroundColor: const Color(0xFF17110A),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
              child: const Text('View Projects'),
            ),
            OutlinedButton(
              onPressed: onDownloadCv,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF355070)),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
              ),
              child: const Text('Get Resume'),
            ),
            TextButton(
              onPressed: () => onNavigate('Contact'),
              child: const Text('Let\'s Work Together'),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _MetricCard(value: '3+', label: 'Years of experience'),
            _MetricCard(value: '8+', label: 'Portfolio-grade projects'),
            _MetricCard(
              value: '25%',
              label: 'Firebase sync improvement achieved',
            ),
          ],
        ),
      ],
    );

    final heroSide = Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF12233C), Color(0xFF0F172A), Color(0xFF1A1031)],
            ),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: const Color(0x1FFFFFFF)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(radius: 28, child: Icon(Icons.person_rounded)),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Abdullah Ibrahim Mokhtar',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Cairo, Egypt',
                          style: TextStyle(color: Color(0xFF9FB2CC)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const _InfoTile(
                title: 'Current focus',
                value:
                    'Scalable Flutter apps, clean architecture, and reliable real-time product flows.',
              ),
              const SizedBox(height: 14),
              const _InfoTile(
                title: 'Best-fit work',
                value:
                    'Cross-platform mobile products with strong UX, performance, and maintainable codebases.',
              ),
              const SizedBox(height: 14),
              const _InfoTile(
                title: 'Strengths',
                value:
                    'Bloc, Firebase, API integration, responsive UI, release readiness, and team collaboration.',
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _ContactChip(
                    icon: Icons.email_outlined,
                    text: 'Copy Email',
                    onTap: onCopyEmail,
                  ),
                  _ContactChip(
                    icon: Icons.phone_outlined,
                    text: 'Copy Phone',
                    onTap: onCopyPhone,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0E1728), Color(0xFF0B1221)],
        ),
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: const Color(0x1FFFFFFF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 40,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child:
          isDesktop
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: heroText),
                  const SizedBox(width: 24),
                  Expanded(flex: 2, child: heroSide),
                ],
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [heroText, const SizedBox(height: 20), heroSide],
              ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection({required this.isDesktop});

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final cards = [
      const _HighlightCard(
        title: 'Product mindset',
        description:
            'I focus on building features that feel clear for users and maintainable for teams, not just shipping screens.',
        icon: Icons.auto_awesome_mosaic_rounded,
      ),
      const _HighlightCard(
        title: 'Architecture discipline',
        description:
            'Clean Architecture, reusable components, and strong state management choices help me scale apps with confidence.',
        icon: Icons.account_tree_outlined,
      ),
      const _HighlightCard(
        title: 'Real-time expertise',
        description:
            'I have direct experience with chat, streaming, notifications, tracking, and Firebase-backed responsive flows.',
        icon: Icons.bolt_outlined,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Mobile application developer with 3+ years of experience building user-focused Flutter applications for iOS and Android. I enjoy turning product requirements into responsive, intuitive experiences with reliable architecture, careful attention to UI detail, and a collaborative engineering approach.',
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children:
              cards
                  .map(
                    (card) => SizedBox(
                      width: isDesktop ? 300 : double.infinity,
                      child: card,
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection({required this.items});

  final List<ExperienceItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          items
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0E1728),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0x1FFFFFFF)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.only(top: 8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF67E8F9),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    item.role,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF12233C),
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: Text(item.company),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                '${item.period}  |  ${item.location}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 14),
                              ...item.achievements.map(
                                (point) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Icon(
                                          Icons.circle,
                                          size: 7,
                                          color: Color(0xFFF59E0B),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(child: Text(point)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({required this.projects});

  final List<ProjectItem> projects;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns =
            constraints.maxWidth > 1150
                ? 3
                : constraints.maxWidth > 760
                ? 2
                : 1;
        final itemWidth =
            (constraints.maxWidth - ((columns - 1) * 16)) / columns;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children:
              projects
                  .map(
                    (project) => SizedBox(
                      width: itemWidth,
                      child: Container(
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D1628),
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(color: const Color(0x1FFFFFFF)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B2640),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                project.label,
                                style: const TextStyle(
                                  color: Color(0xFF67E8F9),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              project.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 12),
                            Text(project.description),
                            const SizedBox(height: 16),
                            ...project.bullets.map(
                              (point) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 6),
                                      child: Icon(
                                        Icons.arrow_outward_rounded,
                                        size: 16,
                                        color: Color(0xFFF59E0B),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        point,
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (project.hasAnyLinks) ...[
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  if (project.githubUrl != null)
                                    _SourceIconButton(
                                      icon: Icons.code_rounded,
                                      label: 'GitHub',
                                      onTap: () =>
                                          openExternalUrl(project.githubUrl!),
                                    ),
                                  if (project.playStoreUrl != null)
                                    _SourceIconButton(
                                      icon: Icons.android_rounded,
                                      label: 'Play',
                                      onTap: () => openExternalUrl(
                                        project.playStoreUrl!,
                                      ),
                                    ),
                                  if (project.appStoreUrl != null)
                                    _SourceIconButton(
                                      icon: Icons.apple_rounded,
                                      label: 'App Store',
                                      onTap: () => openExternalUrl(
                                        project.appStoreUrl!,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection({required this.skillGroups});

  final List<SkillGroup> skillGroups;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth > 1000 ? 2 : 1;
        final itemWidth =
            (constraints.maxWidth - ((columns - 1) * 16)) / columns;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children:
              skillGroups
                  .map(
                    (group) => SizedBox(
                      width: itemWidth,
                      child: Container(
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0E1728),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: const Color(0x1FFFFFFF)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              group.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children:
                                  group.items
                                      .map(
                                        (skill) => Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF14213A),
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                            border: Border.all(
                                              color: const Color(0x22355A7A),
                                            ),
                                          ),
                                          child: Text(skill),
                                        ),
                                      )
                                      .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection({
    required this.isDesktop,
    required this.onCopyEmail,
    required this.onCopyPhone,
    required this.onCopyGitHub,
  });

  final bool isDesktop;
  final VoidCallback onCopyEmail;
  final VoidCallback onCopyPhone;
  final VoidCallback onCopyGitHub;

  @override
  Widget build(BuildContext context) {
    final left = Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1728),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0x1FFFFFFF)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'I enjoy working on products that need both engineering discipline and user-friendly design.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 14),
          Text(
            'This portfolio already includes your core contact details, CV, and project source links. If you want, I can still add a LinkedIn profile link, profile photo, and project screenshots as a final polish pass.',
          ),
        ],
      ),
    );

    final right = Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF10213A), Color(0xFF111827)],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0x1FFFFFFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ContactActionRow(
            label: 'Email',
            value: 'abdullah.ibrahim8855@gmail.com',
            onTap: onCopyEmail,
          ),
          const SizedBox(height: 12),
          _ContactActionRow(
            label: 'Phone',
            value: '+20 115 886 1697',
            onTap: onCopyPhone,
          ),
          const SizedBox(height: 12),
          _ContactActionRow(
            label: 'GitHub',
            value: 'github.com/abdallah011588',
            onTap: onCopyGitHub,
          ),
          const SizedBox(height: 12),
          const _ContactActionRow(label: 'Location', value: 'Cairo, Egypt'),
        ],
      ),
    );

    return isDesktop
        ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: left),
            const SizedBox(width: 16),
            Expanded(child: right),
          ],
        )
        : Column(children: [left, const SizedBox(height: 16), right]);
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFF0B1221),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0x1FFFFFFF)),
      ),
      child: const Text(
        'Designed and built in Flutter Web. Crafted for a professional, modern first impression.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xFF9FB2CC)),
      ),
    );
  }
}

class _SectionShell extends StatelessWidget {
  const _SectionShell({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.child,
  });

  final String eyebrow;
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xB30C1424),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0x1FFFFFFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eyebrow.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF67E8F9),
              fontSize: 13,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 850),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 22),
          child,
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF101B30),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0x1FFFFFFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color(0xFFF59E0B),
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _HighlightCard extends StatelessWidget {
  const _HighlightCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1728),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0x1FFFFFFF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF67E8F9)),
          const SizedBox(height: 14),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Text(description, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFFF59E0B),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(value),
      ],
    );
  }
}

class _ContactChip extends StatelessWidget {
  const _ContactChip({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1628),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: const Color(0x1FFFFFFF)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: const Color(0xFF67E8F9)),
            const SizedBox(width: 8),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class _ContactActionRow extends StatelessWidget {
  const _ContactActionRow({
    required this.label,
    required this.value,
    this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1628),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0x1FFFFFFF)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFFF59E0B),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(value),
              ],
            ),
          ),
          if (onTap != null)
            TextButton(onPressed: onTap, child: const Text('Copy')),
        ],
      ),
    );
  }
}

class _SourceIconButton extends StatelessWidget {
  const _SourceIconButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF15233B),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0x22355A7A)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: const Color(0xFF67E8F9)),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageBackdrop extends StatelessWidget {
  const _PageBackdrop();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        fit: StackFit.expand,
        children: const [
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF08111E),
                  Color(0xFF0B1221),
                  Color(0xFF09101B),
                ],
              ),
            ),
          ),
          Positioned(
            top: -80,
            left: -20,
            child: _GlowOrb(size: 260, color: Color(0x2267E8F9)),
          ),
          Positioned(
            top: 220,
            right: -40,
            child: _GlowOrb(size: 300, color: Color(0x22F59E0B)),
          ),
          Positioned(
            bottom: -30,
            left: 80,
            child: _GlowOrb(size: 240, color: Color(0x2214B8A6)),
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, color.withValues(alpha: 0.0)]),
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  _HeaderDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 92;

  @override
  double get maxExtent => 92;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _HeaderDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}

class ExperienceItem {
  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.achievements,
  });

  final String role;
  final String company;
  final String period;
  final String location;
  final List<String> achievements;
}

class ProjectItem {
  const ProjectItem({
    required this.title,
    required this.label,
    required this.description,
    required this.bullets,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
  });

  final String title;
  final String label;
  final String description;
  final List<String> bullets;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;

  bool get hasAnyLinks =>
      githubUrl != null || playStoreUrl != null || appStoreUrl != null;
}

class SkillGroup {
  const SkillGroup({required this.title, required this.items});

  final String title;
  final List<String> items;
}
