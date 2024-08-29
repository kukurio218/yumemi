import 'package:flutter/material.dart';
import '../models/github_repository.dart';

class RepoDetailPage extends StatelessWidget {
  final GitHubRepository repo;

  RepoDetailPage(this.repo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          repo.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white, // 戻るボタンの色
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child:
                      Image.network(repo.ownerAvatarUrl, width: 50, height: 50),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    repo.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildInfoRow('Language', repo.language),
            SizedBox(height: 10),
            _buildInfoRow('Stars', repo.stars.toString()),
            SizedBox(height: 10),
            _buildInfoRow('Watchers', repo.watchers.toString()),
            SizedBox(height: 10),
            _buildInfoRow('Forks', repo.forks.toString()),
            SizedBox(height: 10),
            _buildInfoRow('Open Issues', repo.openIssues.toString()),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Row(
      children: [
        Text(
          '$title: ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
