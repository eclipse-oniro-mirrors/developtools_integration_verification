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

/** SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0410 */
@Entry
@Component
struct OnKeyEventAttrTest0410 {
  @State text: string = '';
  @State keyInputLog: string = '';
  build() {
    Column() {
      Text('用例: DISPATCH_0410 OnKeyEventAttrTest0410').fontSize(18).margin(10)
      Text(this.keyInputLog ? '输入按键:\n' + this.keyInputLog : '输入按键: (按键后显示)').fontSize(12).fontColor(Color.Blue).margin(6)
      Button('button').onKeyEvent((event?: KeyEvent) => {
        if (event) {
          const line = 'keyCode=' + event.keyCode + ' keyText=' + event.keyText + ' type=' + (event.type === KeyType.Down ? 'Down' : 'Up');
          this.keyInputLog = (this.keyInputLog ? this.keyInputLog + '\n' : '') + line;
          this.text = '收到的event: keyCode=' + event.keyCode + ' keyText=' + event.keyText + ' type=' + (event.type === KeyType.Down ? 'Down' : 'Up') + ' timestamp=' + event.timestamp + ' intentionCode=' + event.intentionCode;
        } else {
          this.text = 'event对象为undefined';
        }
      }).defaultFocus(true).id('OnKeyEventAttrTest0410_01').margin(10)
      Text(this.text ? this.text : '收到的event: (按键后显示)').fontSize(14).fontColor(Color.Red).margin(10).width('90%')
    }.width('100%').height('100%')
  }
}
