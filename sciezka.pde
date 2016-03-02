class rozwoj {//bedzie sie rozwijac jak drzewko

  //zmienne
  ArrayList <ksztalt> ksztalty; 
  ArrayList <PVector> sciezka;

  //konstruktory
  rozwoj(ksztalt PierwotnyKsztalt, PVector sciezkaStart) {
    ksztalty=new ArrayList<ksztalt>(); 
    ksztalty.add(PierwotnyKsztalt); 
    sciezka= new ArrayList <PVector>(); 
    sciezka.add(sciezkaStart);
  }
  //rozwoj(ArrayList <ksztalt> lista, PVector sciezkaStart){

  //funkcje
  //rysuj
  //generuj nowe pokolenie
  void poczatek(PVector a) {
    sciezka.set(0, a);
  }
  void dodajPunkt(PVector a) { 
    sciezka.add(a);
  }
  ksztalt przemieszczenie( ksztalt a, PVector Wsp1) {//Wspolczynnik zmianyy =wsp1 wsp2=wsp kierunku do dodania
    ksztalt b= new ksztalt ();
    b.srodek.add(Wsp1); 
    b.wprowadzPunkty(a.koo);
    for (int i=0; i<b.koo.size(); i++) {
      b.koo.get(i).y+=Wsp1.y;
      b.koo.get(i).x+=Wsp1.x;
    }
    return b;
  }
}