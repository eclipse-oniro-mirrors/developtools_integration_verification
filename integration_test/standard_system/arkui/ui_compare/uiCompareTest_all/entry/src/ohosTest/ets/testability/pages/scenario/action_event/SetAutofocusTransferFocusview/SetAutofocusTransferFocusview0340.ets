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

@CustomDialog
struct FirstDialog0340 {
  controller: CustomDialogController = new CustomDialogController({ builder: this })
  @State showSecondDialog: boolean = false

  build() {
    Column() {
      Text('第一个弹窗')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('这是第一个Dialog弹窗内容')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('点我打开第二个弹窗')
        .id('setautofocustransfer_focusview_0340_open_second_dialog')
        .width(180)
        .height(40)
        .onClick(() => {
          this.showSecondDialog = true
        })
        .bindPopup(this.showSecondDialog, {
          builder: () => {
            this.secondDialogBuilder()
          },
          placement: Placement.Top,
          popupColor: Color.Transparent,
          enableArrow: false,
          autoCancel: false,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.showSecondDialog = false
            }
          }
        })

      Button('关闭第一个弹窗')
        .id('setautofocustransfer_focusview_0340_close_first_dialog')
        .width(180)
        .height(40)
        .margin({ top: 10 })
        .onClick(() => {
          this.controller.close()
        })
    }
    .width('80%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(20)
    .justifyContent(FlexAlign.Center)
    .focusable(false)
  }

  @Builder
  secondDialogBuilder() {
    Column() {
      Text('第二个弹窗')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('这是第二个Dialog弹窗内容')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('点我关闭第二个弹窗')
        .id('setautofocustransfer_focusview_0340_close_second_dialog')
        .width(180)
        .height(50)
        .onClick(() => {
          this.showSecondDialog = false
        })
    }
    .width('34.72%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(20)
    .justifyContent(FlexAlign.Center)
    .focusable(false)
  }
}

@Entry
@Component
struct SetAutofocusTransferFocusview0340 {
  @State inputText: string = ''
  @State focusLog: string = ''

  dialogController: CustomDialogController = new CustomDialogController({
    builder: FirstDialog0340({}),
    autoCancel: true,
    customStyle: true
  })

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0340')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Dialog场景测试')
        .id('setautofocustransfer_focusview_0340_dialog_test')
        .width('90%')
        .height(20)

      Column() {
        TextInput({ placeholder: '请输入内容', text: this.inputText })
          .id('setautofocustransfer_focusview_0340_textinput')
          .width('90%')
          .height(50)
          .defaultFocus(false)
          .onChange((value: string) => {
            this.inputText = value
          })
          .onFocus(() => {
            this.focusLog = 'Dialog_TextInput Gain TestFocus'
            console.log('Dialog_TextInput Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'Dialog_TextInput Lost TestFocus'
            console.log('Dialog_TextInput Lost TestFocus')
          })

        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0340_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 5 })

        Button('Click me')
          .id('setautofocustransfer_focusview_0340_open_dialog')
          .width('80%')
          .height(50)
          .margin({ top: 5 })
          .onClick(() => {
            this.dialogController.open()
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

