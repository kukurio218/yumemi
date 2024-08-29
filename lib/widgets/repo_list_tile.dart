import 'package:flutter/material.dart';
import '../models/github_repository.dart';
import '../screens/repo_detail_page.dart';

class RepoListTile extends StatelessWidget {
  final GitHubRepository repo;

  const RepoListTile({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.all(10.0),
        title: Text(
          repo.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          repo.language,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.network(repo.ownerAvatarUrl, width: 50, height: 50),
        ),
        trailing: const Icon(Icons.arrow_forward, color: Colors.black),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RepoDetailPage(repo),
            ),
          );
        },
      ),
    );
  }
}
