// シーンマネージャ
SceneManager<Integer> sceneManager = new SceneManager();

// キーマネージャー
KeyManager keyManager = new KeyManager();

// ハイスコア
int highScore = 0;

void setup() {
  size(960, 640);

  // ハイスコアを取得
  JSONObject json = loadJSONObject("savedata");
  highScore = json.getInt("highScore");

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

void dispose() {
  // ハイスコアを保存
  JSONObject json = new JSONObject();
  json.setInt("highScore", highScore);
  saveJSONObject(json, "data/savedata", "compact");
}

void keyPressed() {
  keyManager.keyPressedUpdate();
}

void keyReleased() {
  keyManager.keyReleasedUpdate();
}
