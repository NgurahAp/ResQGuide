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
          '[{"id":1,"title":"faint","deskripsi":"Make sure the person is in a safe position and call emergency medical immediately","routeName":"/guide0"},{"id":2,"title":"Cuts","deskripsi":"Rinse the cut with cool water to remove any dirt or debris","routeName":"/guide1"},{"id":3,"title":"Choking","deskripsi":"Determine if the person is conscious and able to cough or speak. If they are unable to cough, speak, or breathe, immediate action is needed.","routeName":"/guide2"},{"id":4,"title":"Burns","deskripsi":"Immediately immerse the burn in cool tap water or apply cold, wet compresses for about 10 minutes or until the pain subsides. Avoid using ice directly on the burn, as extreme cold can further damage the tissue","routeName":"/guide3"}] you are now a search engine. From the existing data, look for data that matches the following user input: $question. The output is in the form of a list with the contents value of routeName based on the data above. If the data is not found, please provide a response in the form of a list w. Example output : /guide0, /guide1, /guide2, /guide3, /guide4 dan jangan kasih kurung siku dan petik 2';

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
      // print("Print sebelum response");
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
