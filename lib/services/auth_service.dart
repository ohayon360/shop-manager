import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flash_chat/services/database.dart';
import 'package:flash_chat/user.dart';
import 'package:flash_chat/screens/home_screen.dart';

class AuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  User get currentUser => _firebaseAuth.currentUser;
  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  Future<User> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        DocumentSnapshot doc = await mangerRef.doc(currentUser.uid).get();


        if (!doc.exists) {
          mangerRef.doc(currentUser.uid).set({
            "id": currentUser.uid,
            "displayName": currentUser.displayName,
            "email": currentUser.email,
            "timestamp": timestampNow,
          });
          //now all the set data we are storing in doc
          doc = await mangerRef.doc(currentUser.uid).get();
        }
        //current user is now this data
        currentUserHome = UserClass.fromDocument(doc);
        return userCredential.user;
      } else {
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_ID_TOKEN',
          message: 'Missing Google id token',
        );
      }
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }
}