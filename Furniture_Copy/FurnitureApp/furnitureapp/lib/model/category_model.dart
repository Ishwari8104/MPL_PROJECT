

// class CategoryModel {
//   String imageUrl, name, price, type, fullName, description, id;
  

//   CategoryModel({
//     required this.id,
//     required this.imageUrl,
//     required this.name,
//     required this.fullName,
//     required this.price,
//     required this.type,
//     required this.description,
    
//   });

//   static CategoryModel empty() => CategoryModel(
//         imageUrl: '',
//         id: '',
//         name: '',
//         fullName: '',
//         price: '',
//         type: '',
//         description: '',
//          // Changed the type to Map<String, dynamic>
//       );

//   Map<String, dynamic> toJson() {
//     return {
//       'Name': name,
//       'Image': imageUrl,
//       'FullName': fullName,
//       'Price': price,
//       'Description': description,
//       'Type': type,
//        // Changed to 'DifferentImageUrl'
//     };
//   }

//   factory CategoryModel.fromSnapshot(
//       DocumentSnapshot<Map<String, dynamic>> document) {
//     if (document.data() != null) {
//       final data = document.data()!;
//       // Map JSON to record to the model
//       return CategoryModel(
//         id: document.id,
//         name: data['Name'] ?? '',
//         imageUrl: data['Image'] ?? '',
//         price: data['Price'] ?? '',
//         description: data['Description'] ?? '',
//         type: data['Type'] ?? '',
//         fullName: data['FullName'] ?? '',
        
//       );
//     } else {
//       return CategoryModel.empty();
//     }
//   }
// }


class CategoryModel{
  String imageUrl,name,price,type,fullName,description;
  Map<String,List<String>> differentImageUrl;
  String buildGuide;

  CategoryModel({
    required this.imageUrl,
    required this.name,
    required this.fullName,
    required this.price,
    required this.type,
    required this.description,
    required this.differentImageUrl,
    required this.buildGuide,

  });
}

List<CategoryModel> categoriesGrid = [
  CategoryModel(
    name:"Nashville",
    fullName: "Nashville armchair",
    imageUrl: "chair_1.png",
    type: "chair",
    price: "\$165.00",
    description: "A contemporary twist on classic mid-century modern design",
    differentImageUrl: {
      "chair_1":["chair_1.png","chair_1_1.png","chair_1_2.png"],
      "chair_0":["chair_0.png","chair_0_1.png","chair_0_2.png"],
      "chair_2":["chair_2.png","chair_2_1.png","chair_2_2.png","chair_2_3.png","chair_2_4.png"],
    },
    buildGuide: '''Unboxing:

Carefully unbox the Nashville Chair and lay out all the parts.
Identify Components:

Identify the main components: seat, backrest, legs, and any additional accessories.
Leg Attachment:

Attach the chair legs to the designated slots on the seat. Ensure they are securely tightened.
Backrest Installation:

Connect the backrest to the seat. Align the attachment points and securely fasten them.
Final Checks:

Double-check all connections to ensure stability.
Confirm that the chair is level on the floor'''
  ),
  CategoryModel(
    name:"Tripod Lamp",
    fullName: "Tripod Lamp",
    imageUrl: "tripod_lamp_1.png",
    type: "tripod_lamp",
    price: "\$1520.00",
    description: "A contemporary twist on classic mid-century modern design",
    differentImageUrl: {
      "tripod_lamp_1":["tripod_lamp_1.png"],
      "tripod_lamp_2":["tripod_lamp_2.png"],
      "tripod_lamp_3":["tripod_lamp_3.png"],
    },
    buildGuide:'''Unboxing:

Unbox the Tripod Lamp and lay out all the components.
Leg Assembly:

Assemble the tripod legs. Ensure they are screwed tightly to form a stable base.
Lamp Fixture Attachment:

Attach the lamp fixture to the top of the tripod legs. Screw it in securely.
Bulb Installation:

Insert the desired light bulb into the lamp fixture.
Power Connection:

Connect the lamp to a power source. Ensure the switch is in the off position before plugging in.
Testing:

Turn on the lamp to test the lighting.'''
  ),
  CategoryModel(
    name:"Floor Lamp",
    fullName: "Floor Lamp",
    imageUrl: "floor_lamp_1.png",
    type: "floor_lamp",
    price: "\$5520.00",
    description: "A contemporary twist on classic mid-century modern design",
    differentImageUrl: {
      "floor_lamp_1":["floor_lamp_1.png"],
      "floor_lamp_2":["floor_lamp_2.png"],
      "floor_lamp_3":["floor_lamp_3.png"],
    },
    buildGuide:'''Unboxing:

Unbox the Floor Lamp and lay out all components.
Pole Assembly:

Assemble the lamp pole by connecting the sections. Tighten each connection securely.
Lamp Shade Attachment:

Attach the lampshade to the top of the pole. Ensure it is centered and securely fastened.
Bulb Installation:

Insert the desired light bulb into the lamp fixture.
Power Connection:

Connect the lamp to a power source. Ensure the switch is in the off position before plugging in.
Testing:

Turn on the lamp to test the lighting.'''
  ),
  CategoryModel(
    name:"Sofa ",
    fullName: "Sofa Set",
    imageUrl: "sofa_1.png",
    type: "sofa",
    price: "\$1250.00",
    description: "A contemporary twist on classic mid-century modern design",
    differentImageUrl: {
      "sofa_1":["sofa_1.png"],
      "sofa_2":["sofa_2.png"],
      "sofa_3":["sofa_3.png"],
      "sofa_4":["sofa_4.png"],
    },
    buildGuide:'''Unboxing:

Unbox the Sofa Set and lay out all components, including individual sofa pieces.
Sofa Configuration:

Arrange the sofa pieces according to the desired configuration (e.g., sectional, L-shaped).
Joining Sections:

Connect the sofa sections using the provided connectors or brackets. Ensure a snug fit.
Cushion Placement:

Place cushions and pillows on the sofa. Arrange them for comfort and aesthetics.
Final Adjustments:

Ensure all sections are securely connected.
Adjust the sofa's position to the desired location in the room.
Comfort Test:

Sit on the sofa to test comfort and stability.'''
  ),
];