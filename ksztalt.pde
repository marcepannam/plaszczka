class ksztalt {
  private ArrayList <PVector> koo=new ArrayList <PVector> (); 
  private PVector srodek=new PVector(); 
  //nachylenie??
  ksztalt() {
  } 
  ksztalt (ArrayList <PVector> a, PVector sr) {
    srodek=new PVector(); 
    srodek= sr.copy();
    for (PVector s : a) {
      koo.add(s);
    }
  }
  /* ksztalt(ArrayList <PVector> a) {
   srodek= new PVector (0, 0);
   for (int i=0; i<a.size(); i++) {
   PVector s = new PVector();
   s.x=a.get(i).x;
   s.y=a.get(i).y;
   koo.add(s);
   }
   }*/
  void wprowadzPunkty(ArrayList <PVector> a) {
    for (int i=0; i<a.size(); i++) {
      PVector s = new PVector();
      s.x=a.get(i).x;
      s.y=a.get(i).y;
      koo.add(s);
    }
  } 
  void kopiuj(ksztalt a) {
    srodek=new PVector(); 
    srodek= a.srodek.copy();
    for (int i=0; i<a.koo.size(); i++) {
      PVector s = new PVector();
      s.x=a.koo.get(i).x;
      s.y=a.koo.get(i).y;
      koo.add(s);
    }
  } 
  void rysuj() {
    for (int i=0; i<koo.size(); i++) {
      if (i!=0 ) line(koo.get(i).x, koo.get(i).y, koo.get(i-1).x, koo.get(i-1).y);
      else  line(koo.get(0).x, koo.get(0).y, koo.get(koo.size()-1).x, koo.get(koo.size()-1).y);
    }
  }
  void rysuj2() {
    for (int i=0; i<koo.size(); i++) {
      if (i!=0 ) line(koo.get(i).x, koo.get(i).y, koo.get(i-1).x, koo.get(i-1).y);
    }
  }
  void zmienWielkosc(float Wsp) {    
    for (int i=0; i<koo.size(); i++) {
      PVector tmp= new PVector(); 
      tmp=PVector.sub(koo.get(i), srodek);
      tmp.mult(Wsp);
      tmp=PVector.add(tmp, srodek);
      koo.get(i).y=tmp.y;
      koo.get(i).x=tmp.x;
    }
  }
  void obroc (float rad) {
    for (int i=0; i<koo.size(); i++) {
      PVector tmp= new PVector(); 
      tmp=PVector.sub(koo.get(i), srodek);
      float tmpx=tmp.x;
      float tmpy=tmp.y;
      tmp.x= tmpx * cos(rad) - tmpy * sin(rad);
      tmp.y= tmpx * sin(rad) + tmpy * cos(rad);
      tmp=PVector.add(tmp, srodek);
      koo.get(i).y=tmp.y;
      koo.get(i).x=tmp.x;
    }
  }
  void przesun( PVector Wsp1) {
    srodek.add(Wsp1); 
    for (int i=0; i<koo.size(); i++) {
      koo.get(i).y+=Wsp1.y;
      koo.get(i).x+=Wsp1.x;
    }
  }
}