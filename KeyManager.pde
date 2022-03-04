// シーンマネージャ
class KeyManager {
  // シーン
  HashMap<Integer, Integer> keyMap = new HashMap();

  // keyPressed()の更新
  void keyPressedUpdate() {
    if (!pressed(keyCode)) {
      keyMap.put(keyCode, time);
    }
  }

  // keyReleased()の更新
  void keyReleasedUpdate() {
    keyMap.remove(keyCode);
  }

  // キーを押している時間
  int time(int code) {
    if (pressed(code)) {
      return time - keyMap.get(code);
    } else {
      return 0;
    }
  }

  // キーが押されているか
  boolean pressed(int code) {
    return keyMap.containsKey(code);
  }

  // キーが押された瞬間か
  boolean clicked(int code) {
    return pressed(code) && (time(code) <= deltaTime);
  }
}
