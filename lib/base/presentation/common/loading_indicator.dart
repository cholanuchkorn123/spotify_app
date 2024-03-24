import 'package:spotify_app/base/presentation/base_get_view.dart';

void showLoadingDialog(BuildContext context, bool success) {
  if (success) {
    Navigator.pop(context);
    return;
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext buildContext) {
      return const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    },
  );
}
