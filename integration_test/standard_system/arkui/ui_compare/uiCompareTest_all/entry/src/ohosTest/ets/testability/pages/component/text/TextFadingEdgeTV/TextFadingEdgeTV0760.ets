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
struct TextFadingEdgeTV0760 {

  controller: TextInputController = new TextInputController()
  @State Alignment:TextAlign = TextAlign.Start
  @State trans:boolean = false
  @State wid:string = '50%'
  @State text:string = 'Search textAlign sample,Search textAlign sample,Search textAlign sample'

  build() {
    Column({ space: 3 }) {
      TextInput({ text: this.text, controller: this.controller ,placeholder:'请输入文本这里是超长文本输入框测试文本'})
        .width(this.wid)
        .height(40)
        .stopBackPress(true)
        .textAlign(this.Alignment)
        .caretStyle({ width: 3, color: Color.Green })
        .selectedBackgroundColor(Color.Gray)
        .defaultFocus(true)
        .enableKeyboardOnFocus(true)
        .enablePreviewText(true)
        .enableHapticFeedback(true)
        .cancelButton({
          style: CancelButtonStyle.CONSTANT,
          icon: {
            size: 35,
            src: $r('app.media.app_icon'),
            color: Color.Blue
          }
        })
        .onChange((value: string) => {
          this.text = value;
        })
      Row(){
        Button('width change', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0760_001')
          .onClick(() => {
            this.wid = '95%'
          })
        Button('Align change2', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0760_002')
          .onClick(() => {
            this.Alignment = TextAlign.End
          })
      }
      Row(){
        Button('√', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0760_003')
          .onClick(() => {
            this.trans = true
          })
        Button('Set caretPosition -1', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0760_004')
          .onClick(() => {
            // 设置光标位置到输入的第一个字符后
            this.controller.caretPosition(-1);
          })
      }
      Row(){
        Button('Set caretPosition', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0760_005')
          .onClick(() => {
            // 设置光标位置到输入的最后一个字符后
            this.controller.caretPosition(100);
          })
        Button('x', { type: ButtonType.Normal, stateEffect: true })
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(200)
          .margin(20)
          .id('TextFadingEdgeTV0760_006')
          .onClick(() => {
            // 关闭自定义键盘
            this.controller.stopEditing();
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}
