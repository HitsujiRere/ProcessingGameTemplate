// シーンインターフェース
interface IScene {
  // シーン開始時
  void setup();

  // シーン毎フレーム
  void draw();

  // シーン終了時
  void dispose();
}
