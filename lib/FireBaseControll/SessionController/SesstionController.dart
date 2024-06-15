
import 'dart:io';

class SessionController
{
  static final SessionController sessionController = SessionController._internal();

  String? userId;
  String? nameGet;
  String? emailGet;
  String? skinCancerURL;
  String? resultStoreForSkinCancer;
  File? image;
  bool haveException = false;
  bool isSkinCancer = false;
  factory SessionController(){
    return sessionController;
  }

  SessionController._internal();
}