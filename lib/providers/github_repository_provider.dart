import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/github_repository.dart';

final gitHubRepositoryProvider =
    StateNotifierProvider<GitHubRepositoryNotifier, List<GitHubRepository>>(
        (ref) {
  return GitHubRepositoryNotifier();
});

class GitHubRepositoryNotifier extends StateNotifier<List<GitHubRepository>> {
  GitHubRepositoryNotifier() : super([]);

  Future<void> searchRepositories(String keyword) async {
    final response = await http.get(
        Uri.parse('https://api.github.com/search/repositories?q=$keyword'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      state = (data['items'] as List)
          .map((item) => GitHubRepository.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }
}
