import 'dart:convert';
import 'package:projeto_matricula_application/domain/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_matricula_application/domain/subjects/dtos/subject_dto.dart';

class SubjectClient {
  SubjectClient();

  final String baseUrl = BaseUrl.baseUrl;

  Future<SubjectDTO> createSubject(SubjectDTO subject) async {
    final url = Uri.parse('$baseUrl/Disciplina/novaDisciplina');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(subject.toJson()),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        return SubjectDTO.fromJson(json);
      } else {
        throw Exception('Failed to create subject');
      }
    } catch (error) {
      throw Exception('Failed to create subject: $error');
    }
  }

  Future<List<SubjectDTO>> listSubjects() async {
    final url = Uri.parse('$baseUrl/Disciplina/obterTodasAsDisciplinas');

    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);

        final List<SubjectDTO> subjects =
            jsonList.map((json) => SubjectDTO.fromJson(json)).toList();

        return subjects;
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
