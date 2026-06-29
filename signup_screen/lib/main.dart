import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const NASAApp());

class NASAApp extends StatelessWidget {
  const NASAApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF020510),
      ),
      home: const NASADashboard(),
    );
  }
}

class NASADashboard extends StatefulWidget {
  const NASADashboard({super.key});

  @override
  State<NASADashboard> createState() => _NASADashboardState();
}

class _NASADashboardState extends State<NASADashboard>
    with TickerProviderStateMixin {
  late AnimationController _orbitController;
  late AnimationController _pulseController;
  late AnimationController _scanController;
  late AnimationController _shootingStarController;
  late AnimationController _dataStreamController;
  late AnimationController _radarController;

  late Animation<double> _pulseAnim;
  late Animation<double> _scanAnim;

  final List<StarParticle> _stars = [];
  final List<ShootingStar> _shootingStars = [];
  final Random _random = Random();

  int _selectedPlanet = 2;

  final List<PlanetData> planets = [
    PlanetData(
      name: "MERCURY",
      distance: "77.3M km",
      diameter: "4,879 km",
      temp: "430°C",
      moons: "0",
      year: "88 days",
      gravity: "3.7 m/s²",
      type: "Terrestrial",
      description:
          "Mercury is the smallest and innermost planet in the Solar System. It has no atmosphere and extreme temperature variations.",
      colors: [Color(0xFF8C7853), Color(0xFFBDB39C), Color(0xFF6B5B3E)],
      orbitRadius: 0.15,
      speed: 4.0,
      size: 12,
      missions: ["Mariner 10 (1974)", "MESSENGER (2011)", "BepiColombo (2025)"],
    ),
    PlanetData(
      name: "VENUS",
      distance: "41.4M km",
      diameter: "12,104 km",
      temp: "465°C",
      moons: "0",
      year: "225 days",
      gravity: "8.87 m/s²",
      type: "Terrestrial",
      description:
          "Venus is the second planet from the Sun. It's the hottest planet due to its thick atmosphere of carbon dioxide.",
      colors: [Color(0xFFE8CDA0), Color(0xFFD4A853), Color(0xFFB8860B)],
      orbitRadius: 0.25,
      speed: 3.2,
      size: 16,
      missions: ["Venera 7 (1970)", "Magellan (1990)", "Akatsuki (2015)"],
    ),
    PlanetData(
      name: "EARTH",
      distance: "149.6M km",
      diameter: "12,742 km",
      temp: "15°C",
      moons: "1",
      year: "365 days",
      gravity: "9.81 m/s²",
      type: "Terrestrial",
      description:
          "Earth is the third planet from the Sun and the only known planet to harbor life. 71% of its surface is covered with water.",
      colors: [Color(0xFF1E90FF), Color(0xFF3CB371), Color(0xFF1565C0)],
      orbitRadius: 0.35,
      speed: 2.8,
      size: 18,
      missions: ["Apollo 11 (1969)", "ISS (1998)", "Hubble (1990)"],
    ),
    PlanetData(
      name: "MARS",
      distance: "227.9M km",
      diameter: "6,779 km",
      temp: "-65°C",
      moons: "2",
      year: "687 days",
      gravity: "3.72 m/s²",
      type: "Terrestrial",
      description:
          "Mars is the fourth planet from the Sun. Known as the Red Planet due to iron oxide on its surface.",
      colors: [Color(0xFFCD5C5C), Color(0xFFB22222), Color(0xFF8B0000)],
      orbitRadius: 0.45,
      speed: 2.2,
      size: 15,
      missions: [
        "Curiosity (2012)",
        "Perseverance (2021)",
        "Mars Orbiter (2014)"
      ],
    ),
    PlanetData(
      name: "JUPITER",
      distance: "778.5M km",
      diameter: "139,820 km",
      temp: "-110°C",
      moons: "95",
      year: "12 years",
      gravity: "24.79 m/s²",
      type: "Gas Giant",
      description:
          "Jupiter is the largest planet in the Solar System. Its Great Red Spot is a storm larger than Earth.",
      colors: [Color(0xFFD2691E), Color(0xFFCD853F), Color(0xFF8B4513)],
      orbitRadius: 0.58,
      speed: 1.5,
      size: 28,
      missions: ["Juno (2016)", "Galileo (1995)", "Voyager 1 (1979)"],
    ),
    PlanetData(
      name: "SATURN",
      distance: "1.43B km",
      diameter: "116,460 km",
      temp: "-178°C",
      moons: "146",
      year: "29 years",
      gravity: "10.44 m/s²",
      type: "Gas Giant",
      description:
          "Saturn is famous for its stunning ring system made of ice and rock particles.",
      colors: [Color(0xFFDAA520), Color(0xFFBDB76B), Color(0xFF8B7500)],
      orbitRadius: 0.70,
      speed: 1.0,
      size: 24,
      missions: ["Cassini (2004)", "Voyager 2 (1981)", "Pioneer 11 (1979)"],
    ),
  ];

  @override
  void initState() {
    super.initState();

    _orbitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _pulseAnim = Tween(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _scanController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
    _scanAnim = Tween(begin: 0.0, end: 1.0).animate(_scanController);

    _shootingStarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    _dataStreamController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _radarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    // Generate stars
    for (int i = 0; i < 120; i++) {
      _stars.add(StarParticle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        size: _random.nextDouble() * 2.5 + 0.5,
        twinkleSpeed: _random.nextDouble() * 2 + 1,
        brightness: _random.nextDouble() * 0.7 + 0.3,
      ));
    }

    // Generate shooting stars
    for (int i = 0; i < 3; i++) {
      _shootingStars.add(ShootingStar(
        startX: _random.nextDouble(),
        startY: _random.nextDouble() * 0.4,
        angle: _random.nextDouble() * 0.5 + 0.3,
        speed: _random.nextDouble() * 0.3 + 0.2,
        delay: _random.nextDouble(),
      ));
    }
  }

  @override
  void dispose() {
    _orbitController.dispose();
    _pulseController.dispose();
    _scanController.dispose();
    _shootingStarController.dispose();
    _dataStreamController.dispose();
    _radarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Deep space background
          _buildSpaceBackground(),

          // Stars
          ..._buildStars(),

          // Shooting stars
          _buildShootingStars(),

          // Main content
          SafeArea(
            child: Column(
              children: [
                _buildNASAHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        _build3DSolarSystem(),
                        const SizedBox(height: 8),
                        _buildPlanetSelector(),
                        const SizedBox(height: 16),
                        _buildHolographicPlanetCard(),
                        const SizedBox(height: 16),
                        _buildDataGrid(),
                        const SizedBox(height: 16),
                        _buildRadarAndSignal(),
                        const SizedBox(height: 16),
                        _buildMissionTimeline(),
                        const SizedBox(height: 16),
                        _buildSystemStatus(),
                        const SizedBox(height: 24),
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

  // ═══════════════════════════════════════
  //  SPACE BACKGROUND
  // ═══════════════════════════════════════
  Widget _buildSpaceBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0.0, -0.3),
          radius: 1.5,
          colors: [
            Color(0xFF0A1628),
            Color(0xFF060E1A),
            Color(0xFF020510),
            Color(0xFF000208),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildStars() {
    return _stars.map((star) {
      return AnimatedBuilder(
        animation: _pulseController,
        builder: (context, child) {
          final twinkle =
              (sin(_pulseController.value * pi * star.twinkleSpeed) + 1) / 2;
          return Positioned(
            left: star.x * MediaQuery.of(context).size.width,
            top: star.y * MediaQuery.of(context).size.height,
            child: Opacity(
              opacity: star.brightness * (0.4 + twinkle * 0.6),
              child: Container(
                width: star.size,
                height: star.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: star.size > 2
                      ? [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            blurRadius: 4,
                          )
                        ]
                      : null,
                ),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  Widget _buildShootingStars() {
    return AnimatedBuilder(
      animation: _shootingStarController,
      builder: (context, child) {
        final size = MediaQuery.of(context).size;
        return Stack(
          children: _shootingStars.map((star) {
            final progress =
                ((_shootingStarController.value + star.delay) % 1.0);
            if (progress > star.speed) return const SizedBox();

            final t = progress / star.speed;
            final x = star.startX * size.width + t * size.width * 0.4;
            final y =
                star.startY * size.height + t * size.height * star.angle;

            return Positioned(
              left: x,
              top: y,
              child: Transform.rotate(
                angle: star.angle,
                child: Opacity(
                  opacity: (1 - t) * 0.8,
                  child: Container(
                    width: 40 * (1 - t),
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  // ═══════════════════════════════════════
  //  NASA HEADER
  // ═══════════════════════════════════════
  Widget _buildNASAHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // NASA Logo style
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF00E5FF), width: 1.5),
              color: const Color(0xFF00E5FF).withOpacity(0.08),
            ),
            child: const Text(
              "NASA",
              style: TextStyle(
                color: Color(0xFF00E5FF),
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 4,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "MISSION CONTROL",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
                AnimatedBuilder(
                  animation: _dataStreamController,
                  builder: (context, child) {
                    return Text(
                      "LIVE DATA STREAM ● ${(_dataStreamController.value * 100).toInt()}%",
                      style: TextStyle(
                        color: const Color(0xFF00E5FF).withOpacity(0.7),
                        fontSize: 10,
                        letterSpacing: 1.5,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          // Status indicator
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF00FF88),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00FF88)
                          .withOpacity(_pulseAnim.value),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(width: 6),
          const Text(
            "ONLINE",
            style: TextStyle(
              color: Color(0xFF00FF88),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════
  //  3D SOLAR SYSTEM
  // ═══════════════════════════════════════
  Widget _build3DSolarSystem() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF00E5FF).withOpacity(0.15)),
        color: Colors.white.withOpacity(0.03),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Grid lines
          CustomPaint(
            size: const Size(double.infinity, 260),
            painter: GridPainter(),
          ),

          // Orbit rings
          ...planets.map((planet) {
            final index = planets.indexOf(planet);
            return AnimatedBuilder(
              animation: _orbitController,
              builder: (context, child) {
                return CustomPaint(
                  size: const Size(double.infinity, 260),
                  painter: OrbitPainter(
                    radius: planet.orbitRadius,
                    isSelected: index == _selectedPlanet,
                  ),
                );
              },
            );
          }),

          // Sun
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFFFD700),
                      Color(0xFFFF8C00),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFD700)
                          .withOpacity(0.4 + _pulseAnim.value * 0.3),
                      blurRadius: 20 + _pulseAnim.value * 10,
                      spreadRadius: 4,
                    ),
                  ],
                ),
              );
            },
          ),

          // Planets on orbits
          ...planets.asMap().entries.map((entry) {
            final index = entry.key;
            final planet = entry.value;
            return AnimatedBuilder(
              animation: _orbitController,
              builder: (context, child) {
                final angle =
                    _orbitController.value * 2 * pi * planet.speed + index * 1.2;
                final centerX = MediaQuery.of(context).size.width / 2 - 16;
                const centerY = 130.0;
                final orbitA = centerX * planet.orbitRadius;
                final orbitB = orbitA * 0.4; // 3D effect

                final x = centerX + orbitA * cos(angle) - planet.size / 2;
                final y = centerY + orbitB * sin(angle) - planet.size / 2;
                final scale = 0.7 + 0.3 * ((sin(angle) + 1) / 2);

                return Positioned(
                  left: x,
                  top: y,
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedPlanet = index),
                    child: Transform.scale(
                      scale: scale,
                      child: Container(
                        width: planet.size.toDouble(),
                        height: planet.size.toDouble(),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: planet.colors,
                          ),
                          boxShadow: [
                            if (index == _selectedPlanet)
                              BoxShadow(
                                color: planet.colors[0].withOpacity(0.6),
                                blurRadius: 12,
                                spreadRadius: 2,
                              ),
                            BoxShadow(
                              color: planet.colors[0].withOpacity(0.3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),

          // Label
          Positioned(
            top: 12,
            left: 14,
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF00E5FF),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  "SOLAR SYSTEM — 3D VIEW",
                  style: TextStyle(
                    color: const Color(0xFF00E5FF).withOpacity(0.8),
                    fontSize: 10,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════
  //  PLANET SELECTOR
  // ═══════════════════════════════════════
  Widget _buildPlanetSelector() {
    return SizedBox(
      height: 46,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: planets.length,
        itemBuilder: (context, index) {
          final isSelected = index == _selectedPlanet;
          return GestureDetector(
            onTap: () => setState(() => _selectedPlanet = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: isSelected
                    ? LinearGradient(
                        colors: [
                          planets[index].colors[0].withOpacity(0.4),
                          planets[index].colors[1].withOpacity(0.2),
                        ],
                      )
                    : null,
                border: Border.all(
                  color: isSelected
                      ? planets[index].colors[0]
                      : Colors.white.withOpacity(0.1),
                  width: isSelected ? 1.5 : 1,
                ),
                color: isSelected ? null : Colors.white.withOpacity(0.03),
              ),
              child: Row(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(colors: planets[index].colors),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    planets[index].name,
                    style: TextStyle(
                      color:
                          isSelected ? Colors.white : Colors.white.withOpacity(0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
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

  // ═══════════════════════════════════════
  //  HOLOGRAPHIC PLANET CARD
  // ═══════════════════════════════════════
  Widget _buildHolographicPlanetCard() {
    final planet = planets[_selectedPlanet];
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween(
              begin: const Offset(0.05, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: Container(
        key: ValueKey(_selectedPlanet),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              planet.colors[0].withOpacity(0.12),
              Colors.white.withOpacity(0.04),
              planet.colors[1].withOpacity(0.08),
            ],
          ),
          border: Border.all(
            color: planet.colors[0].withOpacity(0.25),
          ),
          boxShadow: [
            BoxShadow(
              color: planet.colors[0].withOpacity(0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                // Planet 3D
                AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          center: const Alignment(-0.3, -0.3),
                          colors: [
                            planet.colors[0],
                            planet.colors[1],
                            planet.colors[2],
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: planet.colors[0]
                                .withOpacity(0.3 + _pulseAnim.value * 0.2),
                            blurRadius: 20,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // Light reflection
                          Positioned(
                            top: 12,
                            left: 14,
                            child: Container(
                              width: 18,
                              height: 12,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white.withOpacity(0.25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        planet.name,
                        style: TextStyle(
                          color: planet.colors[0],
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: planet.colors[0].withOpacity(0.15),
                        ),
                        child: Text(
                          planet.type,
                          style: TextStyle(
                            color: planet.colors[0],
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Distance: ${planet.distance}",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Scan line effect
            AnimatedBuilder(
              animation: _scanController,
              builder: (context, child) {
                return Container(
                  height: 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        planet.colors[0].withOpacity(0.6),
                        Colors.transparent,
                      ],
                      stops: [
                        (_scanAnim.value - 0.2).clamp(0.0, 1.0),
                        _scanAnim.value,
                        (_scanAnim.value + 0.2).clamp(0.0, 1.0),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 16),
            Text(
              planet.description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.75),
                fontSize: 13,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════
  //  DATA GRID
  // ═══════════════════════════════════════
  Widget _buildDataGrid() {
    final planet = planets[_selectedPlanet];
    final data = [
      {"label": "DIAMETER", "value": planet.diameter, "icon": Icons.public},
      {"label": "TEMPERATURE", "value": planet.temp, "icon": Icons.thermostat},
      {"label": "MOONS", "value": planet.moons, "icon": Icons.nightlight},
      {"label": "YEAR", "value": planet.year, "icon": Icons.access_time},
      {"label": "GRAVITY", "value": planet.gravity, "icon": Icons.speed},
      {
        "label": "DISTANCE",
        "value": planet.distance,
        "icon": Icons.straighten
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.0,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white.withOpacity(0.04),
              border:
                  Border.all(color: const Color(0xFF00E5FF).withOpacity(0.12)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  data[index]["icon"] as IconData,
                  color: const Color(0xFF00E5FF),
                  size: 20,
                ),
                const SizedBox(height: 8),
                Text(
                  data[index]["value"] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  data[index]["label"] as String,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 9,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ═══════════════════════════════════════
  //  RADAR AND SIGNAL
  // ═══════════════════════════════════════
  Widget _buildRadarAndSignal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Radar
          Expanded(
            child: Container(
              height: 160,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white.withOpacity(0.04),
                border: Border.all(
                    color: const Color(0xFF00E5FF).withOpacity(0.12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "RADAR",
                    style: TextStyle(
                      color: const Color(0xFF00E5FF).withOpacity(0.8),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _radarController,
                        builder: (context, child) {
                          return CustomPaint(
                            size: const Size(110, 110),
                            painter: RadarPainter(
                              progress: _radarController.value,
                              planetColor:
                                  planets[_selectedPlanet].colors[0],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Signal
          Expanded(
            child: Container(
              height: 160,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white.withOpacity(0.04),
                border: Border.all(
                    color: const Color(0xFF00E5FF).withOpacity(0.12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SIGNAL",
                    style: TextStyle(
                      color: const Color(0xFF00E5FF).withOpacity(0.8),
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: _dataStreamController,
                      builder: (context, child) {
                        return CustomPaint(
                          size: const Size(double.infinity, double.infinity),
                          painter: SignalPainter(
                            progress: _dataStreamController.value,
                            color: planets[_selectedPlanet].colors[0],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════
  //  MISSION TIMELINE
  // ═══════════════════════════════════════
  Widget _buildMissionTimeline() {
    final planet = planets[_selectedPlanet];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white.withOpacity(0.04),
          border:
              Border.all(color: const Color(0xFF00E5FF).withOpacity(0.12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.rocket_launch,
                    color: planet.colors[0], size: 18),
                const SizedBox(width: 8),
                Text(
                  "MISSIONS TO ${planet.name}",
                  style: TextStyle(
                    color: const Color(0xFF00E5FF).withOpacity(0.8),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...planet.missions.asMap().entries.map((entry) {
              final index = entry.key;
              final mission = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: planet.colors[0],
                            boxShadow: [
                              BoxShadow(
                                color: planet.colors[0].withOpacity(0.5),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                        ),
                        if (index < planet.missions.length - 1)
                          Container(
                            width: 2,
                            height: 20,
                            color: planet.colors[0].withOpacity(0.3),
                          ),
                      ],
                    ),
                    const SizedBox(width: 14),
                    Text(
                      mission,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════
  //  SYSTEM STATUS
  // ═══════════════════════════════════════
  Widget _buildSystemStatus() {
    final statuses = [
      {"label": "TELEMETRY", "status": "ACTIVE", "color": const Color(0xFF00FF88)},
      {"label": "COMMS", "status": "LINKED", "color": const Color(0xFF00E5FF)},
      {"label": "POWER", "status": "98.2%", "color": const Color(0xFFFFD700)},
      {"label": "THERMAL", "status": "NORMAL", "color": const Color(0xFF00FF88)},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white.withOpacity(0.04),
          border:
              Border.all(color: const Color(0xFF00E5FF).withOpacity(0.12)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SYSTEM STATUS",
              style: TextStyle(
                color: const Color(0xFF00E5FF).withOpacity(0.8),
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: statuses.map((s) {
                return Column(
                  children: [
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        return Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: s["color"] as Color,
                            boxShadow: [
                              BoxShadow(
                                color: (s["color"] as Color)
                                    .withOpacity(_pulseAnim.value * 0.6),
                                blurRadius: 6,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Text(
                      s["status"] as String,
                      style: TextStyle(
                        color: s["color"] as Color,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      s["label"] as String,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 9,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconBox(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}

// ═══════════════════════════════════════
//  CUSTOM PAINTERS
// ═══════════════════════════════════════

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00E5FF).withOpacity(0.04)
      ..strokeWidth = 0.5;

    for (double i = 0; i < size.width; i += 30) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 30) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class OrbitPainter extends CustomPainter {
  final double radius;
  final bool isSelected;

  OrbitPainter({required this.radius, required this.isSelected});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final a = size.width / 2 * radius;
    final b = a * 0.4;

    final paint = Paint()
      ..color = isSelected
          ? const Color(0xFF00E5FF).withOpacity(0.25)
          : const Color(0xFF00E5FF).withOpacity(0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = isSelected ? 1.2 : 0.6;

    final rect = Rect.fromCenter(center: center, width: a * 2, height: b * 2);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class RadarPainter extends CustomPainter {
  final double progress;
  final Color planetColor;

  RadarPainter({required this.progress, required this.planetColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = size.width / 2;

    // Circles
    for (int i = 1; i <= 3; i++) {
      canvas.drawCircle(
        center,
        maxRadius * i / 3,
        Paint()
          ..color = const Color(0xFF00E5FF).withOpacity(0.12)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8,
      );
    }

    // Cross lines
    final linePaint = Paint()
      ..color = const Color(0xFF00E5FF).withOpacity(0.08)
      ..strokeWidth = 0.5;
    canvas.drawLine(
        Offset(0, center.dy), Offset(size.width, center.dy), linePaint);
    canvas.drawLine(
        Offset(center.dx, 0), Offset(center.dx, size.height), linePaint);

    // Sweep
    final sweepAngle = progress * 2 * pi;
    final sweepPaint = Paint()
      ..shader = SweepGradient(
        startAngle: sweepAngle - 0.8,
        endAngle: sweepAngle,
        colors: [
          Colors.transparent,
          planetColor.withOpacity(0.4),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: maxRadius));
    canvas.drawCircle(center, maxRadius, sweepPaint);

    // Sweep line
    final lineEnd = Offset(
      center.dx + maxRadius * cos(sweepAngle),
      center.dy + maxRadius * sin(sweepAngle),
    );
    canvas.drawLine(
      center,
      lineEnd,
      Paint()
        ..color = planetColor.withOpacity(0.6)
        ..strokeWidth = 1.5,
    );

    // Dots (fake detections)
    final dotPositions = [
      Offset(center.dx + 15, center.dy - 20),
      Offset(center.dx - 25, center.dy + 10),
      Offset(center.dx + 30, center.dy + 25),
    ];
    for (final pos in dotPositions) {
      canvas.drawCircle(
        pos,
        2.5,
        Paint()..color = planetColor.withOpacity(0.8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SignalPainter extends CustomPainter {
  final double progress;
  final Color color;

  SignalPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final centerY = size.height / 2;

    for (double x = 0; x < size.width; x += 1) {
      final normalizedX = x / size.width;
      final wave = sin((normalizedX + progress) * 4 * pi) *
          (15 + sin((normalizedX + progress) * 2 * pi) * 10);
      if (x == 0) {
        path.moveTo(x, centerY + wave);
      } else {
        path.lineTo(x, centerY + wave);
      }
    }

    canvas.drawPath(path, paint);

    // Glow effect
    canvas.drawPath(
      path,
      Paint()
        ..color = color.withOpacity(0.15)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ═══════════════════════════════════════
//  ANIMATED BUILDER HELPER
// ═══════════════════════════════════════
class AnimatedBuilder extends AnimatedWidget {
  final Widget Function(BuildContext, Widget?) builder;
  final Widget? child;

  const AnimatedBuilder({
    super.key,
    required Animation<double> animation,
    required this.builder,
    this.child,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return builder(context, child);
  }
}

// ═══════════════════════════════════════
//  DATA MODELS
// ═══════════════════════════════════════
class PlanetData {
  final String name, distance, diameter, temp, moons, year, gravity, type, description;
  final List<Color> colors;
  final double orbitRadius, speed;
  final int size;
  final List<String> missions;

  PlanetData({
    required this.name,
    required this.distance,
    required this.diameter,
    required this.temp,
    required this.moons,
    required this.year,
    required this.gravity,
    required this.type,
    required this.description,
    required this.colors,
    required this.orbitRadius,
    required this.speed,
    required this.size,
    required this.missions,
  });
}

class StarParticle {
  final double x, y, size, twinkleSpeed, brightness;

  StarParticle({
    required this.x,
    required this.y,
    required this.size,
    required this.twinkleSpeed,
    required this.brightness,
  });
}

class ShootingStar {
  final double startX, startY, angle, speed, delay;

  ShootingStar({
    required this.startX,
    required this.startY,
    required this.angle,
    required this.speed,
    required this.delay,
  });
}