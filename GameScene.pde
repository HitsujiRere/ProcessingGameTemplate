class GameScene implements IScene {
  // ご飯の画像
  PImage riceImage;
  // ご飯のゲームオブジェクト
  GameObject riceObj;

  // クマの画像
  PImage bearImage;
  // クマのゲームオブジェクト
  GameObject bearObj;

  // 食べた回数
  int score;

  GameScene() {
    riceImage = pimageAsset.get("rice");
    bearImage = pimageAsset.get("bear");
  }

  void setup() {
    riceObj = new GameObject(width / 2, 0, 96, 96);

    bearObj = new GameObject(mouseX, height - 128, 128, 128);

    score = 0;
  }

  void draw() {
    // ご飯が落ちる
    // deltaTimeSecを掛けることでフレームレート非依存
    riceObj.pos.y += (300 + score * 20) * deltaTimeSec;

    // ご飯が床に落ちるとゲームオーバー
    if (riceObj.pos.y >= height) {
      sceneManager.set(SCENE_TITLE);

      // ハイスコアを更新する
      if (score > highScore) {
        highScore = score;
      }
    }

    // クマが移動
    bearObj.pos.x = mouseX;

    // ご飯を食べる
    if (bearObj.intersects(riceObj)) {
      riceObj.pos.set(random(width), 0);
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
    image(riceImage, riceObj);

    // クマを表示
    image(bearImage, bearObj);
  }

  void dispose() {
  }
}
