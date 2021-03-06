// シーンマネージャ
SceneManager<Integer> sceneManager = new SceneManager();

// キーマネージャ
KeyManager keyManager = new KeyManager();

// PImageアセット
PImageAsset pimageAsset = new PImageAsset();

// ハイスコア
int highScore = 0;

void setup() {
  size(960, 640);

  try {
    // ハイスコアを取得
    JSONObject json = loadJSONObject("savedata");
    highScore = json.getInt("highScore");
  }
  catch(Exception e) {
    highScore = 0;
  }

  // 画像の登録
  pimageAsset
    .register("rice", "rice.png")
    .register("bear", "bear.png");

  // シーンの登録・設定
  sceneManager
    .add(SCENE_TITLE, new TitleScene())
    .add(SCENE_GAME, new GameScene())
    .set(SCENE_TITLE);
}

void draw() {
  // draw開始時の更新
  draw_begin();

  println("-----");
  println("FPS     :", frameRate);
  println("mouse   :", mouseX + ", " + mouseY);
  println("keyMap  :", keyManager.keyMap);

  // シーンマネージャを呼ぶ
  sceneManager.draw();

  // draw終了時の更新
  draw_end();
}

// プログラム終了時
void dispose() {
  // ハイスコアを保存
  JSONObject json = new JSONObject();
  json.setInt("highScore", highScore);
  saveJSONObject(json, "data/savedata", "compact");
}

void keyPressed() {
  // キーマネージャの更新
  keyManager.keyPressedUpdate();
}

void keyReleased() {
  // キーマネージャの更新
  keyManager.keyReleasedUpdate();
}
