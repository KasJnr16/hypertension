// import 'package:unisell/features/personalization/models/user_model.dart';
// import 'package:unisell/features/shop/models/banner/banner_model.dart';
// import 'package:unisell/features/shop/models/category/category_model.dart';
// import 'package:unisell/route/routes.dart';
// import 'package:unisell/utils/constants/image_strings.dart';


// class UniDummyData {
//   //Banners
//   static final List<BannerModel> banners = [
//     BannerModel(
//         imageUrl: UniImages.promoBanner1,
//         targetScreen: UniRoutes.order,
//         active: false),
//     BannerModel(
//         imageUrl: UniImages.promoBanner2,
//         targetScreen: UniRoutes.cart,
//         active: true),
//     BannerModel(
//         imageUrl: UniImages.promoBanner3,
//         targetScreen: UniRoutes.search,
//         active: true),
//     BannerModel(
//         imageUrl: UniImages.promoBanner4,
//         targetScreen: UniRoutes.settings,
//         active: true),
//     BannerModel(
//         imageUrl: UniImages.promoBanner5,
//         targetScreen: UniRoutes.userAddress,
//         active: true),
//     BannerModel(
//         imageUrl: UniImages.promoBanner6,
//         targetScreen: UniRoutes.checkout,
//         active: false),
//   ];

//   //user
//   static final UserModel user = UserModel(
//     id: "123",
//     firstName: "John",
//     lastName: "Doe",
//     username: "johndoe123",
//     email: "johndoe@example.com",
//     phoneNumber: "1234567890",
//     campusName: "Main Campus",
//     profilePicture: "https://example.com/john-profile.jpg",
//     gender: "Male",
//   );

// //   //--cart
//   // static final CartModel cart = CartModel(cartId: "001", items: [
//   //   CartItemModel(
//   //     productId: "001",
//   //     variationId: "1",
//   //     quantity: 1,
//   //     title: products[0].title,
//   //     image: products[0].thumbnail,
//   //     brandName: products[0].brand!.name,
//   //     price: products[0].productVariations![0].price,
//   //     selectedVariation: products[0].productVariations![0].attributeValues,
//   //   ),
//   //   CartItemModel(
//   //     productId: "002",
//   //     variationId: "",
//   //     quantity: 1,
//   //     title: products[1].title,
//   //     image: products[1].thumbnail,
//   //     brandName: products[1].brand!.name,
//   //     price: products[1].productVariations![1].price,
//   //     selectedVariation: products[1].productVariations![1].attributeValues,
//   //   )
//   // ]);

//   static final List<CategoryModel> categories = [
//     //Parents
//     CategoryModel(
//         id: "1",
//         name: "Sports",
//         image: UniImages.catImageSports,
//         isFeatured: true),
//     CategoryModel(
//         id: "2",
//         name: "Clothes",
//         image: UniImages.catImageClothes,
//         isFeatured: true),
//     CategoryModel(
//         id: "3",
//         name: "Electronics",
//         image: UniImages.catImageElectronics,
//         isFeatured: true),
//     CategoryModel(
//         id: "4",
//         name: "Shoes",
//         image: UniImages.catImageSneakers,
//         isFeatured: true),
//     CategoryModel(
//         id: "5",
//         name: "Cosmetics",
//         image: UniImages.catImageCusmatics,
//         isFeatured: true),
//     CategoryModel(
//         id: "6",
//         name: "Jewelry",
//         image: UniImages.catImageJewelry,
//         isFeatured: true),
//     CategoryModel(
//         id: "7",
//         name: "Furniture",
//         image: UniImages.catImageFurniture,
//         isFeatured: true),
//     CategoryModel(
//         id: "8", name: "Toys", image: UniImages.catImageToys, isFeatured: true),

//     //subCategories Sports
//     CategoryModel(
//         id: "21",
//         name: "Sports Shoes",
//         image: UniImages.catImageSports,
//         parentId: "1",
//         isFeatured: false),
//     CategoryModel(
//         id: "22",
//         name: "Sports Equipments",
//         image: UniImages.catImageSports,
//         parentId: "1",
//         isFeatured: false),
//     CategoryModel(
//         id: "23",
//         name: "Track suits",
//         image: UniImages.catImageSports,
//         parentId: "1",
//         isFeatured: false),

//     //furniture
//     CategoryModel(
//         id: "31",
//         name: "Bedroom furniture",
//         image: UniImages.catImageFurniture,
//         parentId: "7",
//         isFeatured: false),
//     CategoryModel(
//         id: "32",
//         name: "Office furniture",
//         image: UniImages.catImageFurniture,
//         parentId: "7",
//         isFeatured: false),
//     CategoryModel(
//         id: "33",
//         name: "Room furniture",
//         image: UniImages.catImageFurniture,
//         parentId: "7",
//         isFeatured: false),

//     //Clothes
//     CategoryModel(
//         id: "41",
//         name: "T shirts",
//         image: UniImages.catImageClothes,
//         parentId: "2",
//         isFeatured: false),
//     CategoryModel(
//         id: "42",
//         name: "Jeans",
//         image: UniImages.catImageClothes,
//         parentId: "2",
//         isFeatured: false),
//     CategoryModel(
//         id: "43",
//         name: "Shorts",
//         image: UniImages.catImageClothes,
//         parentId: "2",
//         isFeatured: false),

//     //electronics
//     CategoryModel(
//         id: "51",
//         parentId: "3",
//         name: "Laptops",
//         image: UniImages.catImageElectronics,
//         isFeatured: false),
//     CategoryModel(
//         id: "52",
//         parentId: "3",
//         name: "Mobile",
//         image: UniImages.catImageElectronics,
//         isFeatured: false),
//   ];
// }
