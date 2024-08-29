import 'package:flutter/material.dart';
import '../models/github_repository.dart';
import '../screens/repo_detail_page.dart';

class RepoListTile extends StatelessWidget {
  final GitHubRepository repo;

  RepoListTile({required this.repo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        title: Text(
          repo.name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          repo.language ?? 'Unknown',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.network(repo.ownerAvatarUrl, width: 50, height: 50),
        ),
        trailing: Icon(Icons.arrow_forward, color: Colors.black),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RepoDetailPage(repo),
            ),
          );
        },
      ),
      color: Colors.white,
    );
  }
}
