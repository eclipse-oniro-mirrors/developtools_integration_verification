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
struct SetAutofocusTransferFocusview0410 {
  @State focusLog: string = ''
  @State showLoading: boolean = false

  @Builder
  loadingBuilder() {
    Column() {
      LoadingProgress()
        .width(80)
        .height(80)
        .color(Color.Blue)

      Text('Loading...')
        .fontSize(16)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .borderRadius(10)
    .justifyContent(FlexAlign.Center)
    .focusable(false)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0410')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('defaultFocus场景测试')
        .id('setautofocustransfer_focusview_0410_focus_test')
        .width('90%')
        .height(40)

      Text(this.focusLog)
        .id('setautofocustransfer_focusview_0410_log')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 10, bottom: 10 })

      Column() {
        Button('defaultFocus Button')
          .id('setautofocustransfer_focusview_0410_default_focus')
          .width('80%')
          .height(50)
          .margin({ bottom: 20 })
          .defaultFocus(true)
          .onFocus(() => {
            this.focusLog = 'DefaultFocus_Button Gain TestFocus'
            console.log('DefaultFocus_Button Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'DefaultFocus_Button Lost TestFocus'
            console.log('DefaultFocus_Button Lost TestFocus')
          })

        Button('Dialog')
          .id('setautofocustransfer_focusview_0410_dialog')
          .width('80%')
          .height(50)
          .onClick(() => {
            this.showLoading = true
          })
          .bindPopup(this.showLoading, {
            builder: this.loadingBuilder,
            placement: Placement.Top,
            popupColor: Color.Transparent,
            enableArrow: false,
            autoCancel: true,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.showLoading = false
              }
            }
          })
      }
      .width('100%')
      .height('60%')
      .justifyContent(FlexAlign.Center)
      .focusable(true)
    }
    .width('100%')
    .height('100%')
  }
}

