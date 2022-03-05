class GameScene implements IScene {
  // ご飯画像
  PImage riceImage;
  // ご飯位置
  float riceX, riceY;

  // クマ画像
  PImage bearImage;
  // クマ位置
  float bearX, bearY;

  // 食べた回数
  int score;

  GameScene() {
    riceImage = pimageAsset.get("rice");
    bearImage = pimageAsset.get("bear");
  }

  void setup() {
    riceX = width / 2;
    riceY = 0;

    bearX = mouseX;
    bearY = mouseY;

    score = 0;
  }

  void draw() {
    // ご飯が落ちる
    // deltaTimeSecを掛けることでフレームレート非依存
    riceY += (300 + score * 20) * deltaTimeSec;

    // ご飯が床に落ちるとゲームオーバー
    if (riceY >= height) {
      sceneManager.set(SCENE_TITLE);

      // ハイスコアを更新する
      if (score > highScore) {
        highScore = score;
      }
    }

    // クマが移動
    bearX = mouseX;
    bearY = height * 3 / 4;

    // ご飯を食べる
    if (bearX - 64 <= riceX && riceX <= bearX + 64 &&
      bearY - 64 <= riceY && riceY <= bearY + 64) {
      riceX = random(width);
      riceY = 0;
      score++;
    }

    // 背景
    background(#49BDF0);

    // 食べた回数を表示
    textAlign(LEFT, TOP);
    textSize(64);
    text(score, 0, 0);

    // ご飯を表示
    imageMode(CENTER);
    image(riceImage, riceX, riceY, 96, 96);

    // クマを表示
    image(bearImage, bearX, bearY, 128, 128);
  }

  void dispose() {
  }
}
