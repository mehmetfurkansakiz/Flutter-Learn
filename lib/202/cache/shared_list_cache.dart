import 'package:flutter/material.dart';
import 'package:flutter_learn/202/cache/shared_learn_cache.dart';
import 'package:flutter_learn/202/cache/shared_manager.dart';
import 'package:flutter_learn/202/cache/user_cache/user_cache_manager.dart';
import 'package:flutter_learn/202/cache/user_model.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  // Init:
  @override
  void initState() {
    super.initState();
    initializeAndSave();
  }

  // Variables:
  late final UserCacheManager userCacheManager;
  List<User> _users = [];

  // Initialize shared manager:
  Future<void> initializeAndSave() async {
    changeLoading();
    final SharedManager manager = SharedManager();
    await manager.init();
    userCacheManager = UserCacheManager(manager);
    _users = userCacheManager.getItems() ?? [];
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading
            ? CircularProgressIndicator(
                color: Theme.of(context).scaffoldBackgroundColor,
              )
            : null,
        actions: isLoading
            ? null
            : [
                IconButton(
                  icon: const Icon(Icons.download_for_offline_outlined),
                  onPressed: () async {
                    changeLoading();
                    await userCacheManager.saveItems(_users);
                    changeLoading();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {},
                ),
              ],
      ),
      body: _UserListView(
        users: _users,
      ),
    );
  }
}

// User List View:
class _UserListView extends StatelessWidget {
  const _UserListView({
    super.key,
    required this.users,
  });
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
              title: Text(users[index].name ?? ''),
              subtitle: Text(users[index].description ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(decoration: TextDecoration.underline, color: Colors.blue)),
              leading: Text(users[index].url ?? ''),
              //Image.network(users[index].url ?? ''),
              trailing: const Icon(Icons.arrow_forward_ios)),
        );
      },
    );
  }
}
