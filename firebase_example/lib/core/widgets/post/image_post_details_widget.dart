import 'package:clean_framework_firebase_example/core/theme/firebase_example_theme.dart';
import 'package:flutter/material.dart';

class ImagePostDetailsWidget extends StatelessWidget {
  const ImagePostDetailsWidget({
    super.key,
    required this.onDeleteClicked,
  });

  final void Function() onDeleteClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Color.fromARGB(95, 255, 255, 255),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              alignment: AlignmentDirectional.center,
              width: 250,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 239, 227, 227),
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                              0.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onPressed: onDeleteClicked,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Delete',
                              style:
                                  FirebaseExampleTheme.of(context).bodyMedium,
                            ),
                            const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 0.0,
                    thickness: 1.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
