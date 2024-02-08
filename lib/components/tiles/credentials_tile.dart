import 'package:Secli/components/settings/text_form_field_settings.dart';
import 'package:Secli/components/settings/title_settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CredentialsTile extends StatefulWidget {
  const CredentialsTile({
    super.key,
  });

  @override
  CredentialsTileState createState() => CredentialsTileState();
}

class CredentialsTileState extends State<CredentialsTile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    () async {
      var prefs = await SharedPreferences.getInstance();
      String email = '';
      String password = '';

      if (prefs.containsKey('email') && prefs.containsKey('password')) {
        email = prefs.getString('email') ?? '';
        password = prefs.getString('password') ?? '';
      }

      emailController.text = email;
      passwordController.text = password;
    }();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleSettings(title: "Informações de login"),
        const SizedBox(
          height: 50,
        ),
        TFFSettings(controller: emailController, hint: "Email", isPassword: false,),
        const SizedBox(
          height: 15,
        ),
        TFFSettings(controller: passwordController, hint: "Senha", isPassword: true,),
        const SizedBox(
          height: 34,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              height: 40,
              width: 90,
              child: TextButton(
                  onPressed: () async {
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString('email', '');
                    prefs.setString('password', '');
                    emailController.text = '';
                    passwordController.text = '';
                    if (prefs.getString('email') == '') {
                      const snackBar = SnackBar(
                          content: Text("Informações de login deletadas!"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      const snackBar = SnackBar(
                          content: Text(
                              "Algo deu errado, não foi possível deletar"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text(
                    "Apagar",
                    style: TextStyle(
                        color: Color.fromARGB(255, 22, 22, 22),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1.07),
                  ))),
          Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 81, 187),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              height: 40,
              width: 90,
              child: TextButton(
                  onPressed: () async {
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString('email', emailController.text);
                    prefs.setString('password', passwordController.text);
                    const snackBar =
                        SnackBar(content: Text("Informações de login salvas!"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text(
                    "Salvar",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1.07),
                  ))),
        ]),
      ],
    );
  }
}
