import 'package:flutter/material.dart';
import '../models/github_repository.dart';

class RepoDetailPage extends StatelessWidget {
  final GitHubRepository repo;

  const RepoDetailPage(this.repo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          repo.name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
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
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    repo.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildInfoRow('Language', repo.language),
            const SizedBox(height: 10),
            _buildInfoRow('Stars', repo.stars.toString()),
            const SizedBox(height: 10),
            _buildInfoRow('Watchers', repo.watchers.toString()),
            const SizedBox(height: 10),
            _buildInfoRow('Forks', repo.forks.toString()),
            const SizedBox(height: 10),
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
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
