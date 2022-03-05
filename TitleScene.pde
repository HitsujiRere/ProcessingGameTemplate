class TitleScene implements IScene {
  TitleScene() {
  }

  void setup() {
  }

  void draw() {
    background(255);

    textAlign(CENTER, CENTER);
    fill(0);
    textSize(128);
    text("Eat Rice Game", width/2, height*3/10);
    textSize(48);
    text("High Score : " + highScore, width/2, height*6/10);
    textSize(48);
    text("Please Click Mouse Button...", width/2, height*8/10);

    if (mouseClicked) {
      sceneManager.set(SCENE_GAME);
    }
  }

  void dispose() {
  }
}
