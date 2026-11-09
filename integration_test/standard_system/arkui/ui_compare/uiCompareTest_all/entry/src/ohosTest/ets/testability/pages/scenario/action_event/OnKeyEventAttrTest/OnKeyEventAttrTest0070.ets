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

/**
 * SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0070
 * 带返回值onKeyEvent，属性测试timestamp
 * 预置：1、创建button组件，绑定onKeyEvent事件 2、在事件回调中获取timestamp
 * 步骤：1、使按钮获焦 2、按下任意按键  预期：打印触发事件时间戳
 */
@Entry
@Component
struct OnKeyEventAttrTest0070 {
  @State name: string = 'OnKeyEventAttrTest0070';
  @State text: string = '';
  @State eventType: string = '';
  @State keyInputLog: string = '';

  build() {
    Column() {
      Text('用例: DISPATCH_0070 ' + this.name).fontSize(18).margin(10)
      Text(this.keyInputLog ? '输入按键:\n' + this.keyInputLog : '输入按键: (按键后显示)').fontSize(12).fontColor(Color.Blue).margin(6)

      Button('button组件')
        .onKeyEvent((event?: KeyEvent) => {
          if (event) {
            const line = 'keyCode=' + event.keyCode + ' keyText=' + event.keyText + ' type=' + (event.type === KeyType.Down ? 'Down' : 'Up');
            this.keyInputLog = (this.keyInputLog ? this.keyInputLog + '\n' : '') + line;
            if (event.type === KeyType.Down) {
              this.eventType = 'Down';
            }
            if (event.type === KeyType.Up) {
              this.eventType = 'Up';
            }
            this.text = '返回值(timestamp):' + event.timestamp + ' KeyType:' + this.eventType;
          } else {
            this.text = 'event对象为undefined';
          }
        })
        .defaultFocus(true)
        .id(this.name + '_01')
        .margin(10)

      Text(this.text)
        .fontSize(14)
        .fontColor(Color.Red)
        .margin(10)
        .width('80%')
    }
    .width('100%')
    .height('100%')
  }
}
