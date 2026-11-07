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
struct SetAutofocusTransferFocusview0430 {
  @State focusLog: string = ''
  @State showCheckboxDialog: boolean = false
  @State option1Checked: boolean = false
  @State option2Checked: boolean = false
  @State option3Checked: boolean = false

  @Builder
  checkboxDialogBuilder() {
    Column() {
      Text('文本+勾选弹出框')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Row() {
        Checkbox()
          .select(this.option1Checked)
          .onChange((value: boolean) => {
            this.option1Checked = value
          })
        Text('选项1')
          .fontSize(16)
          .margin({ left: 8 })
      }
      .id('setautofocustransfer_focusview_0430_option1')
      .width('100%')
      .margin({ bottom: 10 })
      .onClick(() => {
        this.option1Checked = !this.option1Checked
        this.showCheckboxDialog = false
      })

      Row() {
        Checkbox()
          .select(this.option2Checked)
          .onChange((value: boolean) => {
            this.option2Checked = value
          })
        Text('选项2')
          .fontSize(16)
          .margin({ left: 8 })
      }
      .id('setautofocustransfer_focusview_0430_option2')
      .width('100%')
      .margin({ bottom: 10 })
      .onClick(() => {
        this.option2Checked = !this.option2Checked
        this.showCheckboxDialog = false
      })

      Row() {
        Checkbox()
          .select(this.option3Checked)
          .onChange((value: boolean) => {
            this.option3Checked = value
          })
        Text('选项3')
          .fontSize(16)
          .margin({ left: 8 })
      }
      .id('setautofocustransfer_focusview_0430_option3')
      .width('100%')
      .margin({ bottom: 10 })
      .onClick(() => {
        this.option3Checked = !this.option3Checked
        this.showCheckboxDialog = false
      })
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
    .focusable(false)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0430')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('defaultFocus场景测试')
        .id('setautofocustransfer_focusview_0430_focus_test')
        .width('90%')
        .height(40)

      Text(this.focusLog)
        .id('setautofocustransfer_focusview_0430_log')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 10, bottom: 10 })

      Column() {
        Button('defaultFocus Button')
          .id('setautofocustransfer_focusview_0430_default_focus')
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

        Button('文本+勾选弹出框')
          .id('setautofocustransfer_focusview_0430_checkbox_dialog')
          .width('80%')
          .height(50)
          .onClick(() => {
            this.showCheckboxDialog = true
          })
          .bindPopup(this.showCheckboxDialog, {
            builder: this.checkboxDialogBuilder,
            placement: Placement.Bottom,
            popupColor: Color.Transparent,
            enableArrow: false,
            autoCancel: true,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.showCheckboxDialog = false
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

