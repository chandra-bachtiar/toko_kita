import 'package:flutter/material.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class SuccessDialog extends StatelessWidget {
  final String? description;
  final VoidCallback? okClick;

  const SuccessDialog({Key? key, this.description, this.okClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Consts.avatarRadius + Consts.padding,
        bottom: Consts.padding,
        left: Consts.padding,
        right: Consts.padding,
      ),
      margin: const EdgeInsets.only(top: Consts.avatarRadius),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Success',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24.0),
          Text(
            description!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const SizedBox(height: 24.0),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                okClick!();
              },
              child: const Text('OK'),
            ),
          ),
        ],
      ),
    );
  }
}
