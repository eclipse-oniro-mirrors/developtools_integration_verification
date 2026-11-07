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
struct KeyEventUnicode {
  @State name: string = 'KeyEventUnicode';
  @State inputKey: string = '';
  @State text: string = '';

  build() {
    Column() {
      Text(this.name).fontSize(20).margin(10)
      Text(this.inputKey ? '输入按键: keyCode=' + this.inputKey : '输入按键: (按下按键后显示)')
        .fontSize(12).fontColor(Color.Blue).margin(6)
      Button('按键测试')
        .onKeyEvent((event?: KeyEvent) => {
          if (event) {
            this.inputKey = event.keyCode + ' keyText=' + event.keyText;
            const keyCode = event.keyCode;
            const unicodeVal = (keyCode >= 2000 && keyCode <= 2009) ? (48 + keyCode - 2000) : keyCode;
            this.text = '检查结果 keyCode:' + keyCode + ' keyText:' + event.keyText + ' unicode:' + unicodeVal;
          } else {
            this.text = 'event对象为undefined';
          }
        })
        .defaultFocus(true)
        .id('KeyEventUnicode_btn')
        .margin(10)
      Text(this.text ? this.text : '检查结果: (按键后显示keyCode/keyText/unicode)')
        .fontSize(14)
        .fontColor(Color.Red)
        .margin(10)
        .width('80%')
    }
    .width('100%')
    .height('100%')
  }
}
