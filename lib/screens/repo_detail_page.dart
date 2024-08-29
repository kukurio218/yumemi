import 'package:flutter/material.dart';
import '../models/github_repository.dart';

class RepoDetailPage extends StatelessWidget {
  final GitHubRepository repo;

  RepoDetailPage(this.repo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repo.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(repo.ownerAvatarUrl, width: 50, height: 50),
                SizedBox(width: 10),
                Text(repo.name, style: TextStyle(fontSize: 24)),
              ],
            ),
            SizedBox(height: 10),
            Text('Language: ${repo.language}'),
            Text('Stars: ${repo.stars}'),
            Text('Watchers: ${repo.watchers}'),
            Text('Forks: ${repo.forks}'),
            Text('Open Issues: ${repo.openIssues}'),
          ],
        ),
      ),
    );
  }
}
