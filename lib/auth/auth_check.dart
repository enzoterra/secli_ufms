import 'package:Secli/auth/local_auth_service.dart';
import 'package:Secli/components/colors.dart';
import 'package:Secli/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => AuthCheckState();
}

class AuthCheckState extends State<AuthCheck> {
  final ValueNotifier<bool> isLocalAuthFailed = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    checkLocalAuth();
  }

  checkLocalAuth() async {
    final auth = context.read<LocalAuthService>();
    isLocalAuthFailed.value = false;

    final authenticated = await auth.authenticate();

    if (!authenticated) {
      isLocalAuthFailed.value = true;
    } else {
      if (!mounted) return;
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => const Home())));
    }
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: CustomColors().blueMain,
    body: ValueListenableBuilder<bool>(
      valueListenable: isLocalAuthFailed,
      builder: (context, failed, _) {
        if (failed) {
          return Center(
            child: TextButton(
              onPressed: checkLocalAuth,
              child: const Text("Tentar novamente"),
            ),
          );
        }
        return Center(
          child: SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(
              color: CustomColors().white,
              backgroundColor: CustomColors().blueMain,
            ),
          ),
        );
      },
    ),
  );
}