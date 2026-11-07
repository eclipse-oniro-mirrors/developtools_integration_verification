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
 * SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0280
 * 带返回值onKeyEventDispatch，动态切换返回值
 * 预置：创建1个按钮，绑定onKeyEventDispatch和带返回值的onKeyEvent，onKeyEventDispatch返回值为可动态切换的bool值
 * 步骤：1、动态切换bool值 2、按钮1获焦后按下任意按键
 * 预期：获取到的id为undefined，area相关信息打印正确
 */
@Entry
@Component
struct OnKeyEventAttrTest0280 {
  @State dispatchReturnVal: boolean = false;
  @State log: string = '';
  @State keyInputLog: string = '';

  build() {
    Column() {
      Text('用例: DISPATCH_0280 onKeyEventDispatch 动态切换返回值').fontSize(18).margin(10)
      Text(this.keyInputLog ? '输入按键:\n' + this.keyInputLog : '输入按键: (按键后显示)').fontSize(12).fontColor(Color.Blue).margin(6)

      Button('切换返回值: ' + this.dispatchReturnVal)
        .onClick(() => {
          this.dispatchReturnVal = !this.dispatchReturnVal;
        })
        .id('OnKeyEventAttrTest0280_btn_switch')
        .margin(10)

      Button('按钮1')
        .onKeyEventDispatch((event?: KeyEvent) => {
          if (event) {
            const line = 'keyCode=' + event.keyCode + ' keyText=' + event.keyText + ' type=' + (event.type === KeyType.Down ? 'Down' : 'Up');
            this.keyInputLog = (this.keyInputLog ? this.keyInputLog + '\n' : '') + line;
            this.log = 'id:undefined area:keyCode=' + event.keyCode + ' keyText:' + event.keyText;
          } else {
            this.log = 'event对象为undefined';
          }
          return this.dispatchReturnVal;
        })
        .onKeyEvent((event?: KeyEvent) => {
          if (event) {
            const line = 'keyCode=' + event.keyCode + ' keyText=' + event.keyText + ' type=' + (event.type === KeyType.Down ? 'Down' : 'Up');
            this.keyInputLog = (this.keyInputLog ? this.keyInputLog + '\n' : '') + line;
            this.log = 'id:undefined area:keyCode=' + event.keyCode + ' keyText:' + event.keyText;
          } else {
            this.log = 'event对象为undefined';
          }
          return this.dispatchReturnVal;
        })
        .defaultFocus(true)
        .id('OnKeyEventAttrTest0280_01')
        .margin(10)

      Text('dispatch返回值:' + this.dispatchReturnVal + '\n' + this.log)
        .fontSize(12)
        .fontColor(Color.Red)
        .margin(10)
        .width('90%')
    }
    .width('100%')
    .height('100%')
  }
}
