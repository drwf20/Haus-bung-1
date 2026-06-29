import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Map<String, dynamic>? weather;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    loadWeather();
  }

  Future<void> loadWeather() async {
    try {
      final url =
          "https://api.open-meteo.com/v1/forecast?latitude=50.58&longitude=8.68&current=temperature_2m,relative_humidity_2m,apparent_temperature,weather_code,wind_speed_10m&timezone=Europe%2FBerlin";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          weather = data["current"];
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mein Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Wetter-Kachel
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: buildWeatherCard(),
              ),
            ),

            const SizedBox(height: 16),

            // Todo-Kachel
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: buildTodoCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWeatherCard() {
    if (isLoading) {
      return const Text("Lade Wetterdaten...");
    }
    if (hasError || weather == null) {
      return const Text("Fehler beim Laden der Wetterdaten.");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Wetter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text("Temperatur: ${weather!["temperature_2m"]} °C"),
        Text("Gefühlte Temperatur: ${weather!["apparent_temperature"]} °C"),
        Text("Luftfeuchtigkeit: ${weather!["relative_humidity_2m"]} %"),
        Text("Wind: ${weather!["wind_speed_10m"]} km/h"),
      ],
    );
  }

  Widget buildTodoCard() {
    final todos = [
      "Dashboard bauen",
      "README ergänzen",
      "Repository pushen",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Todo-Liste", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...todos.map((t) => Text("• $t")),
      ],
    );
  }
}
