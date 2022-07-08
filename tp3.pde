// Nicolas Marchena // Tecno Multimeadia 1 // TP 3 

https://youtu.be/siFmiHncuNI


int filas = 40;
int columnas = 40;
int bs = 20;

ArrayList<Integer> posX = new ArrayList<Integer>();
ArrayList<Integer> posY = new ArrayList<Integer>();

int dir = 1;
int[] dx = {0, 0, -1, 1};
int[] dy = {-1, 1, 0, 0};

int appleX;
int appleY;

boolean gameOver = false;

void setup(){
  size(800,800);
  posX.add(10);
  posY.add (10);
  frameRate(10);
  appleX = (int)random(0,40);
  appleY = (int)random(0,40); 
}

void draw(){
  background (45);
  if (gameOver == true){
    fill(155);
    textSize(30);
    text("Presiona Espacio para Comenzar", 125, height/2);
    appleX = -1;
    appleY = -1;
    posX.clear();
    posY.clear();
    posX.add(-10);
    posY.add(-10);
    fill(155);
    textSize(30);
    text("PERDISTE", 300, height/4);
    fill(155);
    textSize(30);
    text("A Derecha, D Izquierda, S Abajo, W Arriba", 75, height/3);
  }else{
    stroke(50);
    for(int i = 0; i < filas; i++){
      line(0, i*bs, width, i* bs);
    }
    for(int j = 0; j < columnas; j++){
  }
 }
 mover();
 eat();
 detectarBordes();
 detectarSnake();
 drawApple();
 drawSnake();
}

void detectarBordes(){
  if((posX.get(0) < 0) || (posX.get(0) > columnas -1) || (posY.get(0) < 0) || (posY.get(0) > filas -1)){
  gameOver = true;
 }  
}

void detectarSnake(){
 for(int i = 2; i < posX.size(); i++){
   for(int j = 2; j < posY.size(); j++){
     if((posX.get(0) == posX.get(i)) && (posY.get(0) == posY.get(i))){
       
}
   
   
   
}
     
 }

}


void mover(){
  posX.add(0, posX.get(0)+dx[dir]);
  posY.add(0, posY.get(0)+dy[dir]);
  posX.remove(posX.size()-1);
  posY.remove(posY.size()-1);


}


void drawSnake (){
  fill(40, 50, 230);
  for(int i = 0; i < posX.size(); i++){
    rect(posX.get(i)*bs, posY.get(i)*bs, bs, bs);  
  }

}

void eat(){
  if((posX.get(0) == appleX) && (posY.get(0) == appleY)){
    appleX = (int)random(0, 40);
    appleY = (int)random(0, 40);
    posX.add(posX.get(posX.size()-1));
    posY.add(posY.get(posY.size()-1));
  }


}

void drawApple(){
  fill(215, 0, 75);
  rect(appleX * bs, appleY * bs, bs, bs);
}

void restart(){
  gameOver = false;
  posX.clear();
  posY.clear();
  posX.add(10);
  posY.add(10);
  appleX = (int) random(0,40);
  appleY = (int) random(0,40);
  
}

void keyPressed(){
  if(key == 'w' || keyCode == UP) dir = 0;
  if(key == 's' || keyCode == DOWN) dir = 1;
  if(key == 'a' || keyCode == LEFT) dir = 2;
  if(key == 'd' || keyCode == RIGHT) dir = 3;
  if(key == ' ')
  restart();
}
