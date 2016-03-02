//Michał Ogorzałek Marianna Siembiot
//import geomerative.*;
import java.util.*;
import java.io.*;

float par1;

void setup() {
  size(500, 700);
}

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

void draw() { 
  background(255);
  par1 = mouseX/(float)width;  
  ArrayList<PVector> lista = null;
  try { 
    lista = loadCoords();
  } catch(IOException ex) {
    ex.printStackTrace(); 
  }
  //a1 = new PVector ( 20, 80);
  //b1 = new PVector ( 80, 20);
  //c1 = new PVector ( 80, 80);

  //return result;}
  //catch (IOException e){return null;}
  //lista.add(a1);
  //lista.add(b1);
  //lista.add(c1);
  
  ksztalt D = new ksztalt (lista, new PVector(50, 50));
  //D.zmienWielkosc(1);
  //D.przesun(new PVector(0, 0));
  D.rysuj();

  if(true) return;
  // ArrayList <PVector> lista2=new ArrayList();
  //try{lista2=loadCoords(); }
  // catch(IOException e){println ("dupacycki"); } 

  //ksztalt D = new ksztalt();

  for (int i=0; i <20; i++) {
    ksztalt tmp = new ksztalt(); 
    tmp.kopiuj(D);
    ksztalt C = new ksztalt();
    D.obroc(-PI/5);
    D.zmienWielkosc(1.1);
    D.przesun(new PVector(i, i*i/5) );
    C=posKszt(tmp, D, par1);

    for (int n=0; n<i; n++) {
      ksztalt tmp2= new ksztalt();
      tmp2.kopiuj(D);
      ksztalt C2 = new ksztalt();
      tmp2.obroc(-PI/2*n);
      tmp2.zmienWielkosc(0.9);
      PVector t=new PVector(-10*n, sin(i/5)*(n+10));
      tmp2.przesun(t);
      C2=posKszt(tmp, tmp2, par1); 
      C2.rysuj();
    }
    C.rysuj();
  }
  /* for (int i=0; i <20; i++) {
   ksztalt tmp= new ksztalt();   
   tmp.kopiuj(D);
   ksztalt C = new ksztalt();
   D.obroc(-PI/5);
   D.zmienWielkosc(1.1);
   //D=przemieszczenie(D, new PVector (D.srodek.x+10,D.srodek.y+10 ));
   D.przesun(new PVector(cos(i/1.1)*i*3,sin(i/14)*i*4) );
   //D.przesun(new PVector(i*2,i*2) ); 
   C=posKszt(tmp, D, par1);   
   // tmp.rysuj();
   C.rysuj();  
   // D.rysuj();
   //println(D.srodek.x+" "+D.srodek.y);
   }
   }*/
}
//funkcje
ksztalt posKszt(ksztalt a, ksztalt b, float par) {
  ksztalt c = new ksztalt();
  ArrayList <PVector> temp= new ArrayList <PVector>(); 
  for (int i=0; i< a.koo.size(); i++)//może wywalić jesli rozmiary beda sie zmieniac
  {
    PVector tmp ; 
    tmp= PVector.lerp(a.koo.get(i), b.koo.get(i), par ); 
    // println("lerp="+lerp((float)a.koo.get(i).x, (float)b.koo.get(i).x, par)+"a="+a.koo.get(i)+"b="+b.koo.get(i));
    temp.add( tmp);
  }  
  c.srodek.x=lerp(a.srodek.x, b.srodek.x, par);
  c.srodek.y=lerp(a.srodek.y, b.srodek.y, par);
  c.koo=temp; 
  return c;
}
void line(PVector  a, PVector b) { 
  line(a.x, a.y, b.x, b.y);
}
/*ksztalt przemieszczenie( ksztalt a, PVector Wsp1) {//Wspolczynnik zmianyy =wsp1 wsp2=wsp kierunku do dodania
 ksztalt b= new ksztalt ();
 b.srodek.add(Wsp1); 
 b.wprowadzPunkty(a.koo);
 for (int i=0; i<b.koo.size(); i++) {
 b.koo.get(i).y+=Wsp1.y;
 b.koo.get(i).x+=Wsp1.x;
 }
 return b;
 }*/


void kooWyj(ArrayList <PVector> wsp)
{
  //funkcja wypisuje koordynaty do pliku txt albo do konsoli
  //do istniejącego pliku i nie nadpisywac
}

// funkcja print screen 
//nagrywanie filmiku 