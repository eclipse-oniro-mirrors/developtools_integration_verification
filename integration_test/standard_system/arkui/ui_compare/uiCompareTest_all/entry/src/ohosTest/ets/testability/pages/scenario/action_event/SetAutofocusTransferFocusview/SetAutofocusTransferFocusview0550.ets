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
struct SetAutofocusTransferFocusview0550 {
  @State focusLog: string = ''
  @State showSheet: boolean = false

  @Builder
  sheetBuilder() {
    Column() {
      Text('ActionSheet')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('这是ActionSheet弹窗内容')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('Confirm button')
        .id('setautofocustransfer_focusview_0550_confirm_btn')
        .width(150)
        .height(50)
        .onClick(() => {
          this.showSheet = false
          console.log('Confirm button clicked')
        })

      Button('Cancel button')
        .id('setautofocustransfer_focusview_0550_cancel_btn')
        .width(150)
        .height(50)
        .margin({ top: 10 })
        .onClick(() => {
          this.showSheet = false
          console.log('Cancel button clicked')
        })
    }
    .width('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0550')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Sheetpage场景测试')
        .id('setautofocustransfer_focusview_0550_sheet_test')
        .width('90%')
        .height(20)

      Column() {
        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0550_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('defaultFocus Button')
          .id('setautofocustransfer_focusview_0550_default_focus')
          .width('80%')
          .height(50)
          .defaultFocus(true)
          .onFocus(() => {
            this.focusLog = 'Sheet_DefaultFocus Gain TestFocus'
            console.log('Sheet_DefaultFocus Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'Sheet_DefaultFocus Lost TestFocus'
            console.log('Sheet_DefaultFocus Lost TestFocus')
          })

        Button('Click to show actionSheet')
          .id('setautofocustransfer_focusview_0550_show_sheet_btn')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .onClick(() => {
            this.showSheet = true
          })
          .bindSheet(this.showSheet, this.sheetBuilder(), {
            height: SheetSize.MEDIUM,
            dragBar: true,
            onDisappear: () => {
              this.showSheet = false
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

