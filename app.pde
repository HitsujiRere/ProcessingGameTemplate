// 前フレームにマウスが押されているか
boolean pmousePressed = false;
// 前フレームにマウスが押されているか
boolean mouseClicked = false;

// プログラム開始からのミリ秒
// millis()を用いるとプログラム内でズレが生じる
int time = 0;
// 前フレームのプログラム開始ミリ秒
int ptime = 0;
// 前フレームからの経過ミリ秒
int deltaTime = 0;
// 前フレームからの経過秒
float deltaTimeSec = 0.0;

// draw開始時の更新
void draw_begin() {
  mouseClicked = mousePressed && !pmousePressed;

  time = millis();
  deltaTime = time - ptime;
  deltaTimeSec = deltaTime / 1000.0;
}

// draw終了時の更新
void draw_end() {
  pmousePressed = mousePressed;

  ptime = time;
}
