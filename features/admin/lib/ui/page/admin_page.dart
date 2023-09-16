import 'package:admin/admin.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: DashboardView(
      isAdminPanel: true,
    ));
  }
}
