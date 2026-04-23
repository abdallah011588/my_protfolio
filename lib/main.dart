import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'web_helpers/download_helper.dart'
    if (dart.library.html) 'web_helpers/download_helper_web.dart';
import 'web_helpers/url_helper.dart'
    if (dart.library.html) 'web_helpers/url_helper_web.dart';

void main() {
  runApp(const PortfolioApp());
}

// ─── Theme constants ───────────────────────────────────────────────
const kBg = Color(0xFF050810);
const kBg2 = Color(0xFF090D1A);
const kSurface = Color(0xFF0D1221);
const kSurface2 = Color(0xFF111827);
const kBorder = Color(0xFF1E2D4A);
const kBorder2 = Color(0xFF243352);
const kBlue = Color(0xFF4A9EFF);
const kPurple = Color(0xFFA78BFA);
const kPink = Color(0xFFF472B6);
const kGreen = Color(0xFF34D399);
const kText = Color(0xFFE8EDF8);
const kText2 = Color(0xFF8B9BC8);
const kText3 = Color(0xFF4A5A80);

const kEmailAddress = 'abdullah.ibrahim8855@gmail.com';
const kPhoneNumber = '+20 115 886 1697';
const kPhoneUri = 'tel:+201158861697';
const kGitHubProfile = 'https://github.com/abdallah011588';
const kLinkedInProfile =
    'https://www.linkedin.com/in/abdullah-ibrahim-mokhtar-548400236?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app';
const kCvAssetUrl = 'assets/assets/documents/abdullah_ibrahim_mokhtar_cv.pdf';
const kCvFileName = 'abdullah_ibrahim_mokhtar_cv.pdf';

void _downloadCv() => downloadFile(url: kCvAssetUrl, fileName: kCvFileName);

void _openEmail() => openExternalUrl('mailto:$kEmailAddress');

void _openPhone() => openExternalUrl(kPhoneUri);

void _openGitHub() => openExternalUrl(kGitHubProfile);

void _openLinkedIn() => openExternalUrl(kLinkedInProfile);

// ─── Data models ───────────────────────────────────────────────────
class ExperienceItem {
  final String role, company, period, location;
  final List<String> achievements;
  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.achievements,
  });
}

class ProjectItem {
  final String title, label, description;
  final List<String> bullets;
  final String? github, playStore, appStore;
  const ProjectItem({
    required this.title,
    required this.label,
    required this.description,
    required this.bullets,
    this.github,
    this.playStore,
    this.appStore,
  });
  bool get hasLinks => github != null || playStore != null || appStore != null;
}

class SkillGroup {
  final String title, emoji;
  final List<String> items;
  const SkillGroup({
    required this.title,
    required this.emoji,
    required this.items,
  });
}

// ─── Data ──────────────────────────────────────────────────────────
const kExperience = [
  ExperienceItem(
    role: 'Flutter Developer',
    company: 'MATN',
    period: 'Jul 2025 – Present',
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
    period: 'Nov 2024 – Jul 2025',
    location: 'Giza, Egypt',
    achievements: [
      'Built cross-platform apps for streaming, live broadcasting, and real-time communication.',
      'Contributed across the full development lifecycle from product design to deployment.',
      'Resolved complex technical issues to improve performance, scalability, and stability.',
    ],
  ),
  ExperienceItem(
    role: 'Flutter Developer',
    company: 'BAYANATZ',
    period: 'Dec 2023 – Nov 2024',
    location: 'Cairo, Egypt',
    achievements: [
      'Developed and maintained Flutter apps for iOS and Android with production best practices.',
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
      'Built real-world cross-platform projects and strengthened Dart, REST API, and UI/UX skills.',
    ],
  ),
];

const kProjects = [
  ProjectItem(
    title: 'Tawasol',
    label: 'Social Platform',
    description:
        'A social experience combining live voice rooms, public and private chats, and rich media sharing in one seamless Flutter product.',
    bullets: [
      'Multilingual support and user-friendly flows',
      'Safety-aware interaction patterns',
    ],
    playStore: 'https://play.google.com/store/apps/details?id=com.matn.talkcat',
  ),
  ProjectItem(
    title: 'Esfnary User',
    label: 'Grocery Commerce',
    description:
        'Full grocery shopping experience covering product discovery, wallet recharge, checkout, push notifications, and real-time order tracking.',
    bullets: [
      'Clean Architecture, BLoC, Firebase, Google Maps',
      'Scalable commerce workflows',
    ],
    playStore: 'https://play.google.com/store/apps/details?id=com.esfnary.app',
    appStore:
        'https://apps.apple.com/eg/app/%D8%A5%D8%B3%D9%81%D9%86%D8%A7%D8%B1%D9%8A/id6760651024',
  ),
  ProjectItem(
    title: 'Esfnary Delivery',
    label: 'Last-Mile Logistics',
    description:
        'A delivery-side application for assigned orders, order-status updates, customer communication, and end-to-end tracking.',
    bullets: [
      'REST APIs, location services, real-time tracking',
      'Operational clarity for delivery agents',
    ],
    playStore:
        'https://play.google.com/store/apps/details?id=com.esfnary.delivery.app',
  ),
  ProjectItem(
    title: 'LiBooking',
    label: 'Booking Platform',
    description:
        'Smart hotel, accommodation, and event reservation app with instant updates, offers, and secure booking flows.',
    bullets: [
      'Intuitive reservation UX and secure transactions',
      'Rewards and smooth payment journeys',
    ],
    playStore:
        'https://play.google.com/store/apps/details?id=com.libooking.app',
    appStore: 'https://apps.apple.com/eg/app/libooking/id6754592394',
  ),
  ProjectItem(
    title: 'Mushaf Libya',
    label: 'Quran App',
    description:
        'Quran reading and listening experience with surah browsing, reciter selection, bookmarking, verse search, and accessible interface.',
    bullets: [
      'Night mode, audio playback controls',
      'Smooth spiritual UX across everyday use',
    ],
    playStore:
        'https://play.google.com/store/apps/details?id=com.mushaf.libya_app',
    appStore:
        'https://apps.apple.com/eg/app/%D9%85%D8%B5%D8%AD%D9%81-%D9%84%D9%8A%D8%A8%D9%8A%D8%A7/id6756428656',
  ),
  ProjectItem(
    title: 'BarterIt',
    label: 'Community Marketplace',
    description:
        'Marketplace app for selling and exchanging products with secure auth, real-time chat, multilingual support, and map-based interactions.',
    bullets: [
      'Firebase Auth, Maps, live communication',
      'Smooth buyer-seller journey',
    ],
    playStore: 'https://play.google.com/store/apps/details?id=com.barterit.app',
    github: 'https://github.com/abdallah011588/barterIt',
  ),
  ProjectItem(
    title: 'Marketna Suite',
    label: 'Multi-App System',
    description:
        'Complete e-commerce suite spanning user, admin control panel, and delivery apps built with Flutter, PHP, and MVC.',
    bullets: [
      'Google Maps, Firebase, multilingual support',
      'Coordinated tooling for all user roles',
    ],
    github: 'https://github.com/abdallah011588/MARKETNA',
  ),
  ProjectItem(
    title: 'SDTS Security',
    label: 'Graduation Project',
    description:
        'Security-focused application using computer vision and machine learning for real-time detection of unfamiliar individuals.',
    bullets: [
      'Alert-generation for proactive surveillance',
      'Scalable enhancement layer for security systems',
    ],
    github: 'https://github.com/abdallah011588/SDTS-Security',
  ),
];

const kSkills = [
  SkillGroup(
    title: 'Core Mobile Stack',
    emoji: '📱',
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
    title: 'State & Data',
    emoji: '⚡',
    items: ['Bloc', 'Cubit', 'Provider', 'GetX', 'REST APIs', 'Dio', 'Http'],
  ),
  SkillGroup(
    title: 'Firebase & Storage',
    emoji: '🔥',
    items: [
      'Authentication',
      'Firestore',
      'Messaging',
      'Storage',
      'Realtime DB',
      'Sqflite',
      'Hive',
      'SharedPrefs',
    ],
  ),
  SkillGroup(
    title: 'Delivery & Quality',
    emoji: '🚀',
    items: [
      'Git',
      'GitHub',
      'GitHub Actions',
      'Unit Testing',
      'Widget Testing',
      'Integration Testing',
      'Play Store',
      'Firebase App Dist.',
    ],
  ),
];

// ─── App ───────────────────────────────────────────────────────────
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Abdullah Ibrahim Mokhtar | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBg,
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: kBlue,
          secondary: kPurple,
          surface: kSurface,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 62,
            fontWeight: FontWeight.w800,
            height: .95,
            letterSpacing: -2.5,
            color: kText,
          ),
          headlineLarge: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w800,
            height: 1.05,
            letterSpacing: -1.5,
            color: kText,
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.15,
            color: kText,
          ),
          titleLarge: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: kText,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kText,
          ),
          bodyLarge: TextStyle(fontSize: 16, height: 1.75, color: kText2),
          bodyMedium: TextStyle(fontSize: 14, height: 1.7, color: kText2),
          bodySmall: TextStyle(fontSize: 12, color: kText3),
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}

// ─── Main page ─────────────────────────────────────────────────────
class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with TickerProviderStateMixin {
  final _scroll = ScrollController();
  late AnimationController _particleCtrl;
  late AnimationController _gradientCtrl;
  late AnimationController _orbitCtrl;
  late AnimationController _pulseCtrl;
  bool _navScrolled = false;

  final _sectionKeys = {
    'About': GlobalKey(),
    'Experience': GlobalKey(),
    'Projects': GlobalKey(),
    'Skills': GlobalKey(),
    'Contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _particleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    _gradientCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
    _orbitCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _scroll.addListener(() {
      final scrolled = _scroll.offset > 50;
      if (scrolled != _navScrolled) setState(() => _navScrolled = scrolled);
    });
  }

  @override
  void dispose() {
    _particleCtrl.dispose();
    _gradientCtrl.dispose();
    _orbitCtrl.dispose();
    _pulseCtrl.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _scrollTo(String key) {
    final ctx = _sectionKeys[key]?.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      alignment: .05,
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isDesktop = w >= 1024;
    final hPad =
        w >= 1400
            ? 80.0
            : w >= 900
            ? 44.0
            : 20.0;

    return Scaffold(
      body: Stack(
        children: [
          // Animated particle background
          AnimatedBuilder(
            animation: _particleCtrl,
            builder:
                (_, __) => CustomPaint(
                  painter: _ParticlePainter(_particleCtrl.value),
                  size: MediaQuery.sizeOf(context),
                ),
          ),
          // Main scroll content
          SafeArea(
            child: CustomScrollView(
              controller: _scroll,
              slivers: [
                // Sticky nav
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _NavDelegate(
                    height: isDesktop ? 76.0 : 68.0,
                    child: _NavBar(
                      scrolled: _navScrolled,
                      isDesktop: isDesktop,
                      hPad: hPad,
                      onNav: _scrollTo,
                      gradientAnim: _gradientCtrl,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: hPad),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _HeroSection(
                          isDesktop: isDesktop,
                          gradientAnim: _gradientCtrl,
                          orbitAnim: _orbitCtrl,
                          pulseAnim: _pulseCtrl,
                          onNav: _scrollTo,
                        ),
                        const SizedBox(height: 32),
                        _RevealSection(
                          key: _sectionKeys['About'],
                          child: _AboutSection(isDesktop: isDesktop),
                        ),
                        const SizedBox(height: 32),
                        _RevealSection(
                          key: _sectionKeys['Experience'],
                          child: _ExperienceSection(isDesktop: isDesktop),
                        ),
                        const SizedBox(height: 32),
                        _RevealSection(
                          key: _sectionKeys['Projects'],
                          child: _ProjectsSection(isDesktop: isDesktop),
                        ),
                        const SizedBox(height: 32),
                        _RevealSection(
                          key: _sectionKeys['Skills'],
                          child: _SkillsSection(isDesktop: isDesktop),
                        ),
                        const SizedBox(height: 32),
                        _RevealSection(
                          key: _sectionKeys['Contact'],
                          child: _ContactSection(isDesktop: isDesktop),
                        ),
                        const SizedBox(height: 32),
                        _Footer(),
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

// ─── Particle background painter ───────────────────────────────────
class _Particle {
  late double x, y, vx, vy, size, phase;
  late Color color;
  _Particle(double w, double h, math.Random rng) {
    x = rng.nextDouble() * w;
    y = rng.nextDouble() * h;
    vx = (rng.nextDouble() - .5) * .4;
    vy = (rng.nextDouble() - .5) * .4;
    size = rng.nextDouble() * 1.5 + .5;
    phase = rng.nextDouble();
    final colors = [kBlue, kPurple, kPink];
    color = colors[rng.nextInt(colors.length)];
  }
}

class _ParticlePainter extends CustomPainter {
  final double t;
  static List<_Particle>? _particles;
  static double _lastW = 0, _lastH = 0;

  _ParticlePainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    if (_particles == null || _lastW != size.width || _lastH != size.height) {
      final rng = math.Random(42);
      _particles = List.generate(
        100,
        (_) => _Particle(size.width, size.height, rng),
      );
      _lastW = size.width;
      _lastH = size.height;
    }
    final pts = _particles!;
    for (final p in pts) {
      p.x += p.vx;
      p.y += p.vy;
      if (p.x < 0) p.x = size.width;
      if (p.x > size.width) p.x = 0;
      if (p.y < 0) p.y = size.height;
      if (p.y > size.height) p.y = 0;
    }
    // Draw connections
    final linePaint = Paint()..strokeWidth = .5;
    for (int i = 0; i < pts.length; i++) {
      for (int j = i + 1; j < pts.length; j++) {
        final dx = pts[i].x - pts[j].x, dy = pts[i].y - pts[j].y;
        final d = math.sqrt(dx * dx + dy * dy);
        if (d < 120) {
          linePaint.color = kBlue.withValues(alpha: (1 - d / 120) * .07);
          canvas.drawLine(
            Offset(pts[i].x, pts[i].y),
            Offset(pts[j].x, pts[j].y),
            linePaint,
          );
        }
      }
    }
    // Draw particles
    for (final p in pts) {
      final a = (math.sin((t + p.phase) * 2 * math.pi) * .5 + .5) * .5 + .1;
      canvas.drawCircle(
        Offset(p.x, p.y),
        p.size,
        Paint()..color = p.color.withValues(alpha: a),
      );
    }
    // Glow orbs
    final orbs = [
      (size.width * .1, size.height * .15, 260.0, kBlue, .08),
      (size.width * .85, size.height * .3, 300.0, kPurple, .07),
      (size.width * .4, size.height * .8, 220.0, kPink, .06),
    ];
    for (final (x, y, r, c, a) in orbs) {
      canvas.drawCircle(
        Offset(x, y),
        r,
        Paint()
          ..shader = RadialGradient(
            colors: [c.withValues(alpha: a), Colors.transparent],
          ).createShader(Rect.fromCircle(center: Offset(x, y), radius: r)),
      );
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter old) => true;
}

// ─── Nav bar ───────────────────────────────────────────────────────
class _NavBar extends StatelessWidget {
  final bool scrolled, isDesktop;
  final double hPad;
  final ValueChanged<String> onNav;
  final Animation<double> gradientAnim;
  const _NavBar({
    required this.scrolled,
    required this.isDesktop,
    required this.hPad,
    required this.onNav,
    required this.gradientAnim,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: scrolled ? kBg.withValues(alpha: .9) : Colors.transparent,
        border: scrolled ? Border(bottom: BorderSide(color: kBorder)) : null,
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter:
              scrolled
                  ? const BlurFilter().filter
                  : const BlurFilter(sigma: 0).filter,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 12),
            child:
                isDesktop
                    ? _DesktopNav(onNav: onNav, gradientAnim: gradientAnim)
                    : _MobileNav(onNav: onNav, gradientAnim: gradientAnim),
          ),
        ),
      ),
    );
  }
}

class BlurFilter {
  final double sigma;

  const BlurFilter({this.sigma = 20});

  ImageFilter get filter {
    return ImageFilter.blur(sigmaX: sigma, sigmaY: sigma);
  }
}

class _DesktopNav extends StatelessWidget {
  final ValueChanged<String> onNav;
  final Animation<double> gradientAnim;
  const _DesktopNav({required this.onNav, required this.gradientAnim});

  @override
  Widget build(BuildContext context) {
    const navItems = ['About', 'Experience', 'Projects', 'Skills', 'Contact'];
    return Row(
      children: [
        AnimatedBuilder(
          animation: gradientAnim,
          builder:
              (_, __) => ShaderMask(
                shaderCallback:
                    (bounds) => LinearGradient(
                      colors: [kBlue, kPurple],
                      transform: GradientRotation(
                        gradientAnim.value * 2 * math.pi,
                      ),
                    ).createShader(bounds),
                child: const Text(
                  'Abdullah Ibrahim',
                  style: TextStyle(
                    fontFamily: 'Syne',
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
        ),
        const Spacer(),
        ...navItems.map(
          (s) => Padding(
            padding: const EdgeInsets.only(left: 4),
            child: _NavBtn(label: s, onTap: () => onNav(s)),
          ),
        ),
        const SizedBox(width: 12),
        _PrimaryBtn(
          label: 'Hire Me',
          onTap: () => onNav('Contact'),
          small: true,
        ),
      ],
    );
  }
}

class _MobileNav extends StatelessWidget {
  final ValueChanged<String> onNav;
  final Animation<double> gradientAnim;
  const _MobileNav({required this.onNav, required this.gradientAnim});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ShaderMask(
          shaderCallback:
              (b) => const LinearGradient(
                colors: [kBlue, kPurple],
              ).createShader(b),
          child: const Text(
            'Abdullah Ibrahim',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
        ),
        const Spacer(),
        _PrimaryBtn(
          label: 'Contact',
          onTap: () => onNav('Contact'),
          small: true,
        ),
      ],
    );
  }
}

class _NavBtn extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavBtn({required this.label, required this.onTap});
  @override
  State<_NavBtn> createState() => _NavBtnState();
}

class _NavBtnState extends State<_NavBtn> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? kBlue.withValues(alpha: .08) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: _hovered ? kText : kText2,
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Hero ──────────────────────────────────────────────────────────
class _HeroSection extends StatefulWidget {
  final bool isDesktop;
  final Animation<double> gradientAnim, orbitAnim, pulseAnim;
  final ValueChanged<String> onNav;
  const _HeroSection({
    required this.isDesktop,
    required this.gradientAnim,
    required this.orbitAnim,
    required this.pulseAnim,
    required this.onNav,
  });
  @override
  State<_HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<_HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _entryCtrl;
  late Animation<double> _fade, _slide;
  @override
  void initState() {
    super.initState();
    _entryCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();
    _fade = CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOut);
    _slide = Tween(
      begin: 40.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _entryCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _entryCtrl,
      builder:
          (_, child) => Opacity(
            opacity: _fade.value,
            child: Transform.translate(
              offset: Offset(0, _slide.value),
              child: child,
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24),
        child:
            widget.isDesktop
                ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: _HeroText(
                        gradientAnim: widget.gradientAnim,
                        pulseAnim: widget.pulseAnim,
                        onNav: widget.onNav,
                        isDesktop: true,
                      ),
                    ),
                    const SizedBox(width: 40),
                    SizedBox(
                      width: 400,
                      child: _HeroCard(
                        orbitAnim: widget.orbitAnim,
                        pulseAnim: widget.pulseAnim,
                        isDesktop: true,
                      ),
                    ),
                  ],
                )
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _HeroText(
                      gradientAnim: widget.gradientAnim,
                      pulseAnim: widget.pulseAnim,
                      onNav: widget.onNav,
                      isDesktop: false,
                    ),
                    const SizedBox(height: 28),
                    _HeroCard(
                      orbitAnim: widget.orbitAnim,
                      pulseAnim: widget.pulseAnim,
                      isDesktop: false,
                    ),
                  ],
                ),
      ),
    );
  }
}

class _HeroText extends StatelessWidget {
  final Animation<double> gradientAnim, pulseAnim;
  final ValueChanged<String> onNav;
  final bool isDesktop;
  const _HeroText({
    required this.gradientAnim,
    required this.pulseAnim,
    required this.onNav,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badge
        AnimatedBuilder(
          animation: pulseAnim,
          builder:
              (_, __) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: kBlue.withValues(alpha: .07),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: kBlue.withValues(alpha: .2)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: kGreen.withValues(
                          alpha: .7 + pulseAnim.value * .3,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Available for Flutter roles · 3+ years experience',
                      style: TextStyle(
                        color: kBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: .4,
                      ),
                    ),
                  ],
                ),
              ),
        ),
        const SizedBox(height: 24),
        // Title with animated gradient
        AnimatedBuilder(
          animation: gradientAnim,
          builder: (_, __) {
            final fontSize = isDesktop ? 62.0 : 36.0;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter developer',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w800,
                    height: .95,
                    letterSpacing: -2,
                    color: kText,
                  ),
                ),
                ShaderMask(
                  shaderCallback:
                      (b) => LinearGradient(
                        colors: const [kBlue, kPurple, kPink],
                        begin: Alignment(
                          math.cos(gradientAnim.value * 2 * math.pi),
                          0,
                        ),
                        end: Alignment(
                          math.cos(gradientAnim.value * 2 * math.pi + math.pi),
                          1,
                        ),
                      ).createShader(b),
                  child: Text(
                    'crafting scalable\nmobile products',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w800,
                      height: .95,
                      letterSpacing: -2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 20),
        const Text(
          'Building polished iOS & Android applications with clean architecture, real-time experiences, and production-grade engineering discipline.',
          style: TextStyle(fontSize: 16, height: 1.75, color: kText2),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _PrimaryBtn(
              label: 'View Projects',
              onTap: () => onNav('Projects'),
              icon: Icons.grid_view_rounded,
            ),
            _SecondaryBtn(
              label: 'Download CV',
              icon: Icons.download_rounded,
              onTap: _downloadCv,
            ),
            _TextBtn(
              label: "Let's Work Together →",
              onTap: () => onNav('Contact'),
            ),
          ],
        ),
        const SizedBox(height: 36),
        Wrap(
          spacing: 20,
          runSpacing: 16,
          children: const [
            _MetricCard(value: '3+', label: 'Years Experience'),
            _MetricCard(value: '8+', label: 'Production Apps'),
            _MetricCard(value: '25%', label: 'Firebase Boost'),
          ],
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  final Animation<double> orbitAnim, pulseAnim;
  final bool isDesktop;
  const _HeroCard({
    required this.orbitAnim,
    required this.pulseAnim,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0E1424), Color(0xFF090D1A)],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: kBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .4),
            blurRadius: 60,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isDesktop)
            Align(
              alignment: Alignment.centerRight,
              child: AnimatedBuilder(
                animation: pulseAnim,
                builder:
                    (_, __) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: kGreen.withValues(
                          alpha: .07 + pulseAnim.value * .03,
                        ),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: kGreen.withValues(alpha: .2)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: kGreen.withValues(
                                alpha: .7 + pulseAnim.value * .3,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Open to work',
                            style: TextStyle(
                              color: kGreen,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
          SizedBox(height: 20),
          // Profile row
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [kBlue, kPurple]),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Text(
                    'AI',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Abdullah Ibrahim Mokhtar',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: kText,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Flutter Developer · Cairo, Egypt',
                      style: TextStyle(fontSize: 12, color: kText2),
                    ),
                  ],
                ),
              ),
              if (isDesktop)
                AnimatedBuilder(
                  animation: pulseAnim,
                  builder:
                      (_, __) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: kGreen.withValues(
                            alpha: .07 + pulseAnim.value * .03,
                          ),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: kGreen.withValues(alpha: .2),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                color: kGreen.withValues(
                                  alpha: .7 + pulseAnim.value * .3,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              'Open to work',
                              style: TextStyle(
                                color: kGreen,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          // Orbit animation
          SizedBox(
            height: 180,
            child: AnimatedBuilder(
              animation: orbitAnim,
              builder: (_, __) {
                final t = orbitAnim.value * 2 * math.pi;
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Rings
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kBlue.withValues(alpha: .15),
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kPurple.withValues(alpha: .15),
                          width: 1,
                        ),
                      ),
                    ),
                    // Orbiting dots
                    Transform.translate(
                      offset: Offset(math.cos(t) * 80, math.sin(t) * 80),
                      child: Container(
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: kBlue.withValues(alpha: .6),
                              blurRadius: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        math.cos(t + math.pi) * 55,
                        math.sin(t + math.pi) * 55,
                      ),
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: kPurple,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: kPurple.withValues(alpha: .6),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        math.cos(t + math.pi / 1.5) * 80,
                        math.sin(t + math.pi / 1.5) * 80,
                      ),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: kPink,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: kPink.withValues(alpha: .6),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Core
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          colors: [
                            kBlue.withValues(alpha: .2),
                            kPurple.withValues(alpha: .2),
                          ],
                        ),
                        border: Border.all(color: kBlue.withValues(alpha: .3)),
                      ),
                      child: const Center(
                        child: Text('📱', style: TextStyle(fontSize: 28)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          _InfoRow(
            label: 'Focus',
            value: 'Scalable Flutter apps, Clean Architecture, real-time flows',
          ),
          const SizedBox(height: 10),
          _InfoRow(
            label: 'Strengths',
            value:
                'BLoC, Firebase, REST APIs, responsive UI, delivery discipline',
          ),
          const SizedBox(height: 10),
          _InfoRow(
            label: 'Currently',
            value: 'Flutter Developer @ MATN · Riyadh',
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ChipBtn(
                icon: Icons.email_outlined,
                label: 'Email',
                onTap: _openEmail,
              ),
              _ChipBtn(
                icon: Icons.phone_outlined,
                label: 'Call',
                onTap: _openPhone,
              ),
              _ChipBtn(
                icon: Icons.code_rounded,
                label: 'GitHub',
                onTap: _openGitHub,
              ),
              _ChipBtn(
                icon: Icons.link_rounded,
                label: 'LinkedIn',
                onTap: _openLinkedIn,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label, value;
  const _InfoRow({required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: kSurface2,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: kBorder),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 72,
          child: Text(
            label,
            style: const TextStyle(
              color: kBlue,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: .5,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 12, color: kText2, height: 1.5),
          ),
        ),
      ],
    ),
  );
}

class _MetricCard extends StatelessWidget {
  final String value, label;
  const _MetricCard({required this.value, required this.label});
  @override
  Widget build(BuildContext context) => Container(
    width: 150,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: kSurface,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: kBorder),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback:
              (b) => const LinearGradient(
                colors: [kBlue, kPurple],
              ).createShader(b),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: kText3,
            letterSpacing: .5,
          ),
        ),
      ],
    ),
  );
}

// ─── Section shell ─────────────────────────────────────────────────
class _SectionShell extends StatelessWidget {
  final String eyebrow, title;
  final Widget child;
  final bool isDesktop;
  const _SectionShell({
    required this.eyebrow,
    required this.title,
    required this.child,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isDesktop ? 36 : 20),
      decoration: BoxDecoration(
        color: kBg2.withValues(alpha: .8),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: kBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 24, height: 1, color: kBlue),
              const SizedBox(width: 10),
              Text(
                eyebrow.toUpperCase(),
                style: const TextStyle(
                  color: kBlue,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 680),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const SizedBox(height: 32),
          child,
        ],
      ),
    );
  }
}

// ─── About ─────────────────────────────────────────────────────────
class _AboutSection extends StatelessWidget {
  final bool isDesktop;
  const _AboutSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return _SectionShell(
      eyebrow: 'About me',
      title:
          'Building dependable Flutter products with clean architecture and thoughtful UX',
      isDesktop: isDesktop,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Mobile application developer with 3+ years of experience building user-focused Flutter applications for iOS and Android. I enjoy turning product requirements into responsive, intuitive experiences with reliable architecture, careful attention to UI detail, and a collaborative engineering approach.',
            style: TextStyle(fontSize: 16, height: 1.75, color: kText2),
          ),
          const SizedBox(height: 28),
          _ResponsiveWrap(
            minChildWidth: 260,
            children: [
              _AboutCard(
                icon: Icons.grid_view_rounded,
                title: 'Product Mindset',
                desc:
                    'I focus on building features that feel clear for users and maintainable for teams, not just shipping screens.',
              ),
              _AboutCard(
                icon: Icons.account_tree_outlined,
                title: 'Architecture Discipline',
                desc:
                    'Clean Architecture, reusable components, and strong state management choices help me scale apps with confidence.',
              ),
              _AboutCard(
                icon: Icons.bolt_outlined,
                title: 'Real-time Expertise',
                desc:
                    'Direct experience with chat, streaming, notifications, tracking, and Firebase-backed responsive flows.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatefulWidget {
  final IconData icon;
  final String title, desc;
  const _AboutCard({
    required this.icon,
    required this.title,
    required this.desc,
  });
  @override
  State<_AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends State<_AboutCard> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: _hovered ? kBlue.withValues(alpha: .3) : kBorder,
        ),
        boxShadow:
            _hovered
                ? [
                  BoxShadow(
                    color: kBlue.withValues(alpha: .08),
                    blurRadius: 30,
                    offset: const Offset(0, 12),
                  ),
                ]
                : [],
      ),
      transform:
          _hovered
              ? (Matrix4.identity()..translate(0.0, -4.0))
              : Matrix4.identity(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  kBlue.withValues(alpha: .1),
                  kPurple.withValues(alpha: .1),
                ],
              ),
              border: Border.all(color: kBlue.withValues(alpha: .2)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(widget.icon, color: kBlue, size: 20),
          ),
          const SizedBox(height: 16),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: kText,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.desc,
            style: const TextStyle(fontSize: 13, height: 1.7, color: kText2),
          ),
        ],
      ),
    ),
  );
}

// ─── Experience ────────────────────────────────────────────────────
class _ExperienceSection extends StatelessWidget {
  final bool isDesktop;
  const _ExperienceSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return _SectionShell(
      eyebrow: 'Career timeline',
      title: 'A delivery-focused timeline across product teams',
      isDesktop: isDesktop,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              width: 1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [kPurple, kBlue, Colors.transparent],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    kExperience
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: _ExpCard(item: e),
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpCard extends StatefulWidget {
  final ExperienceItem item;
  const _ExpCard({required this.item});
  @override
  State<_ExpCard> createState() => _ExpCardState();
}

class _ExpCardState extends State<_ExpCard> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _hovered ? kBlue.withValues(alpha: .25) : kBorder,
        ),
        boxShadow:
            _hovered
                ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .3),
                    blurRadius: 30,
                  ),
                ]
                : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                widget.item.role,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: kText,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: kBlue.withValues(alpha: .08),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: kBlue.withValues(alpha: .2)),
                ),
                child: Text(
                  widget.item.company,
                  style: const TextStyle(
                    color: kBlue,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '${widget.item.period}  ·  ${widget.item.location}',
            style: const TextStyle(color: kText3, fontSize: 12),
          ),
          const SizedBox(height: 14),
          ...widget.item.achievements.map(
            (a) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: const BoxDecoration(
                      color: kPurple,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      a,
                      style: const TextStyle(
                        fontSize: 14,
                        color: kText2,
                        height: 1.6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// ─── Projects ──────────────────────────────────────────────────────
class _ProjectsSection extends StatelessWidget {
  final bool isDesktop;
  const _ProjectsSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return _SectionShell(
      eyebrow: 'Selected work',
      title: 'Production-style apps spanning social, commerce & logistics',
      isDesktop: isDesktop,
      child: _ResponsiveWrap(
        minChildWidth: 300,
        children: kProjects.map((p) => _ProjectCard(project: p)).toList(),
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectItem project;
  const _ProjectCard({required this.project});
  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: kSurface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _hovered ? kBlue.withValues(alpha: .3) : kBorder,
          ),
          boxShadow:
              _hovered
                  ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .5),
                      blurRadius: 40,
                      offset: const Offset(0, 16),
                    ),
                  ]
                  : [],
        ),
        transform:
            _hovered
                ? (Matrix4.identity()..translate(0.0, -6.0))
                : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: kBlue.withValues(alpha: .07),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: kBlue.withValues(alpha: .15)),
              ),
              child: Text(
                p.label,
                style: const TextStyle(
                  color: kBlue,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: .6,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Text(
              p.title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: kText,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              p.description,
              style: const TextStyle(fontSize: 13, height: 1.7, color: kText2),
            ),
            const SizedBox(height: 14),
            ...p.bullets.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.arrow_outward_rounded,
                      size: 13,
                      color: kPurple,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        b,
                        style: const TextStyle(
                          fontSize: 12,
                          color: kText3,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (p.hasLinks) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (p.github != null)
                    _LinkChip(
                      icon: Icons.code_rounded,
                      label: 'GitHub',
                      url: p.github!,
                    ),
                  if (p.playStore != null)
                    _LinkChip(
                      icon: Icons.android_rounded,
                      label: 'Play Store',
                      url: p.playStore!,
                    ),
                  if (p.appStore != null)
                    _LinkChip(
                      icon: Icons.phone_iphone_rounded,
                      label: 'App Store',
                      url: p.appStore!,
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _LinkChip extends StatefulWidget {
  final IconData icon;
  final String label, url;
  const _LinkChip({required this.icon, required this.label, required this.url});
  @override
  State<_LinkChip> createState() => _LinkChipState();
}

class _LinkChipState extends State<_LinkChip> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: GestureDetector(
      onTap: () => openExternalUrl(widget.url),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: _hovered ? kBlue.withValues(alpha: .06) : kSurface2,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _hovered ? kBlue.withValues(alpha: .3) : kBorder,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, size: 13, color: _hovered ? kBlue : kText2),
            const SizedBox(width: 6),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 12,
                color: _hovered ? kBlue : kText2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// ─── Skills ────────────────────────────────────────────────────────
class _SkillsSection extends StatelessWidget {
  final bool isDesktop;
  const _SkillsSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return _SectionShell(
      eyebrow: 'Capabilities',
      title: 'Tools, patterns, and delivery habits behind my Flutter work',
      isDesktop: isDesktop,
      child: _ResponsiveWrap(
        minChildWidth: 280,
        children: kSkills.map((g) => _SkillCard(group: g)).toList(),
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final SkillGroup group;
  const _SkillCard({required this.group});
  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _hovered ? kBlue.withValues(alpha: .25) : kBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      kBlue.withValues(alpha: .15),
                      kPurple.withValues(alpha: .15),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    widget.group.emoji,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                widget.group.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: kText,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                widget.group.items.map((s) => _SkillTag(label: s)).toList(),
          ),
        ],
      ),
    ),
  );
}

class _SkillTag extends StatefulWidget {
  final String label;
  const _SkillTag({required this.label});
  @override
  State<_SkillTag> createState() => _SkillTagState();
}

class _SkillTagState extends State<_SkillTag> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: _hovered ? kBlue.withValues(alpha: .06) : kSurface2,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: _hovered ? kBlue.withValues(alpha: .3) : kBorder,
        ),
      ),
      child: Text(
        widget.label,
        style: TextStyle(fontSize: 13, color: _hovered ? kText : kText2),
      ),
    ),
  );
}

// ─── Contact ───────────────────────────────────────────────────────
class _ContactSection extends StatelessWidget {
  final bool isDesktop;
  const _ContactSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final left = Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0E1424), Color(0xFF090D1A)],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: kBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback:
                (b) => const LinearGradient(
                  colors: [kBlue, kPurple],
                ).createShader(b),
            child: const Text(
              'Let\'s build something great together.',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                height: 1.2,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'I enjoy working on products that need both engineering discipline and user-friendly design. Whether it\'s a new app, an existing codebase, or a team looking for a reliable Flutter developer — let\'s talk.',
            style: TextStyle(color: kText2, height: 1.75),
          ),
          const SizedBox(height: 24),
          _PrimaryBtn(
            label: 'Send me an email',
            icon: Icons.email_outlined,
            onTap: _openEmail,
          ),
        ],
      ),
    );

    final right = Column(
      children: [
        _ContactRow(
          icon: Icons.email_outlined,
          label: 'Email',
          value: kEmailAddress,
          action: 'Open',
          onTap: _openEmail,
        ),
        const SizedBox(height: 12),
        _ContactRow(
          icon: Icons.phone_outlined,
          label: 'Phone',
          value: kPhoneNumber,
          action: 'Call',
          onTap: _openPhone,
        ),
        const SizedBox(height: 12),
        _ContactRow(
          icon: Icons.code_rounded,
          label: 'GitHub',
          value: 'github.com/abdallah011588',
          action: 'Visit',
          onTap: _openGitHub,
        ),
        const SizedBox(height: 12),
        _ContactRow(
          icon: Icons.link_rounded,
          label: 'LinkedIn',
          value: 'linkedin.com/in/abdullah-ibrahim-mokhtar-548400236',
          action: 'Visit',
          onTap: _openLinkedIn,
        ),
        const SizedBox(height: 12),
        const _ContactRow(
          icon: Icons.location_on_outlined,
          label: 'Location',
          value: 'Cairo, Egypt',
        ),
      ],
    );

    return _SectionShell(
      eyebrow: 'Contact',
      title:
          'Open to Flutter roles, freelance builds, and quality-focused teams',
      isDesktop: isDesktop,
      child:
          isDesktop
              ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: left),
                  const SizedBox(width: 20),
                  Expanded(child: right),
                ],
              )
              : Column(children: [left, const SizedBox(height: 16), right]),
    );
  }
}

class _ContactRow extends StatefulWidget {
  final IconData icon;
  final String label, value;
  final String? action;
  final VoidCallback? onTap;
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    this.action,
    this.onTap,
  });
  @override
  State<_ContactRow> createState() => _ContactRowState();
}

class _ContactRowState extends State<_ContactRow> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: widget.onTap == null ? MouseCursor.defer : SystemMouseCursors.click,
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                _hovered && widget.onTap != null
                    ? kBlue.withValues(alpha: .3)
                    : kBorder,
          ),
        ),
        transform:
            _hovered && widget.onTap != null
                ? (Matrix4.identity()..translate(4.0, 0.0))
                : Matrix4.identity(),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kBlue.withValues(alpha: .1),
                    kPurple.withValues(alpha: .1),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: kBlue.withValues(alpha: .2)),
              ),
              child: Icon(widget.icon, color: kBlue, size: 18),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    style: const TextStyle(
                      color: kPurple,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .6,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    widget.value,
                    style: const TextStyle(color: kText, fontSize: 13),
                  ),
                ],
              ),
            ),
            if (widget.action != null)
              Text(
                '${widget.action} →',
                style: const TextStyle(
                  color: kBlue,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

// ─── Footer ────────────────────────────────────────────────────────
class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
    decoration: BoxDecoration(
      color: kSurface,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: kBorder),
    ),
    child: const Text(
      'Designed & built by Abdullah Ibrahim Mokhtar · Flutter Developer · 2026',
      textAlign: TextAlign.center,
      style: TextStyle(color: kText3, fontSize: 13),
    ),
  );
}

// ─── Reveal animation wrapper ──────────────────────────────────────
class _RevealSection extends StatefulWidget {
  final Widget child;
  const _RevealSection({super.key, required this.child});
  @override
  State<_RevealSection> createState() => _RevealSectionState();
}

class _RevealSectionState extends State<_RevealSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade, _slide;
  ScrollPosition? _scrollPosition;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween(
      begin: 40.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final position = Scrollable.maybeOf(context)?.position;
    if (_scrollPosition == position) return;

    _scrollPosition?.removeListener(_checkVisibility);
    _scrollPosition = position;
    _scrollPosition?.addListener(_checkVisibility);
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_checkVisibility);
    _ctrl.dispose();
    super.dispose();
  }

  void _checkVisibility() {
    if (!mounted) return;
    final ctx = context;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null) return;
    final pos = box.localToGlobal(Offset.zero);
    final screenH = MediaQuery.sizeOf(ctx).height;
    if (pos.dy < screenH * 1.1) _ctrl.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder:
          (_, child) => Opacity(
            opacity: _fade.value,
            child: Transform.translate(
              offset: Offset(0, _slide.value),
              child: child,
            ),
          ),
      child: widget.child,
    );
  }
}

// ─── Shared buttons ────────────────────────────────────────────────
class _PrimaryBtn extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final bool small;
  const _PrimaryBtn({
    required this.label,
    required this.onTap,
    this.icon,
    this.small = false,
  });
  @override
  State<_PrimaryBtn> createState() => _PrimaryBtnState();
}

class _PrimaryBtnState extends State<_PrimaryBtn> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: widget.small ? 16 : 22,
          vertical: widget.small ? 10 : 14,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [kBlue, kPurple]),
          borderRadius: BorderRadius.circular(12),
          boxShadow:
              _hovered
                  ? [
                    BoxShadow(
                      color: kBlue.withValues(alpha: .35),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ]
                  : [],
        ),
        transform:
            _hovered
                ? (Matrix4.identity()..translate(0.0, -2.0))
                : Matrix4.identity(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              Icon(widget.icon, color: Colors.white, size: 16),
              const SizedBox(width: 8),
            ],
            Text(
              widget.label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: widget.small ? 13 : 14,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _SecondaryBtn extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  const _SecondaryBtn({required this.label, required this.onTap, this.icon});
  @override
  State<_SecondaryBtn> createState() => _SecondaryBtnState();
}

class _SecondaryBtnState extends State<_SecondaryBtn> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        decoration: BoxDecoration(
          color: _hovered ? kBlue.withValues(alpha: .06) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered ? kBlue.withValues(alpha: .5) : kBorder2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              Icon(widget.icon, color: _hovered ? kBlue : kText, size: 16),
              const SizedBox(width: 8),
            ],
            Text(
              widget.label,
              style: TextStyle(
                color: _hovered ? kBlue : kText,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _TextBtn extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _TextBtn({required this.label, required this.onTap});
  @override
  State<_TextBtn> createState() => _TextBtnState();
}

class _TextBtnState extends State<_TextBtn> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
        child: Text(
          widget.label,
          style: TextStyle(
            color: _hovered ? kText : kText2,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
  VoidCallback get onTap => widget.onTap;
}

class _ChipBtn extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ChipBtn({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  @override
  State<_ChipBtn> createState() => _ChipBtnState();
}

class _ChipBtnState extends State<_ChipBtn> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovered = true),
    onExit: (_) => setState(() => _hovered = false),
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: _hovered ? kBlue.withValues(alpha: .07) : kSurface2,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _hovered ? kBlue.withValues(alpha: .3) : kBorder,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, size: 14, color: _hovered ? kBlue : kText2),
            const SizedBox(width: 7),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 12,
                color: _hovered ? kBlue : kText2,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// ─── Responsive wrap layout ────────────────────────────────────────
class _ResponsiveWrap extends StatelessWidget {
  final List<Widget> children;
  final double minChildWidth;
  const _ResponsiveWrap({required this.children, required this.minChildWidth});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = (constraints.maxWidth / (minChildWidth + 16))
            .floor()
            .clamp(1, 4);
        final childW = (constraints.maxWidth - (cols - 1) * 16) / cols;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children:
              children.map((c) => SizedBox(width: childW, child: c)).toList(),
        );
      },
    );
  }
}

// ─── Nav delegate ──────────────────────────────────────────────────
class _NavDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;
  const _NavDelegate({required this.child, required this.height});
  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => SizedBox.expand(child: child);
  @override
  bool shouldRebuild(_NavDelegate old) =>
      old.child != child || old.height != height;
}
