#include <iostream>
#include <string>

// Product Interface
// Abstract class
class Shape {  
public:
   virtual void draw() = 0; 
};

// Concrete Products
class Circle : public Shape {
public:
   void draw() override {
      std::cout << "Drawing Circle" << std::endl;
   }
};

class Square : public Shape {
public:
   void draw() override {
      std::cout << "Drawing Square" << std::endl;
   }
};

// Creator
class ShapeFactory {
public:
   virtual Shape* createShape(std::string type) {
      if (type == "Circle") return new Circle();
      if (type == "Square") return new Square();
      return nullptr;
   }
};

// Usage
int main() {
   ShapeFactory factory;
   Shape* shape1 = factory.createShape("Circle");
   Shape* shape2 = factory.createShape("Square");

   shape1->draw();
   shape2->draw();

   delete shape1;
   delete shape2;
   return 0;
}

/* Notes
 * Intent: The Factory Method pattern defines an interface for creating an object,
 * but lets subclasses alter the type of objects that will be created.
 * Scenario: Imagine you are designing a framework for a graphics drawing application.
 * This framework should be able to create different types of graphic objects, such as
 * circles, squares, and triangles. However, the exact types of objects and their properties
 * (like color, size, etc.) might not be known until runtime.
 *
 *  Structure:
 *  Product: This is an interface for the objects the factory method will create.
 *  Concrete Product: These are the actual implementations of the Product interface.
 *  Creator: This is an abstract class that declares the factory method, which returns
 *  an object of type Product. It may also define default implementations of the factory method.
 *  Concrete Creator: These are concrete classes that implement the factory method to create and
 *  return a particular Concrete Product.
 */