// ゲームオブジェクト
class GameObject {
  // 座標
  PVector pos = new PVector(0, 0);
  // 大きさ
  PVector size = new PVector(0, 0);

  GameObject() {
  }
  GameObject(PVector pos, PVector size) {
    this.pos.set(pos);
    this.size.set(size);
  }
  GameObject(float x, float y, float w, float h) {
    pos.set(x, y);
    size.set(w, h);
  }

  // 中心座標を取得する
  PVector center() {
    return PVector.add(pos, (PVector.div(size, 2.0)));
  }

  // フレームを描画する

  // thisとobjが交差しているか
  boolean intersects(GameObject obj) {
    return abs(center().x - obj.center().x) * 2 <= (size.x + obj.size.x)
      && abs(center().y - obj.center().y) * 2 <= (size.y + obj.size.y);
  }

  // thisがobjを内側に含んでいるか
  boolean contains(GameObject obj) {
    return abs(center().x - obj.center().x) * 2 <= (size.x - obj.size.x)
      && abs(center().y - obj.center().y) * 2 <= (size.y - obj.size.y);
  }

  // thisがotherを内側に含んでいるか
  boolean contains(PVector other) {
    return pos.x <= other.x && other.x <= pos.x + size.x
      && pos.y <= other.y && other.y <= pos.y + size.y;
  }
}

void rect(GameObject obj) {
  rect(obj.pos.x, obj.pos.y, obj.size.x, obj.size.y);
}

void image(PImage img, GameObject obj) {
  image(img, obj.pos.x, obj.pos.y, obj.size.x, obj.size.y);
}
