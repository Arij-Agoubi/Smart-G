import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.1.55:3000/api';

  // Méthode GET pour récupérer des données
  static Future<List<dynamic>> getData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Renvoie les données décodées
    } else {
      throw Exception('Failed to load data: ${response.body}');
    }
  }

  static Future<dynamic> postData(String endpoint, Map<String, String> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create data: ${response.body}');
    }
  }

  // Méthode PUT pour mettre à jour une entrée existante
  Future<Map<String, dynamic>> updateData(String endpoint, String id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Renvoie les données mises à jour
    } else {
      throw Exception('Failed to update data: ${response.body}');
    }
  }

  // Méthode DELETE pour supprimer une entrée
  Future<void> deleteData(String endpoint, String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$endpoint/$id'),
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete data: ${response.body}');
    }
  }
}