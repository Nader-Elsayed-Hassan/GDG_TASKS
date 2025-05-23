import 'package:flutter/material.dart';
import 'package:flutter_application_2/wether_model.dart';
import 'package:flutter_application_2/wether_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Wetherscreen extends StatefulWidget {
  const Wetherscreen({super.key});

  @override
  State<Wetherscreen> createState() => _WetherscreenState();
}

class _WetherscreenState extends State<Wetherscreen> {
  final WetherService _wetherService = WetherService();
  late Future<Map<String, dynamic>> _weatherData;
  final TextEditingController _cityController =
      TextEditingController(text: "cairo");

  @override
  void initState() {
    super.initState();
    _weatherData = _wetherService.fetchWeather(_cityController.text);
  }

  void search() {
    FocusScope.of(context).unfocus(); // Dismiss the keyboard
    setState(() {
      _weatherData = _wetherService.fetchWeather(_cityController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text(
          "Wether App",
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                hintText: "Enter city name",
                suffixIcon: IconButton(
                  onPressed: search,
                  icon: Icon(Icons.search),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder<Map<String, dynamic>>(
              future: _weatherData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SpinKitCircle(
                    color: Colors.blue,
                    size: 50.0,
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData) {
                  final model = WetherModel.fromJson(snapshot.data!);
                  return BuildWetherCard(model: model);
                } else {
                  return const Text("No data available");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BuildWetherCard extends StatelessWidget {
  const BuildWetherCard({
    super.key,
    required this.model,
  });

  final WetherModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "${model.cityName}, ${model.country}",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Image.network(
              "${model.iconUrl}",
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, size: 50, color: Colors.red);
              },
            ),
            Text(
              "${model.temperature}°C",
              style: GoogleFonts.poppins(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${model.condition}",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
