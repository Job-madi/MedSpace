import 'package:medspace/models/categorie_model.dart';

List<CategorieModel> getCategories() {
  List<CategorieModel> myCategories = List<CategorieModel>();
  CategorieModel categorieModel;

  //1
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Health";
  categorieModel.imageAssetUrl =
      "https://codeworkshop.dev/static/350e6cb1b81f18a6053b50450249a7da/8ec0a/ibiza_sunset.jpg";
  myCategories.add(categorieModel);

  //2
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Entertainment";
  categorieModel.imageAssetUrl =
      "https://codeworkshop.dev/static/350e6cb1b81f18a6053b50450249a7da/8ec0a/ibiza_sunset.jpg";
  myCategories.add(categorieModel);

  //3
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "General";
  categorieModel.imageAssetUrl =
      "https://codeworkshop.dev/static/350e6cb1b81f18a6053b50450249a7da/8ec0a/ibiza_sunset.jpg";
  myCategories.add(categorieModel);

  //4
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Business";
  categorieModel.imageAssetUrl =
      "https://codeworkshop.dev/static/350e6cb1b81f18a6053b50450249a7da/8ec0a/ibiza_sunset.jpg";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Science";
  categorieModel.imageAssetUrl =
      "https://codeworkshop.dev/static/350e6cb1b81f18a6053b50450249a7da/8ec0a/ibiza_sunset.jpg";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Sports";
  categorieModel.imageAssetUrl =
      "https://codeworkshop.dev/static/350e6cb1b81f18a6053b50450249a7da/8ec0a/ibiza_sunset.jpg";
  myCategories.add(categorieModel);

  //5
  categorieModel = new CategorieModel();
  categorieModel.categorieName = "Technology";
  categorieModel.imageAssetUrl =
      "https://codeworkshop.dev/static/350e6cb1b81f18a6053b50450249a7da/8ec0a/ibiza_sunset.jpg";
  myCategories.add(categorieModel);

  return myCategories;
}
