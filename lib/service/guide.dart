import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:resq_guide/constants/openai.dart';
import 'package:resq_guide/models/openai.dart';

class GuideService {
  static Future<GptData> getGuide({
    required String question,
  }) async {
    late GptData gptData = GptData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: Usage(promptTokens: 0, completionTokens: 0, totalTokens: 0),
    );

    try {
      var url = Uri.parse('https://api.openai.com/v1/chat/completions');

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey"
      };

      String promptData =
          "First aid when finding someone $question with a short explanation of up to 100 with the answer format 'Things to do when finding someone...'";
      final data = jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content": promptData,
          }
        ],
        "temperature": 0.7,
        "max_tokens": 1000
      });

      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );
      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      }
    } catch (e) {
      throw Exception('Error occured when sending request');
    }
    return gptData;
  }
}
