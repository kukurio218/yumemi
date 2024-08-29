import 'package:flutter/material.dart';
import '../models/github_repository.dart';
import '../screens/repo_detail_page.dart';

class RepoListTile extends StatelessWidget {
  final GitHubRepository repo;

  RepoListTile({required this.repo});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(repo.name),
      subtitle: Text(repo.language),
      leading: Image.network(repo.ownerAvatarUrl),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RepoDetailPage(repo),
          ),
        );
      },
    );
  }
}
