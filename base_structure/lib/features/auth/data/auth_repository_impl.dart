import 'package:base_structure/features/auth/data/data_sources/auth_data_source.dart';
import 'package:base_structure/features/auth/domain/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.authDataSources);
  final AuthDataSources authDataSources;
}
