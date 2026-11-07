/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct PreviewBasic0260 {
  textTimerController: TextTimerController = new TextTimerController();
  @State format: string = 'mm:ss.SS';

  build() {
    Column({ space: 20 }) {
      Text('基础倒计时')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      TextTimer({ isCountDown: true, count: 30000, controller: this.textTimerController })
        .format(this.format)
        .fontColor(Color.Black)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .fontStyle(FontStyle.Normal)
        .fontFamily('Arial')
        .textShadow({ radius: 5, color: Color.Gray, offsetX: 2, offsetY: 2 })
        .onTimer((utc: number, elapsedTime: number) => {
          console.info('textTimer notCountDown utc is：' + utc + ', elapsedTime: ' + elapsedTime);
        })

      Row({ space: 15 }) {
        Button('开始')
          .onClick(() => {
            this.textTimerController.start();
          })
          .fontSize(16)
          .backgroundColor('#007DFF')

        Button('暂停')
          .onClick(() => {
            this.textTimerController.pause();
          })
          .fontSize(16)
          .backgroundColor('#FF9500')

        Button('重置')
          .onClick(() => {
            this.textTimerController.reset();
          })
          .fontSize(16)
          .backgroundColor('#FF3B30')
      }
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}
