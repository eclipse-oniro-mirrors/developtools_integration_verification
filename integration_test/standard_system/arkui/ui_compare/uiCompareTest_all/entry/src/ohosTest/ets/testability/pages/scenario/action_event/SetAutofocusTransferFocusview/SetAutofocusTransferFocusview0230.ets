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
struct SetAutofocusTransferFocusview0230 {
  @State inputText: string = ''
  @State focusLog: string = ''
  @State showPopup: boolean = false

  @Builder
  popupBuilder() {
    Column() {
      Text('这是Popup弹窗')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Text('点击其他区域关闭')
        .fontSize(14)
        .fontColor(Color.Gray)

      Button('关闭')
        .id('setautofocustransfer_focusview_0230_close_popup')
        .width(100)
        .height(20)
        .margin({ top: 5 })
        .onClick(() => {
          this.showPopup = false
        })
    }
    .padding(20)
    .backgroundColor(Color.White)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0230')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Popup场景测试')
        .id('setautofocustransfer_focusview_0230_popup_test')
        .width('90%')
        .height(20)

      Column() {
        TextInput({ placeholder: '请输入内容', text: this.inputText })
          .id('setautofocustransfer_focusview_0230_textinput')
          .width('90%')
          .height(20)
          .defaultFocus(false)
          .onChange((value: string) => {
            this.inputText = value
          })
          .onFocus(() => {
            this.focusLog = 'popup_Input Gain TestFocus'
            console.log('popup_Input Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'popup_Input Lost TestFocus'
            console.log('popup_Input Lost TestFocus')
          })

        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0230_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 5 })

        Button('popup')
          .id('setautofocustransfer_focusview_0230_popup_btn')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .onClick(() => {
            this.showPopup = true
          })
          .bindPopup(this.showPopup, {
            builder: this.popupBuilder,
            placement: Placement.Bottom,
            popupColor: Color.White,
            enableArrow: true,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.showPopup = false
              }
            }
          })
      }
      .width('100%')
      .height('50%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}

