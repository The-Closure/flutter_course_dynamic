
main()  {


 // ?  create from child to parent
  // Shape cube = Cube(width: 20, heigth: 20);
// ? create from parent to child //
// ! Error
  // Cube shape = Shape(width: 20, heigth: 20);


  // Shape cube = Shape(width: 12, heigth: 20);
  // cube.calcuateShape();

  // Cube cube1 = Cube(dimension: 20);
  // cube1.calculate();
  int firstInput =20;
  int secondInput = 30;
  // if(firstInput == secondInput){
  //   Cube cube = Cube(width: firstInput, heigth: secondInput);
  //   cube.calcuateShape();
  //   print(cube);
  // }
  // else {
  //   Shape shape = Shape(width: firstInput, heigth : secondInput);
    
  //   Shape shape1 = Shape(width: firstInput, heigth : secondInput);
  //   shape.calcuateShape();
  //   print(shape==shape1);
  // }
// _Cube _cube = _Cube(30);

// Shape shape =Shape(heigth: 20,width: 30);
// shape.heigth = 50;
//   draw(shape);
//   // draw(cube);
// }

Shape shape = Shape(width: 20, heigth: 40);
shape.sayHello();
}
abstract class Lines with Drawing{

helperMehod();
}

class Shape  extends Lines with Drawing{
  // attribute
  int width;
  int heigth;
 

  Shape({required this.width, required this.heigth});

  // mehtod
  calcuateShape() {
    print(this.heigth * this.width);
  }
  
  @override
  helperMehod() {
   print("I am a helper for shape");
  }
}

class Cube {
int _dimension;
  Cube(this._dimension);
  
//  Cube cube1 = Cube(20);
//  static instance() =>{cube1};
  @override
  helperMehod() {
    print("I am a helper for cube");
  }
}




extension FancyNum on Cube {
  num plus(Cube other) => this;

  num times(Cube other) => this * other;
}

mixin Drawing {


  draw(){
    print("I am drawing");
  }

  sayHello(){
    print("hello");
  }
}