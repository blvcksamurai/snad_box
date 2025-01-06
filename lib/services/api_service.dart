import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://showcase-test-render.onrender.com';

  Future<dynamic> fetchData(String endpoint) async {
    // Ensure the URL is constructed correctly
    final url = Uri.parse('$baseUrl/$endpoint');
    print('Requesting URL: $url'); // Debug log for the constructed URL

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json', // Adjust as per your API
        // 'Authorization': 'Bearer YOUR_TOKEN', // Uncomment and replace if required
      });

      print(
          'Response Status Code: ${response.statusCode}'); // Debug log for status code

      if (response.statusCode == 200) {
        print('Response Body: ${response.body}'); // Debug log for response body
        return jsonDecode(response.body); // Parse and return JSON data
      } else {
        print('Failed with status code: ${response.statusCode}');
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }
}
