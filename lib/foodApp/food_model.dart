class Food{

  final String id;
  final String imageLink;
  final String foodName;
  final String foodPrice;
  final List<String> smallImages;


 const Food({this.id,this.imageLink, this.foodName, this.foodPrice, this.smallImages});


}

List<Food> vegFoods = [

 const Food(
    id: '1',
    imageLink: 'images/veg1.jpg',
    foodName: 'Vegetarian Dinner 1',
    foodPrice: '\$0.60',
   smallImages: [
     'images/veg3.jpeg', 'images/veg3.jpeg', 'images/veg3.jpeg'
   ]
  ),
  const Food(
    id: '2',
    imageLink: 'images/veg2.jpg',
    foodName: 'Vegetarian Dinner 2',
    foodPrice: '\$0.60',
      smallImages: [
        'images/veg3.jpeg', 'images/veg3.jpeg', 'images/veg3.jpeg'

      ]
  ),

  const Food(
    id: '3',
    imageLink: 'images/veg3.jpeg',
    foodName: 'Vegetarian Dinner 3',
    foodPrice: '\$02.0',
      smallImages: [
        'images/veg3.jpeg','images/veg3.jpeg','images/veg3.jpeg'
      ]
  ),

  const Food(
    id: '4',
    imageLink: 'images/veg4.jpg',
    foodName: 'Vegetarian Dinner 4',
    foodPrice: '\$1.0',
      smallImages: [
        'images/veg3.jpeg','images/veg3.jpeg','images/veg3.jpeg'
      ]
  ),


];

List<Food> nonVegFoods = [

  const Food(
      id: '1',
      imageLink: 'images/nonveg1.jpg',
      foodName: 'Efo Riro Plus Ponmo',
      foodPrice: '\$1.0',
      smallImages: [
        'images/nonveg2.jpg', 'images/nonveg3.jpg', 'images/nonveg4.jpg'

      ]
  ),

  const Food(
      id: '2',
      imageLink: 'images/nonveg2.jpg',
      foodName: ' Malabar Fish Biryani',
      foodPrice: '\$0.60',
      smallImages: [
        'images/nonveg1.jpg', 'images/nonveg1.jpg', 'images/nonveg1.jpg'

      ]
  ),
  const Food(
      id: '3',
      imageLink: 'images/nonveg3.jpg',
      foodName: 'Lahori Chicken Curry',
      foodPrice: '\$0.60',
      smallImages: [
        'images/nonveg1.jpg', 'images/nonveg1.jpg', 'images/nonveg1.jpg'

      ]
  ),

  const Food(
      id: '4',
      imageLink: 'images/nonveg4.jpg',
      foodName: 'Mutton Pepper Fry',
      foodPrice: '\$02.0',
      smallImages: [
        'images/nonveg1.jpg', 'images/nonveg1.jpg', 'images/nonveg1.jpg',

      ]
  ),




];

