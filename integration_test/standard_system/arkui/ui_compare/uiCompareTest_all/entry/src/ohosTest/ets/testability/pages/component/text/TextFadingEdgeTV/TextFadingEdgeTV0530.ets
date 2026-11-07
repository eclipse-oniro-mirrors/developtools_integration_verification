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
struct TextFadingEdgeTV0530 {

  controller: TextInputController = new TextInputController()
  @State Alignment:TextAlign = TextAlign.Start
  @State trans:boolean = false
  @State text:string = ''
  @State textError:string = ''
  @State focus:boolean = true

  build() {
    Column({ space: 3 }) {
      TextInput({ text: this.text, controller: this.controller })
        .width('40%')
        .height(40)
        .stopBackPress(true)
        .textAlign(this.Alignment)
        .caretStyle({ width: 3, color: Color.Green })
        .defaultFocus(this.focus)
        .enableKeyboardOnFocus(this.focus)
        .enablePreviewText(true)
        .enableHapticFeedback(true)
        .showError(this.textError)
        .showUnderline(true)
        .onChange((value: string) => {
          this.text = value
          if(this.text=='123'){
            this.textError = '';
          }
          else {
            this.textError = 'Error文本这里是超长Eror文本输入框测试文本';
            this.text = '';
          }
        })
      Row(){
        Button('input', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0530_001')
          .onClick(() => {
            this.text = 'Search textAlign sample,Search textAlign sample,Search textAlign sample,Search textAlign sample'
          })
        Button('x', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0530_002')
          .onClick(() => {
            // 关闭自定义键盘
            this.controller.stopEditing();
          })
      }
      Row(){
        Button('focus', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0530_003')
          .onClick(() => {
            this.focus = true
          })
        Button('not focus', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0530_004')
          .onClick(() => {
            this.focus = false
          })
      }
      Row(){
        Button('Set caretPosition', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0530_005')
          .onClick(() => {
            // 设置光标位置到输入的最后一个字符后
            this.controller.caretPosition(100);
          })

      }
    }
    .width('100%')
    .height('100%')
  }
}
