// PImageのアセット
class PImageAsset {
  // シーン
  HashMap<String, PImage> images = new HashMap();

  //PImageを追加
  PImageAsset register(String name, PImage image) {
    if (name == null || image == null) {
      throw new NullPointerException();
    }

    images.put(name, image);

    return this;
  }

  //PImageをパスから追加
  PImageAsset register(String name, String path) {
    if (name == null || path == null) {
      throw new NullPointerException();
    }

    PImage image = loadImage(path);

    images.put(name, image);

    return this;
  }

  // PImageを取得
  PImage get(String name) {
    if (name == null) {
      throw new NullPointerException();
    }

    PImage image = images.get(name);
    if (image == null) {
      throw new IllegalArgumentException("Image not registered.");
    }

    return image.copy();
  }
}
