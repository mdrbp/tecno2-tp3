
class Trampolines extends FBox {
  
  Trampolines (int x_, int y_){
    super (x_ , y_);
  }
  
  void actualizar (float x_ , float y_){
   setPosition(x_ , y_);
   setFill(0); 
   setName("Trampolin");
   setDensity(1000);
   setRestitution(0);
  }
  
  void fijar(){
   setStatic(true); 
   setGrabbable(false);
  }
  
  
  
}
