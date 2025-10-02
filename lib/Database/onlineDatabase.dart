import 'dart:convert';

import 'package:http/http.dart' as https;

import '../model/skill_model.dart';

class DBHelper {
  List<SkillModel> finalDataList = [];

  Future<List<SkillModel>> getResponse() async {
    try {
      final response = await https.get(
        Uri.parse(
          "https://68dcbc4c7cd1948060ab2452.mockapi.io/sports_tech_database",
        ),
      );
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List<dynamic>;
        finalDataList = body
            .map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return finalDataList;
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Failed to Fetch Data: ${e.toString()}");
    }
  }
}
