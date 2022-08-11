class Obstaculo extends FBox {
  Obstaculo (int x_, int y_) {
    super (x_, y_);
  } 

  void actualizar (float x_, float y_) {
    setPosition(x_, y_);
    setFill(255); 
    setName("obstaculo");
    setStatic (true);
  }
}
