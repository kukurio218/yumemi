import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/github_repository_provider.dart';
import '../widgets/repo_list_tile.dart';

class RepoSearchPage extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(gitHubRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Repo Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter a keyword',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    ref
                        .read(gitHubRepositoryProvider.notifier)
                        .searchRepositories(_controller.text);
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: repositories.isEmpty
                ? Center(child: Text('No repositories found'))
                : ListView.builder(
                    itemCount: repositories.length,
                    itemBuilder: (context, index) {
                      final repo = repositories[index];
                      return RepoListTile(repo: repo);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
