
import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthRegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';
import 'package:e_commerce_app/domain/repositories/repository/register_repo_interface.dart';

class LoginUseCase{

  RegisterRepositoryInterface registerRepositoryInterface;
  LoginUseCase({required this.registerRepositoryInterface});

  Future<Either<Failures,AuthRegisterResponseEntity>> Login(String email, String passWord){

    return registerRepositoryInterface.Login(email, passWord);
  }
}