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
            height: 60,
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "Nome", border: OutlineInputBorder()),
              style: const TextStyle(fontSize: 18),
            )),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
            height: 60,
            child: TextFormField(
                decoration: const InputDecoration(
                    hintText: "Link", border: OutlineInputBorder()),
                style: const TextStyle(fontSize: 18)))
      ],
    );
  }
}
