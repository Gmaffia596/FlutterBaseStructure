import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends FlutterSecureStorage {
  SecureStorage();

  Future<void> writeAuthToken(String authToken) async{
    await super.write(key: 'AuthToken', value: authToken);
  }

  Future<void> writeAuthTokenDuration(int duration) async{
    await super.write(key: 'AuthTokenDuration', value: duration.toString());
  }

  Future<void> writeAuthTokenCreationDate(DateTime timeStamp) async {
    await super.write(key: 'AuthTokenCreationDate', value: timeStamp.toString());
  }

  Future<void> writeRefreshToken(String refreshToken) async{
    await super.write(key: 'RefreshToken', value: refreshToken);
  }

  Future<void> writeRefreshTokenDuration(int duration) async{
    await super.write(key: 'RefreshTokenDuration', value: duration.toString());
  }

  Future<void> writeRefreshCreationDate(DateTime timeStamp) async{
    await super.write(key: 'RefreshTokenCreationDate', value: timeStamp.toString());
  }

  Future<void> writeUserId(String userId) async{
    await super.write(key: 'UserId', value: userId);
  }


  Future<String?> get getAuthToken async => await super.read(key: 'authToken');
  Future<String?> get getRefreshToken async => await super.read(key: 'RefreshToken');
  Future<String?> get getRefreshTokenDuration async => await super.read(key: 'RefreshTokenDuration');
  Future<String?> get getRefreshCreationDate async => await super.read(key: 'RefreshTokenCreationDate');
  Future<String?> get getAuthTokenDuration async => await super.read(key: 'AuthTokenDuration');
  Future<String?> get getIdCreationDate async => await super.read(key: 'AuthTokenCreationDate');
  Future<String?> get getUserId async => await super.read(key: 'UserId');


  void deleteAuthToken() {
    super.delete(key: 'authToken');
  }

  void deleteRefreshToken() {
    super.delete(key: 'RefreshToken');
  }

  void deleteRefreshTokenDuration() {
    super.delete(key: 'RefreshTokenDuration');
  }

  void deleteRefreshTokenCreationDate() {
    super.delete(key: 'RefreshTokenCreationDate');
  }

  void deleteUserId() {
    super.delete(key: 'UserId');
  }
  
  void deleteAuthTokenDuration() {
    super.delete(key: 'AuthTokenDuration');
  }

  void deleteAuthTokenCreationDate() {
    super.delete(key: 'AuthTokenCreationDate');
  }

  void clearStorage(){
    super.deleteAll();
  }
}
