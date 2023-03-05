class CustomUser {
  final String uid;
  String? email = '';
  String? displayName = '';
  String? photoURL = '';
  CustomUser({required this.uid});
  CustomUser.info({required this.uid, this.email, this.displayName, this.photoURL});
}
