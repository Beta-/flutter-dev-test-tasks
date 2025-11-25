import 'package:flutter/material.dart';

/// TODO - Requirements for candidate:
///
/// Build a screen that:
///
/// 🔹 Fetches posts from PostsService
/// 🔹 Shows:
///     - Loading state
///     - Error state
///     - List of posts
/// 🔹 Each item shows:
///     - title (bold)
///     - body (gray text)
/// 🔹 Add Refresh:
///     - Pull-to-refresh OR AppBar icon
///
/// Candidate must implement:
/// - State management (setState or provider/bloc/etc.)
/// - UI layout
/// - Error and loading handling

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  // TODO: declare variables (future, list, etc.)

  @override
  void initState() {
    super.initState();
    // TODO: load posts
  }

  Future<void> _refresh() async {
    // TODO: implement refresh logic
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement the UI logic (loading, error, list)
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts Viewer"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refresh,
          )
        ],
      ),
      body: const Center(
        child: Text("TODO: Implement posts list"),
      ),
    );
  }
}
