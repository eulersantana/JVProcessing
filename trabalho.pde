
// variaveis
int matrix[][] = new int[3][3];
int moves;
int valor = 0;
int quantidadeX,quantidadeB;
int jogador;
String cor;
char simbol;
PGraphics pg;
boolean figura = true;
PImage bola, x;
int quantidade = 0;
int alturaArea ;
int larguraArea ;

void setup() {
  size(800,600);
  noLoop();
  bola = loadImage("bola.png");
  bola.resize(110,110);    
  x = loadImage("x.png"); 
  x.resize(100,130);
  rectMode(RADIUS);
  quantidadeX = 5;
  quantidadeB = 4;
  tabuleiro();
  alturaArea = width/3; 
  larguraArea = height/3;
}

// cria tabuleiro
void tabuleiro() {
  // cor de fundo BRANCO
  background(255);  
  // tamanho do texto
  textSize(200);
  // Largura de linha
  strokeWeight(5);
  // Cor da linha
  stroke(0);
  //linha 1
  line(250, 10, 250, 590);
  //linha 2
  line(550, 10, 550, 590);
  //linha 3
  line(10, 200, 790, 200);
  //linha 4
  line(10, 400, 790, 400);
}

// inicializa o jogo
void initGame() {
  int count = 0;
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix.length; j++) {
    matrix[i][j] = count;
    }
  }
  
  // inicializa informações do jogo
  moves   = 0;
  jogador = 0;
  cor     = "#ffffff";
  simbol  = 'X';
}

// jogada
int jogada() {
    // verifica se a jogada é do jogador 1
    if (jogador == 1) {
      // o proximo sera o jogador 2
      jogador = 2;
      // a cor do simbolo do jogador 1
      cor     = "#000000";
      // o simbolod o jogador 1
      simbol  = 'X';
    } else {
      // o proximo sera o jogador 1
      jogador = 1;
      // a cor do simbolo do jogador 2
      cor     = "#0000ff";
      // o simbolod o jogador 3
      simbol  = 'O';
  }

  return jogador;
}

// verifica o ganhador
void ganhador() {
  // verifica em linha
  if (matrix[0][0] == matrix[0][1] && matrix[0][1] == matrix[0][2]) {
    endGame();
  } else if (matrix[1][0] == matrix[1][1] && matrix[1][1] == matrix[1][2]) {
    endGame();
  } else if (matrix[2][0] == matrix[2][1] && matrix[2][1] == matrix[2][2]) {
    endGame();
  }

  // verifica em coluna
  else if (matrix[0][0] == matrix[1][0] && matrix[1][0] == matrix[2][0]) {
    endGame();
  } else if (matrix[0][1] == matrix[1][1] && matrix[1][1] == matrix[2][1]) {
    endGame();
  } else if (matrix[0][2] == matrix[1][2] && matrix[1][2] == matrix[2][2]) {
    endGame();
  }

  // verifica em diagonal
  else if (matrix[0][0] == matrix[1][1] && matrix[1][1] == matrix[2][2]) {
    endGame();
  } else if (matrix[2][0] == matrix[1][1] && matrix[1][1] == matrix[0][2]) {
    endGame();
  }
}

// finaliza o jogo
private void endGame() {
  background(0);
  fill(255);
  textSize(30);
  String winner;
  
  // verifica qual foi o vencedor
  if (jogador == 1) {
    winner = "Player 1";
  } else {
    winner = "Player 2";
  }
  text(winner + " Ganhou!", width / 2 - 150, height / 2);
}

void mouseClicked() {
  if (mousePressed) {
    if(valor == 0 && figura == true){
      if(quantidadeX > 0)  
         desenhaX();
      area();   
      quantidadeX--;   
      valor = 10;
      figura = false;
    }else{
      if(valor == 10 && figura == false){
        if(quantidadeB > 0)
          desenhaBola();
        area();  
        quantidadeB--;  
        figura = true;
        valor = 0;
      }    
    } 
  }
  if((quantidadeB < 0) && (quantidadeX < 0)){
    tabuleiro();
    quantidadeX = 5;
    quantidadeB = 4;
  }
  
}

// caso o jogo termine empatado torna a desenhar o tabuleiro
private void drawGame() {
  // fundo preto
  background(0);
  // cor do preenchimento do texto
  fill(255);
  // tamanho do texto
  textSize(30);
  // exibe mensagem centralizada
  text("Jogo Empatado!", width / 2 - 150, height / 2);
}

void desenhaX(){
  imageMode(CENTER);
   image(bola, mouseX, mouseY);
}

void desenhaBola(){
  imageMode(CENTER);
   image(x, mouseX, mouseY); 
}

void area(){
  //Area 1
  if(mouseX <= larguraArea && mouseY <= alturaArea){
      println("Area -> 1");
    }
  //Area 2
   if(((mouseX > larguraArea) && (mouseX < (2*larguraArea))) && (mouseY <= alturaArea)){
      println("Area -> 2");
   }
   //Area 3
   if(((mouseX > (2*larguraArea)) && (mouseY <= alturaArea))){
      println("Area -> 3");
   }
  //Area 4
  if((mouseX <= larguraArea) && (mouseY <= (2*alturaArea) && mouseY > alturaArea)){
      println("Area -> 4");
    }
  //Area 5
   if(((mouseX > larguraArea) && (mouseX <= (2*larguraArea)) && ((mouseY > alturaArea) && (mouseY <= 2*alturaArea)))){
      println("Area -> 5");
   }
   //Area 6
   if(((mouseX > (2*larguraArea)) && (mouseY > (2*alturaArea)))){
      println("Area -> 6");
   }    
}

void draw() {
    println("Largura: "+larguraArea);
    println("Altura: "+alturaArea); 
    
    mouseClicked();
  
}

void mousePressed(){
  redraw();
}
