import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flut_tube/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth;
class Account{
  String userID, userName, email, picture;
  Account({this.userID, this.userName, this.email, this.picture});
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  auth = FirebaseAuth.instance;

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  //final UserRepository user_repos = UserRepository();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyApplication(),
    );
  }
}

class MyApplication extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ContextController();
}

class ContextController extends State<MyApplication>{
  Account account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: GoogleAuthButton(
              onPressed: () => signInWithGoogle(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: EmailAuthButton(
              onPressed: () => signInWithEmail(context),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: FacebookAuthButton(
              onPressed: () => signInWithFacebook(),
            ),
          ),
        ],
      ),
    );
  }

  void pushPage(BuildContext context, Widget page){
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (build)=>page));
  }

  Future<void> signInWithGoogle() async{
    try{
      final GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication authentication = await googleSignInAccount.authentication;
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken
      );
      UserCredential userCredential = await auth.signInWithCredential(credential);

      account =  Account(
          userID: googleSignInAccount.id,
          userName: googleSignInAccount.displayName,
          email: googleSignInAccount.email,
          picture: googleSignInAccount.photoUrl
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${account.userName} signed in')));
      pushPage(context, LoginSuccessPage());
    }catch(e){
      print(e.toString());
    }
  }

  Future<void> signInWithFacebook() async{
    try{
      final FacebookAuth facebookAuth = FacebookAuth.instance;
      final LoginResult loginResult = await facebookAuth.login(permissions: ['email', 'public_profile']);
      if(loginResult.status == LoginStatus.success){
        AccessToken accessToken = loginResult.accessToken;
        final FacebookAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(accessToken.token);
        UserCredential userCredential = await auth.signInWithCredential(facebookAuthCredential);

        Map<String, dynamic> userData = await facebookAuth.getUserData(fields: "name, email, picture, id");
        //log userData
        account =  Account(
            userID: userData['id'],
            userName: userData['name'],
            email: userData['email'],
            picture: userData['picture']['data']['url']
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${account.userName} signed in')));
        pushPage(context, LoginSuccessPage());
      }

    }catch(e){
      print(e.toString());
    }
  }

  Future<void> signInWithEmail(BuildContext context) async{
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (String value){
                    if(value.isEmpty)
                      return 'Please enter your email';
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  validator: (String value){
                    if(value.isEmpty)
                      return 'Please enter your password';
                    return null;
                  },
                  obscureText: true,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(
                      Icons.login,
                      semanticLabel: 'Sign in',
                    ),
                    onPressed: () async{
                      try{
                        User user = (await auth.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text
                        )).user;
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${user.email} signed in')));
                        pushPage(context, LoginSuccessPage());
                      } on FirebaseAuthException catch(e){
                        print(e.code);
                      }
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(
                      Icons.add,
                      semanticLabel: 'Sign up',
                    ),
                    onPressed: () async{
                      try{
                        User user = (await auth.createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text
                        )).user;
                        pushPage(context, LoginSuccessPage());
                      } on FirebaseAuthException catch(e){
                        print(e.code);
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}