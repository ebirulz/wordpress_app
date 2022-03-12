class WpConfig {


  // YOUR WEBISTE URL
  static const String websiteUrl = "https://byapp.o3interactive.ng/";
  static const String bayelsaUrl = "https://bayelsastate.gov.ng/";
  static const String developerUrl = "https://o3interactive.ng/";

  // CREDENTIALS
  static const String websiteAdminName = 'admin';
  static const String websiteAdminPassword = 'pass';
  

  //FEATURE TAG ID
  static const int featuredTagID = 6;

  //VIDEO TAG ID
  static const int videoTagId = 24;


  

  // Hometab 4 categories
  // -- 'Serial Number' : [Category Id, 'Category Name'] -- Length should be 4.
  static const Map selectedCategories = {
    '1': [2, "Press Release"],
    '2': [3, "Public Notice"],
    '3': [4, "Video Feeds"],
    '4': [5, "Audio Broadcast"],
  };


  /*
  List of blocked categories. Do nothing if you don't want to block any categories.
  If you want to bloc any category and it's posts then enter values like these:

  Example: If you want to block category id 10 & 12, then it will be look like this:

    static const String blockedCategoryIds = "10,12";
    static const String blockedCategoryIdsforPopularPosts = "-10,-12";

  */

  static const String blockedCategoryIds = "34";
  static const String blockedCategoryIdsforPopularPosts = "";


  

  // FEATURE IMGAE -  IF YOUR POSTS DON"T HAVE A FEATURE IMAGE
  static const String randomPostFeatureImage = "https://byapp.o3interactive.ng/wp-content/uploads/2022/02/PR_Banner-1.jpg";

  // FEATURE CATEGORY IMGAE -  IF YOU HAVEN'T DEFINE A COVER IMAGE FOR A CATEGORY IN THE LIST BELOW
  static const String randomCategoryThumbnail = "https://byapp.o3interactive.ng/wp-content/uploads/2022/02/PR_Banner-1.jpg";


  // ENTER CATERGORY ID AND ITS COVERS IMAGE 
  static const Map categoryThumbnails = {
    // categoryID : 'category thumbnail url'
    2 : "https://byapp.o3interactive.ng/category/PressRelease.png",
    3 : "https://byapp.o3interactive.ng/category/PublicNotice.png",
    4 : "https://byapp.o3interactive.ng/category/VideoFeeds.png",
    1 : "https://byapp.o3interactive.ng/category/NewsandEvents.png",
    5 : "https://byapp.o3interactive.ng/category/AudioBroadcast.png",
    15 : "https://byapp.o3interactive.ng/category/TheProsperityGovernment.png",
    8 : "https://byapp.o3interactive.ng/category/BayelsaStateAnOverview.png",
    14 : "https://byapp.o3interactive.ng/category/The2022Budget.png",
    19 : "https://byapp.o3interactive.ng/category/MDA.png",
    20 : "https://byapp.o3interactive.ng/category/StateProjects.png",
    21 : "https://byapp.o3interactive.ng/category/GovernmentServices.png",
  };

  static const Map categoryImages = {
    // categoryID : 'category thumbnail url'
    31 : "assets/categories/PressRelease.png",
    32 : "assets/categories/PublicNotice.png",
    33 : "assets/categories/VideoFeeds.png",
    1 : "assets/categories/NewsandEvents.png",
    34 : "assets/categories/AudioBroadcast.png",
    27: "assets/categories/TheProsperityGovernment.png",
    25 : "assets/categories/BayelsaStateAnOverview.png",
    26 : "assets/categories/AnnualBudget.png",
    28 : "assets/categories/MDA.png",
    29 : "assets/categories/StateProjects.png",
    30 : "assets/categories/GovernmentServices.png",
    7 : "assets/categories/TheProsperityPost.png",
    39 : "assets/categories/OurPartners.png",
    35 : "assets/categories/RadioStream.png",
    40 : "assets/categories/ContactUs.png",
  };
}


