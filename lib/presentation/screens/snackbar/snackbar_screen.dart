import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(
        label: 'ok!',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false, //
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
                onPressed: () {
                  context.pop(); // To close the modal.
                },
                child: const Text('cancel')),
            FilledButton(
                onPressed: () {
                  context.pop(); // To close the modal.
                },
                child: const Text('ok'))
          ],
          title: const Text('Are you sure??'),
          content: const Text(
              'Exercitation in excepteur et tempor esse non magna ullamco Lorem. Exercitation in excepteur et tempor esse non magna ullamco Lorem. Exercitation in excepteur et tempor esse non magna ullamco Lorem.'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar and Dialogs')),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Show snackbar'),
        onPressed: () {
          showCustomSnackbar(context);
        },
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      '''Minim aliquip laboris et do et do non. Ex Lorem enim tempor sint duis labore eu id ex aliquip et deserunt fugiat. Excepteur laborum id voluptate consectetur amet reprehenderit. Eiusmod cupidatat dolore in eiusmod fugiat sint nisi et cillum. Sit laboris pariatur fugiat eu ut sint velit. Ea dolore ad anim officia. Commodo labore est id nisi voluptate labore esse sit deserunt adipisicing labore ipsum nostrud. Do enim tempor consequat ullamco. Culpa excepteur est reprehenderit anim eiusmod cillum minim amet laborum Lorem anim adipisicing. Sint sunt reprehenderit fugiat ad mollit id nulla dolore ut proident laboris anim. Officia quis consectetur nisi do tempor aliquip incididunt ut ipsum minim cupidatat ad culpa. Aliquip quis fugiat nulla laboris exercitation amet. Cupidatat eiusmod ut occaecat proident veniam adipisicing aliqua amet.''')
                ]);
              },
              child: const Text('Licenses')),
          FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Show Dialog'))
        ],
      )),
    );
  }
}
