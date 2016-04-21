//Michał Ogorzałek Marianna Siembiot
//import geomerative.*;
import java.util.*;
import java.io.*;

void keyPressed() {
  if (key == ' ');
  if (key == 's') saveFrame ("output/framie####.png");
}

float par1;

void setup() {
  size(500, 700);
}
// import  koordynatów

ArrayList<PVector> loadCoords() throws IOException { 
  BufferedReader b = new BufferedReader(new InputStreamReader(new FileInputStream(sketchPath("plik.txt"))));
  ArrayList<PVector> result = new ArrayList<PVector>();
  final float S = 1000f; 
  while (true) {
    String line = b.readLine();
    if (line == null) break;
    String[] arr = line.split(",");
    if (arr.length != 2) continue;
    float x = Float.parseFloat(arr[0]);
    float y = Float.parseFloat(arr[1]);
    result.add(new PVector(x * S, y * S));
  }
  b.close();

  return result;
}

//

void draw() { 
  background(255);
  par1 = mouseX/(float)width;  
  ArrayList<PVector> lista = null; // deklaracja zmiennej
  try { 
    lista = loadCoords();
  } 
  catch(IOException ex) {
    throw new RuntimeException(ex);
  }


  float size;
  size = 1.05;
  Random r = new Random(13);
  int delta = 0;
  for (int i=0; i < 27; i ++) { // int i=0; while ( i < 20 ) { ....; i ++ } 
    for (int j=0; j <= i*(i); j ++) {
      ksztalt p;
      p = new ksztalt (lista);
      p.zmienWielkosc(size);
      if (i != 0)
        p.obroc ((r.nextInt(50) - 30) /30.0 * 3.1415926);
      else// MIAU!!! MIAU!!!
      {
       p.zmienWielkosc(size);
        p.obroc (-1/1.5 * 3.141592653585);
      }
      p.przesun(new PVector(-155, -290));
      p.przesun(new PVector(i * -12, 0));
      p.przesun(new PVector(j * 70 * size, delta));
      p.przesun(new PVector(r.nextInt(10), r.nextInt(10)+20));
      p.rysuj2();
    }
    size *= 0.909;
    delta += size * 80;
  }
}

void line(PVector  a, PVector b) { 
  line(a.x, a.y, b.x, b.y);
}