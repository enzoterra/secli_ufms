import 'package:flutter/material.dart';

class LinksTile extends StatefulWidget {
  const LinksTile({
    super.key,
  });

  @override
  LinksTileState createState() => LinksTileState();
}

class LinksTileState extends State<LinksTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Adicionar link personalizado",
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
                  hintText: "Nome", border: OutlineInputBorder()),
              style: const TextStyle(fontSize: 18),
            )),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
            height: 54,
            child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Link", border: OutlineInputBorder()),
                style: const TextStyle(fontSize: 18))),
        const SizedBox(height: 30,),
        Container(
          decoration: const BoxDecoration(color: Color.fromARGB(255, 0, 81, 187), borderRadius: BorderRadius.all(Radius.circular(5))),
          height: 40,
          width: 120,
          child: 
          TextButton(
              onPressed: () {
                const snackBar = SnackBar(content: Text("Link adicionado!"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text(
                "Adicionar",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.07),
              ))),
      ],
    );
  }
}
