// import 'package:furnitureapp/data/category_repository.dart';
// import 'package:furnitureapp/model/category_model.dart';
// import 'package:get/get.dart';

// class CategoryController extends GetxController{
//   static CategoryController get instance => Get.find();

//   final _categoryRepository = Get.put(CategoryRepository());
//   RxList<CategoryModel> categoriesGrid = <CategoryModel>[].obs;
//   @override
//   void onInit(){
//     fetchCategories();
//     super.onInit();
//   }

//   Future<void> fetchCategories() async{
//     try{

//       final categories = await _categoryRepository.getAllCategories();

//       categoriesGrid.assignAll(categories);

//     }catch(e){
//       throw 'Something went wrong';
//     }
//   }
// }