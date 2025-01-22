/// Future getData () async{
//     print("start function"); // will print this function first
//    await Future.delayed(Duration(seconds: 3), ()  { // without await will print this function after end her Duration
//       print("kerolos"); // when add await will waiting the Duration
//     });
//     print("end function"); // here will print this function without waiting function Duration
//   }
//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }