import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:payments/core/network/remote/api_endpoints.dart';
import 'package:payments/core/network/remote/dio_helper.dart';
import '../error/exceptions.dart';
import '../models/payment_model.dart';
import '../models/payment_token_model.dart';
import 'local/cache_helper.dart';

abstract class Repository {

  Future<Either<String, PaymentTokenModel>> getToken(
  {
    required String publicKey,
    required String cardNum,
    required String expiryMonth,
    required String expiryYear,
  });

  Future<Either<String, PaymentModel>> makePayment(
      {
        required String token,
        required String secretKey,
        required int amount,
      });

}

class RepoImplementation extends Repository {
  final DioHelper dioHelper;
  final CacheHelper cacheHelper;

  RepoImplementation({
    required this.dioHelper,
    required this.cacheHelper,
  });

  @override
  Future<Either<String, PaymentTokenModel>> getToken(
      {
          required String publicKey,
          required String cardNum,
          required String expiryMonth,
          required String expiryYear,


      }) async
  { return _basicErrorHandling<PaymentTokenModel>(
      onSuccess: () async
      {
        final Response f = await dioHelper.post(
            url: getPaymentTokenUrl,
            data:
            {
              'type': 'card',
              'number': cardNum,
              'expiry_month': expiryMonth,
              'expiry_year': expiryYear,


            },
            headers: {
              'Content-Type':'Application/json',
              'Authorization':publicKey
              } ,
      );
        return PaymentTokenModel.fromJson(f.data);
        },
      onServerError: (exception) async
      {
        debugPrint(exception.message);
        return exception.message;
      }
  );

  }


  @override
  Future<Either<String, PaymentModel>> makePayment(
      {
        required String token,
        required String secretKey,
        required int amount,
      }) async
  { return _basicErrorHandling<PaymentModel>(
      onSuccess: () async
      {
        final Response f = await dioHelper.post(
          url: makePaymentUrl,
          data:
          {
            'source' : {
              'type' : 'token',
              'token': token,
          },
            'amount' : amount,
            'currency': 'EGP',
          },
          headers: {
            'Content-Type':'Application/json',
            'Authorization': secretKey,
          } ,
        );
        return PaymentModel.fromJson(f.data);
      },
      onServerError: (exception) async
      {
        debugPrint(exception.message);
        return exception.message;
      }
  );

  }


}


extension on Repository {

  Future<Either<String, T>> _basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(ServerException exception)? onServerError,
    Future<String> Function(CacheException exception)? onCacheError,
    Future<String> Function(dynamic exception)? onOtherError,
  }) async {
    try {
      final f = await onSuccess();
      return Right(f);
    } on ServerException catch (e, s) {
      // recordError(e, s);
      debugPrint(s.toString());
      if (onServerError != null) {
        final f = await onServerError(e);
        return Left(f);
      }
      return const Left('Server Error');
    } on CacheException catch (e) {
      // recordError(e, s);
      debugPrint(e.toString());
      if (onCacheError != null) {
        final f = await onCacheError(e);
        return Left(f);
      }
      return const Left('Cache Error');
    } catch (e, s) {
      // recordError(e, s);
      debugPrint(s.toString());
      if (onOtherError != null) {
        final f = await onOtherError(e);
        return Left(f);
      }
      return Left(e.toString());
    }
  }
}
