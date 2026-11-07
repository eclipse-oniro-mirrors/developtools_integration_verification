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
 * SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0090
 * 带返回值onKeyEvent，属性测试stopPropagation
 * 预置：1、创建父组件column，绑定onKeyEvent事件 2、创建子组件button，绑定onKeyEvent事件
 *       3、在子组件的事件回调中使用stopPropagation
 * 步骤：1、使按钮获焦 2、按下任意按键  预期：只有子组件的onKeyEvent事件都触发
 */
@Entry
@Component
struct OnKeyEventAttrTest0090 {
  @State name: string = 'OnKeyEventAttrTest0090';
  @State parentLog: string = '';
  @State childLog: string = '';
  @State keyInputLog: string = '';

  build() {
    Column() {
      Text('用例: DISPATCH_0090 ' + this.name).fontSize(18).margin(10)
      Text(this.keyInputLog ? '输入按键:\n' + this.keyInputLog : '输入按键: (按键后显示)').fontSize(12).fontColor(Color.Blue).margin(6)
      Text('返回值:仅子组件响应(stopPropagation)\n父:' + this.parentLog + ' 子:' + this.childLog)
        .fontSize(12)
        .margin(10)

      Column() {
        Button('button组件')
          .onKeyEvent((event?: KeyEvent) => {
            if (event) {
              const line = 'keyCode=' + event.keyCode + ' keyText=' + event.keyText + ' type=' + (event.type === KeyType.Down ? 'Down' : 'Up');
              this.keyInputLog = (this.keyInputLog ? this.keyInputLog + '\n' : '') + line;
              this.childLog = 'child_key';
              event.stopPropagation();
            } else {
              this.childLog = 'event对象为undefined';
            }
          })
          .defaultFocus(true)
          .id(this.name + '_01')
          .margin(10)
      }
      .onKeyEvent(() => {
        this.parentLog = 'parent_key';
      })
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
