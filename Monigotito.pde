//clase que va a definir al personaje

class Monigotito extends FBox {

  Monigotito() {
    super (15, 30);
    setPosition(15, 650);
    setName("Monigotito");
    setDamping(0);
    setFill(250 , 170 , 8);
    setNoStroke();
    setRestitution(0);
    setGrabbable(false);
    setFriction(0);
    setRotatable(false);
  }

  void mover() {
    setVelocity(90, 0);
  }

  void saltar() {
    setVelocity(250, -800);
  }

  void quieto() {
    setVelocity(0, 0);
  }
}
