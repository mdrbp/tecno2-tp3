import fisica.*;

FWorld mundo;

int cantTrampolines = 8;
Trampolines [] trampolines;
Monigotito monigotito;

String estado;

int cantObstaculos = 6;

void setup() {
  size(1200, 800);

  estado = "acomodar";

  Fisica.init(this);

  mundo = new FWorld ();
  mundo.setEdges();
  mundo.setGravity(0, 1000);

  trampolines = new Trampolines [cantTrampolines];


  for (int i=0; i < cantTrampolines; i++) {
    int x = 70 + (i*10);
    int y =  80 - (i*2);
    trampolines [i] = new Trampolines (x, y);
    trampolines[i].actualizar(width/2, height - 200);
    mundo.add(trampolines[i]);
  }

  monigotito = new Monigotito();
  mundo.add(monigotito);

  Meta meta = new Meta (100, 600);
  meta.actualizar(width - 50, 700);
  mundo.add(meta); 

  Meta salida = new Meta (100, 100);
  salida.actualizar(0, 750);
  mundo.add(salida);

  for (int i=0; i < cantObstaculos; i++) {  

    Obstaculo obstaculo = new Obstaculo (60, 60);
    obstaculo.actualizar( random(300, 1000), random(200, 400));

    mundo.add(obstaculo);
  }
}

void draw() {
  background(255);

  if (estado.equals("acomodar")) {

    fill(255 , 0 , 0);
    textSize(30);
    text( "Tiempo:" + frameCount/60, 100, 100);
    
    monigotito.quieto();

    if (frameCount % 900 == 0) {
      estado = "iniciar";
    }
  } else if (estado.equals("iniciar")) {

    for (int i=0; i < cantTrampolines; i++) {
      trampolines [i].fijar();
    }
    
  }

  mundo.step();
  mundo.draw();
  //println(estado);
}

void contactPersisted(FContact contacto) {
  FBody cuerpo1 = contacto.getBody1();
  FBody cuerpo2 = contacto.getBody2();

  String nombre1 = conseguirNombre(cuerpo1);
  String nombre2 = conseguirNombre(cuerpo2);

  if (estado.equals("iniciar")) {
    if (nombre1 == "Monigotito" && nombre2 == "Meta") {
      monigotito.mover();
    }
    if (nombre2 == "Monigotito" && nombre1 == "Meta") {
      monigotito.mover();
    }
    if (nombre1 == "Monigotito" && nombre2 == "Trampolin") {
      monigotito.saltar();
    }
    if (nombre2 == "Monigotito" && nombre1 == "Trampolin") {
      monigotito.saltar();
    }
  }
}
