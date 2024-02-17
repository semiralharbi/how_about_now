import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:how_about_now/cubit/app_cubit.dart';
import 'package:how_about_now/domain/data_source/authentication_data_source.dart';
import 'package:how_about_now/domain/data_source/tasks_data_source.dart';
import 'package:how_about_now/domain/repositories/authentication_repository.dart';
import 'package:how_about_now/domain/repositories/tasks_repository.dart';
import 'package:how_about_now/presentation/pages/add_task/cubit/add_task_cubit.dart';
import 'package:how_about_now/presentation/pages/home_page/cubit/home_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  SharedPreferences,
  FirebaseFirestore,
  CollectionReference,
  DocumentReference,
  AuthenticationRepository,
  AuthenticationDataSource,
  TasksRepository,
  TasksDataSource,
  AppCubit,
  AddTaskCubit,
  HomeCubit,
])
void main() {}
