# ProcessingGameTemplate

Processing用のゲーム作成テンプレート

## Reference

### SceneManager\<State\>

シーンの管理を行う

- State

  識別子の型

- SceneManager add(State state, IScene scene)

  識別子を`state`としてシーン`scene`を追加する

- SceneManager set(State state)

  現在のシーンを`state`に変更する

- void draw()

  現在のシーンを実行する

### IScene

シーンのインターフェース

- void setup()

  シーンの変更時に呼ばれる

- void draw()

  シーン毎フレーム呼ばれる

### KeyManager

入力されたキーの管理を行う

keyPressed()にてkeyPressedUpdate()，keyReleased()にてkeyReleasedUpdate()を呼ぶ必要がある

- int time(int code)

  キーを押している時間

- boolean pressed(int code)

  キーコードが`code`のキーが押されているかどうか

- boolean clicked(int code)

  キーコードが`code`のキーが押された瞬間かどうか

- void keyPressedUpdate()

  `keyPressed()`で呼ぶ必要がある

- void keyReleasedUpdate()

  `keyReleased()`で呼ぶ必要がある

### Key Codes

キーコード定数

### PImageAsset

PImageのアセット管理を行う

- register(String name, PImage image)

  識別子を`name`としてPImage`image`を追加する

- register(String name, String path)

  識別子を`name`として，ファイル`path`のPImage`image`を追加する

- get(String name)
  
  識別子`name`のPImageを返す

### app

補助のプログラムと変数

- boolean pmousePressed

  前フレームにマウスが押されているか

- boolean mouseClicked

  前フレームにマウスが押されているか

- int time

  プログラム開始からのミリ秒
  `millis()`を用いるとプログラム内でズレが生じるため，こちらの仕様を推奨

- int ptime

  前フレームのプログラム開始ミリ秒

- int deltaTime

  前フレームからの経過ミリ秒

- float deltaTimeSec

  前フレームからの経過秒

- void draw_begin()

  `draw()`開始時の更新をする

- void draw_end()

  `draw()`終了時の更新をする
