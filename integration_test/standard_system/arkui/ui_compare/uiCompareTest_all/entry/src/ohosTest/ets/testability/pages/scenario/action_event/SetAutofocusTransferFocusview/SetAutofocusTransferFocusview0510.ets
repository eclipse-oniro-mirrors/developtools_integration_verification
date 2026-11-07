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
struct SetAutofocusTransferFocusview0510 {
  @State focusLog: string = ''
  @State showPopup: boolean = false

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0510')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Popup场景测试')
        .id('setautofocustransfer_focusview_0510_popup_test')
        .width('90%')
        .height(20)

      Column() {
        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0510_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('defaultFocus Button')
          .id('setautofocustransfer_focusview_0510_default_focus')
          .width('80%')
          .height(50)
          .defaultFocus(true)
          .onFocus(() => {
            this.focusLog = 'Popup_DefaultFocus Gain TestFocus'
            console.log('Popup_DefaultFocus Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'Popup_DefaultFocus Lost TestFocus'
            console.log('Popup_DefaultFocus Lost TestFocus')
          })

        Button('PopupOptions')
          .id('setautofocustransfer_focusview_0510_popup_options_btn')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .onClick(() => {
            this.showPopup = !this.showPopup
          })
          .bindPopup(this.showPopup, {
            message: 'PopupOptions气泡提示',
            placementOnTop: false,
            primaryButton: {
              value: '确定',
              action: () => {
                this.showPopup = false
                console.log('确定按钮被点击')
              }
            },
            secondaryButton: {
              value: '取消',
              action: () => {
                this.showPopup = false
                console.log('取消按钮被点击')
              }
            },
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.showPopup = false
              }
            }
          })
      }
      .width('100%')
      .height('80%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
  }
}

