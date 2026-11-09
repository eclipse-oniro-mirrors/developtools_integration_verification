/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct ActionEventCommonEventKeyEventDispatch0040 {
  @State name: string = 'ActionEventCommonEventKeyEventDispatch0040';
  @State message: string = this.name;
  @State text: string = '';
  @State eventType: string = '';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(20)
          .fontColor(Color.Black)
          .textAlign(TextAlign.Center)
          .margin({
            left: 6,
            right: 6,
            top: 10,
            bottom: 10
          })

        Button('button组件')
          .onKeyEvent((event?: KeyEvent) => {
            if (event) {
              if (event.type === KeyType.Down) {
                this.eventType = 'Down';
              }
              if (event.type === KeyType.Up) {
                this.eventType = 'Up';
              }
              this.text = 'KeyType:' + this.eventType + '\nkeyCode:' + event.keyCode + '\nkeyText:' + event.keyText +
                '\nintentionCode:' + event.intentionCode;

              let testInfo = event.keySource;
              this.text += `\n\n 设备类型: ${JSON.stringify(testInfo)}`;
            }
          })
          .defaultFocus(true)
          .id(this.name + '_01')
          .margin(10)

        Text(this.text)
          .margin({
            left: 6,
            right: 6,
            top: 10,
            bottom: 10
          })
          .textAlign(TextAlign.Center)
          .fontSize(15)
          .fontColor(Color.Red)
          .fontWeight(600)
          .backgroundColor(Color.White)
          .borderRadius(5)
          .width('60%')
          .height(100)

      }
      .width('100%')
      .height('100%')
    }
  }
}
