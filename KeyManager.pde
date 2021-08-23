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

  // キーが押されているか
  boolean pressed(int code) {
    return keyMap.containsKey(code);
  }
  
  // キーが押された瞬間か
  boolean clicked(int code) {
    return pressed(code) && (keyMap.get(code) >= ptime);
  }
}
