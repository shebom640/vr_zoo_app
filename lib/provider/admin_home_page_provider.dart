import 'package:flutter/widgets.dart';
import 'package:vr_zoo/provider/gridview_provider.dart';

class AdminHomePageProvider extends StatelessWidget {
  const AdminHomePageProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridViewProvider(),
    );
  }
}
