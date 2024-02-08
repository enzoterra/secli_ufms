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
  void initState() async {
    super.initState();

    final prefs = await SharedPreferences.getInstance();
    String email = '';
    String password = '';
    
    if (prefs.containsKey('email') && prefs.containsKey('password')) {
      email = prefs.getString('email') ?? '';
      password = prefs.getString('password') ?? '';
    }

    emailController.text = email;
    passwordController.text = password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Informações de login",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 81, 187)),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
            height: 54,
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: "Email", border: OutlineInputBorder()),
              style: const TextStyle(fontSize: 18),
            )),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
            height: 54,
            child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Senha", border: OutlineInputBorder()),
                style: const TextStyle(fontSize: 18))),
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
                  onPressed: () {
                    setState(() async {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('email', '');
                      prefs.setString('password', '');
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
                    });
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
                    final prefs = await SharedPreferences.getInstance();
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
