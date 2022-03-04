// シーンマネージャ
class SceneManager<State> {
  // シーン
  HashMap<State, IScene> scenes = new HashMap();

  // 現在のシーン
  IScene currentScene = null;
  // 次のシーン
  IScene nextScene = null;

  //シーンを追加
  SceneManager<State> add(State state, IScene scene) {
    if (state == null || scene == null) {
      throw new NullPointerException();
    }
    
    scenes.put(state, scene);

    if (currentScene == null && nextScene == null) {
      nextScene = scene;
    }

    return this;
  }

  // シーンを変更
  SceneManager<State> set(State state) {
    if (state == null) {
      throw new NullPointerException();
    }

    nextScene = scenes.get(state);
    if (nextScene == null) {
      throw new IllegalArgumentException("Scene not added.");
    }

    return this;
  }

  // シーンの実行
  void draw() {
    if (nextScene != null) {
      currentScene = nextScene;
      nextScene = null;

      currentScene.setup();
    }

    currentScene.draw();
  }
}
