import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/github_repository_provider.dart';
import '../widgets/repo_list_tile.dart';

class RepoSearchPage extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  RepoSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(gitHubRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GitHub Repo Search',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter a keyword',
                hintStyle: const TextStyle(color: Colors.black38),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () async {
                    try {
                      await ref
                          .read(gitHubRepositoryProvider.notifier)
                          .searchRepositories(_controller.text);
                    } catch (e) {
                      // エラー発生時にSnackbarで通知
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to load repositories: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: repositories.isEmpty
                ? const Center(
                    child: Text(
                      'No repositories found',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: repositories.length,
                    itemBuilder: (context, index) {
                      final repo = repositories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        child: RepoListTile(repo: repo),
                      );
                    },
                  ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
