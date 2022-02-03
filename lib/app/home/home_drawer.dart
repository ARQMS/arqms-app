import 'package:ARQMS/app/app_localizations.dart';
import 'package:ARQMS/app/home/home_page.dart';
import 'package:ARQMS/app/home/home_viewmodel.dart';
import 'package:ARQMS/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jdenticon_dart/jdenticon_dart.dart';

class HomeDrawer extends ConsumerStatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends ConsumerState<HomeDrawer> {
  final GlobalKey drawerKey = GlobalKey<DrawerControllerState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeModelProvider);

    return Drawer(
      key: drawerKey,
      child: Column(
        children: [
          _buildHeader(viewModel),
          Expanded(child: _drawerContent(viewModel)),
          const Divider(),
          _buildFooter(viewModel),
        ],
      ),
    );
  }

  Widget _buildHeader(HomeViewModel viewModel) {
    final userProvider = ref.watch(userChangedProvider);
    final user = userProvider.value!;

    String name = (user.firstname != null || user.name != null)
        ? "${user.firstname} ${user.name}"
        : "";
    return UserAccountsDrawerHeader(
      accountName: Text(name),
      accountEmail: Text(user.email),
      currentAccountPicture: CircleAvatar(
        child: SvgPicture.string(Jdenticon.toSvg(user.email)),
      ),
    );
  }

  Widget _drawerContent(HomeViewModel viewModel) => ListView(
        children: [
          _menuEntry(
            titleId: "drawer.rooms",
            icon: const Icon(Icons.settings_remote),
            onPress: viewModel.gotoRoom,
          )
        ],
      );

  Widget _buildFooter(HomeViewModel viewModel) => Column(
        children: [
          _menuEntry(
            titleId: "drawer.signOut",
            icon: const Icon(Icons.logout),
            onPress: viewModel.signOut,
          ),
          const Divider(),
          buildVersion(viewModel)
        ],
      );

  Widget buildVersion(HomeViewModel viewModel) => Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 18.0, bottom: 5.0),
        child: Text(
          viewModel.versionInfo,
          style: const TextStyle(fontSize: 9),
        ),
      );

  /// Helper method to create drawer entries
  Widget _menuEntry({
    required String titleId,
    Widget? icon,
    void Function()? onPress,
    bool selected = false,
    bool enabled = true,
  }) {
    return ListTile(
      selected: selected,
      title: Text(titleId.i18n(context)),
      leading: icon,
      onTap: onPress,
      enabled: enabled,
    );
  }
}
