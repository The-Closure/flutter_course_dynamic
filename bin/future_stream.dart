
 void main() async{


  Future.delayed(Duration(seconds: 5,),()async{
  String message ="yes";
   print(await message);
 });

  print(await "hello");

  Stream   // future
  yield     // await
  async*    // async
}


