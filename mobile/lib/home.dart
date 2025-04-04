import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serre Agricole Connectée'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'État de la Serre',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              _buildSensorCard('Température', '25°C', Icons.thermostat),
              _buildSensorCard('Humidité', '60%', Icons.water),
              _buildSensorCard('Lumière', '3000 Lux', Icons.wb_sunny),
              _buildSensorCard('Niveau de CO2', '400 ppm', Icons.air),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Action pour contrôler les systèmes de la serre
                },
                child: Text('Contrôler les Systèmes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSensorCard(String title, String value, IconData icon) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(title, style: TextStyle(fontSize: 18)),
        trailing: Text(value, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}