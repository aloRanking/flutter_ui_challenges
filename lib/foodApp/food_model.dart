class Foood{

  final String id;
  final String imageLink;
  final String foodName;
  final String foodPrice;
  final List<String> smallImages;


 const Foood({this.id,this.imageLink, this.foodName, this.foodPrice, this.smallImages});


}

List<Foood> vegFoods = [

 const Foood(
    id: '1',
    imageLink: 'https://www.vegetariantimes.com/.image/t_share/MTQ3MDM3MzQ5NjA2MzM2NDA3/zi3000-shutterstock-buddha-bowl.jpg',
    foodName: 'Vegetarian Dinner 1',
    foodPrice: '\$0.60',
   smallImages: [
     'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
     'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
     'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
     'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
     'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',


   ]
  ),
  const Foood(
    id: '2',
    imageLink: 'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
    foodName: 'Vegetarian Dinner 2',
    foodPrice: '\$0.60',
      smallImages: [
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',


      ]
  ),

  const Foood(
    id: '3',
    imageLink: 'https://static.toiimg.com/photo/54327253/.jpg',
    foodName: 'Vegetarian Dinner 3',
    foodPrice: '\$02.0',
      smallImages: [
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',


      ]
  ),

  const Foood(
    id: '4',
    imageLink: 'https://images.immediate.co.uk/production/volatile/sites/2/2016/08/25471.jpg?quality=90&resize=620,413',
    foodName: 'Vegetarian Dinner 4',
    foodPrice: '\$1.0',
      smallImages: [
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',


      ]
  ),


];

List<Foood> nonVegFoods = [

  const Foood(
      id: '1',
      imageLink: 'https://www.9jafoodie.com/wp-content/uploads/2015/07/oil-less-oil-free-efo-riro-Nigerian-soup-600x449.jpg',
      foodName: 'Efo Riro Plus Ponmo',
      foodPrice: '\$1.0',
      smallImages: [
        'https://cdn1.everyevery.ng/wp-content/uploads/2019/04/08092942/IMG-20190408-WA0008.jpg',
        'https://sisijemimah.com/wp-content/uploads/2016/11/kale-efo-riro-9.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTTnNNpKCOV37N2lzOP-UXrBvRAlacTzHjrCe8yLbldirXlka3A&usqp=CAU',
        'https://sisijemimah.com/wp-content/uploads/2016/11/kale-efo-riro-9.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTTnNNpKCOV37N2lzOP-UXrBvRAlacTzHjrCe8yLbldirXlka3A&usqp=CAU',


      ]
  ),

  const Foood(
      id: '2',
      imageLink: 'https://i.ndtvimg.com/i/2016-11/biryani-620_620x350_41478678907.jpg',
      foodName: ' Malabar Fish Biryani',
      foodPrice: '\$0.60',
      smallImages: [
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',


      ]
  ),
  const Foood(
      id: '3',
      imageLink: 'https://1.bp.blogspot.com/-FeYloA-jXkc/WfXR1dVr15I/AAAAAAAALz4/qbovx-MYz_gXUEiJCs8jME6B3mjYwpucgCLcBGAs/s1600/buter-chicken-by-traveler-food-in-train.jpg',
      foodName: 'Lahori Chicken Curry',
      foodPrice: '\$0.60',
      smallImages: [
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',


      ]
  ),

  const Foood(
      id: '4',
      imageLink: 'https://www.archanaskitchen.com/images/archanaskitchen/1-Author/jyothir/Kerala_Mutton_Pepper_Fry.jpg',
      foodName: 'Mutton Pepper Fry',
      foodPrice: '\$02.0',
      smallImages: [
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',
        'https://assets3.thrillist.com/v1/image/2856117/size/gn-gift_guide_variable_c.jpg',


      ]
  ),




];

