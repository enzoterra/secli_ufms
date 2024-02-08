import 'package:flutter/material.dart';

class CredentialsTile extends StatefulWidget {
  const CredentialsTile({
    super.key,
  });

  @override
  CredentialsTileState createState() => CredentialsTileState();
}

class CredentialsTileState extends State<CredentialsTile> {
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
                decoration: const InputDecoration(
                    hintText: "Senha", border: OutlineInputBorder()),
                style: const TextStyle(fontSize: 18))),
        const SizedBox(
          height: 30,
        ),
        Container(
          decoration: const BoxDecoration(color: Color.fromARGB(255, 0, 81, 187), borderRadius: BorderRadius.all(Radius.circular(5))),
          height: 40,
          width: 90,
          child: 
          TextButton(
              onPressed: () {
                const snackBar = SnackBar(content: Text("Informações de login salvas!"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text(
                "Salvar",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.07),
              ))),
      ],
    );
  }
}
