import 'package:creating_mocks/random_user_repository.dart';
import 'package:creating_mocks/remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
// import 'package:mockito/mockito.dart';

import 'random_user_repository_test.mocks.dart';

@GenerateMocks([RemoteDataSource])
void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late RandomUserRepositoryImpl repository;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository =
        RandomUserRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('Mockito: RandomUserRepository', () {
    group('fetchRandomUser', () {
      test(
        'should call getRandomUser from remote datasource',
        () async {
          // arrange
          when(mockRemoteDataSource.getRandomUser())
              .thenAnswer((_) async => null);

          // act
          await repository.fetchRandomUser();

          // assert
          verify(mockRemoteDataSource.getRandomUser());
        },
        tags: ['mockito'],
      );
    });
  });
}
