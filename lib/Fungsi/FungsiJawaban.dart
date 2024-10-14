import 'package:flutter/material.dart';

class fungis {

  void inputJawaban(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF9CA3AF),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Upload Jawaban"),
                  IconButton(
                    icon: const Icon(Icons.cancel_outlined,
                    color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              content: const Column(
               children: [
                Row(),
                SizedBox(height: 5,)
                
               ],
              ),
            );
          });
        });
  }

}
