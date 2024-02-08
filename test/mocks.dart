import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:how_about_now/cubit/app_cubit.dart';
import 'package:how_about_now/domain/data_source/authentication_data_source.dart';
import 'package:how_about_now/domain/repositories/authentication_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  SharedPreferences,
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  AuthenticationRepository,
  AuthenticationDataSource,
  AppCubit,
])
void main() {}
