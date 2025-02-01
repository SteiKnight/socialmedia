import 'package:flutter/material.dart';
import 'package:socialmedia/components/my_drawer.dart';
import 'package:socialmedia/components/post_board.dart';
import 'package:socialmedia/models/post.dart';
import 'package:socialmedia/services/auth/auth_service.dart';
import 'package:socialmedia/services/posts/post_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //authService & postService instance
  AuthService auth = AuthService();
  PostService postServices = PostService();

  //signOut function
  void signOut() {
    auth.signOut();
  }

  //post function
  void post(BuildContext context) {
    //post services
    try {
      postServices.post(controller.text);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }

    //clear the textfield
    controller.clear();
  }

  //controller
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('w a l l'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: signOut),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: "What's on your mind?",
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => post(context),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(Icons.check),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            PostBoard(stream: postServices.getAllPosts()),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
