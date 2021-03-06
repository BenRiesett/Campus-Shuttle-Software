import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Colors.red[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _FooterItem('About'),
          SizedBox(
            width: 100,
          ),
          _FooterItem('Contact'),
        ],
      ),
    );
  }
}

class _FooterItem extends StatelessWidget {
  final String title;
  const _FooterItem(this.title);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
