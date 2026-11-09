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
 * SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0120
 * 带返回值onKeyEvent，返回值为false
 * 预置：父子组件都绑定带返回值的onKeyEvent且返回值为false
 * 步骤：1、按钮1获焦后按下任意按键 2、查看日志  预期：父子组件的onKeyEvent都响应
 */
@Entry
@Component
struct OnKeyEventAttrTest0120 {
  @State parentLog: string = '';
  @State childLog: string = '';
  @State keyInputLog: string = '';

  build() {
    Column() {
      Text('用例: DISPATCH_0120 父子都返回false，都响应').fontSize(18).margin(10)
      Text(this.keyInputLog ? '输入按键:\n' + this.keyInputLog : '输入按键: (按键后显示)').fontSize(12).fontColor(Color.Blue).margin(6)
      Text('返回值:子false 父false\n父:' + this.parentLog + ' 子:' + this.childLog)
        .fontSize(12)
        .margin(10)

      Column() {
        Button('按钮1')
          .onKeyEvent((event?: KeyEvent) => {
            if (event) {
              const line = 'keyCode=' + event.keyCode + ' keyText=' + event.keyText + ' type=' + (event.type === KeyType.Down ? 'Down' : 'Up');
              this.keyInputLog = (this.keyInputLog ? this.keyInputLog + '\n' : '') + line;
              this.childLog = 'child_ok';
            } else {
              this.childLog = 'event对象为undefined';
            }
            return false;
          })
          .defaultFocus(true)
          .id('OnKeyEventAttrTest0120_btn')
          .margin(10)
      }
      .onKeyEvent(() => {
        this.parentLog = 'parent_ok';
        return false;
      })
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
