
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AuthRegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';
import 'package:e_commerce_app/domain/repositories/repository/register_repo_interface.dart';

class RegisterUseCase{
  RegisterRepositoryInterface registerRepositoryInterface;
  RegisterUseCase({required this.registerRepositoryInterface});
  Future<Either<Failures,AuthRegisterResponseEntity>> Register(String fullName,String phoneNum,String email,String passWord,String repassword)async{

    return registerRepositoryInterface.Register(fullName, phoneNum, email, passWord,repassword);
  }

}