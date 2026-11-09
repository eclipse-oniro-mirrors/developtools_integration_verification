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
struct MyDialog0390 {
  controller: CustomDialogController

  build() {
    Column() {
      Text('Dialog弹窗')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('这是Dialog弹窗内容')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('关闭弹窗')
        .id('setautofocustransfer_focusview_0390_close_dialog')
        .width(150)
        .height(50)
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
}

@Entry
@Component
struct SetAutofocusTransferFocusview0390 {
  @State focusLog: string = ''

  dialogController: CustomDialogController = new CustomDialogController({
    builder: MyDialog0390({}),
    autoCancel: true,
    customStyle: true
  })

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT__COMMONATTR_SETAUTOFOCUSTRANSFER_FOCUSVIEW_0390')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })

      Button('Dialog场景测试')
        .id('setautofocustransfer_focusview_0390_dialog_test')
        .width('90%')
        .height(20)

      Column() {
        Text(this.focusLog)
          .id('setautofocustransfer_focusview_0390_log')
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('defaultFocus Button')
          .id('setautofocustransfer_focusview_0390_default_focus')
          .width('80%')
          .height(50)
          .defaultFocus(true)
          .onFocus(() => {
            this.focusLog = 'Dialog_DefaultFocus Gain TestFocus'
            console.log('Dialog_DefaultFocus Gain TestFocus')
          })
          .onBlur(() => {
            this.focusLog = 'Dialog_DefaultFocus Lost TestFocus'
            console.log('Dialog_DefaultFocus Lost TestFocus')
          })

        Button('click me')
          .id('setautofocustransfer_focusview_0390_open_dialog')
          .width('80%')
          .height(50)
          .margin({ top: 10 })
          .onClick(() => {
            this.dialogController.open()
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

