// import 'package:furnitureapp/model/category_model.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


// class CategoryRepository extends GetxController {
//   static CategoryRepository get instance => Get.find();

//   final _db = FirebaseFirestore.instance;

  

//   Future<List<CategoryModel>>getAllCategories() async {
//     try{
//       final snapshot = await _db.collection('Chairs').get();
//       final list = snapshot.docs.map((document)=>CategoryModel.fromSnapshot(document)).toList();
//       return list;
//     }catch(e){
//       throw 'Something went wrong';
//     }
//   }

// }