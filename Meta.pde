class Meta extends FBox {

  Meta (float x_, float y_) {
    super(x_, y_);
  }

  void actualizar(float x_, float y_) {
    setPosition(x_, y_);
    setStatic(true);
    setFill(150); 
    setName("Meta");
    setGrabbable(false);
  }
}
