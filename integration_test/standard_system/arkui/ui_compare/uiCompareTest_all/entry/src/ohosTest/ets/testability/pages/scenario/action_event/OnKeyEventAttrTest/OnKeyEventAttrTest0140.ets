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
 * SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0140
 * 带返回值onKeyEvent，动态切换返回值
 * 预置：父子组件都绑定带返回值的onKeyEvent且返回值为动态变化的bool值
 * 预期：动态设置为true时不可以走焦，false时可以走焦，undefined走false的逻辑
 */
@Entry
@Component
struct OnKeyEventAttrTest0140 {
  @State returnVal: boolean = false;
  @State log: string = '';
  @State keyInputLog: string = '';

  build() {
    Column() {
      Text('用例: DISPATCH_0140 动态切换返回值').fontSize(18).margin(10)
      Text(this.keyInputLog ? '输入按键:\n' + this.keyInputLog : '输入按键: (按键后显示)').fontSize(12).fontColor(Color.Blue).margin(6)
      Button('切换返回值: ' + this.returnVal)
        .onClick(() => {
          this.returnVal = !this.returnVal;
        })
        .margin(10)
      Text('当前返回值:' + this.returnVal + '\n' + this.log)
        .fontSize(12)
        .margin(10)

      Button('按钮1')
        .onKeyEvent((event?: KeyEvent) => {
          if (event) {
            const line = 'keyCode=' + event.keyCode + ' keyText=' + event.keyText + ' type=' + (event.type === KeyType.Down ? 'Down' : 'Up');
            this.keyInputLog = (this.keyInputLog ? this.keyInputLog + '\n' : '') + line;
            this.log = 'key_' + this.returnVal;
          } else {
            this.log = 'event对象为undefined';
          }
          return this.returnVal;
        })
        .defaultFocus(true)
        .id('OnKeyEventAttrTest0140_btn')
        .margin(10)
    }
    .width('100%')
    .height('100%')
  }
}
