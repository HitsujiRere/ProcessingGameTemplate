// シーンマネージャ
class SceneManager<State> {
  // シーン
  HashMap<State, IScene> scenes = new HashMap();

  // 現在のシーン
  IScene currentScene = null;

  // setup()を呼ぶか
  boolean needSetup = true;

  //追加
  SceneManager<State> add(State state, IScene scene) {
    scenes.put(state, scene);

    return this;
  }

  // シーンを変更
  SceneManager<State> set(State state) {
    currentScene = scenes.get(state);
    if (currentScene == null) {
      throw new RuntimeException("State is unregistered : " + state);
    }

    needSetup = true;

    return this;
  }

  // 更新
  void draw() {
    if (currentScene != null) {
      if (needSetup) {
        currentScene.setup();
        needSetup = false;
      }

      currentScene.draw();
    }
  }
}
