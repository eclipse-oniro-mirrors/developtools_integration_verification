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
struct MyDialog1800 {
  controller: CustomDialogController
  @State focusLog: string = ''

  build() {
    Column() {
      Text('Dialog弹窗')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text(this.focusLog)
        .id('commonattr_focusgroup_1800_dialog_log')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })

      // 焦点组
      Column() {
        Text('焦点组')
          .fontSize(12)
          .margin({ bottom: 5 })

        Button('btn1')
          .id('commonattr_focusgroup_1800_dialog_btn1')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'btn1 获得焦点'
          })

        TextInput({ placeholder: '请输入' })
          .id('commonattr_focusgroup_1800_dialog_textinput')
          .width('80%')
          .height(35)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'TextInput 获得焦点'
          })
      }
      .width('90%')
      .padding(10)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .margin({ bottom: 10 })
      .focusScopeId('dialogFocusGroup', true)

      Button('close')
        .id('commonattr_focusgroup_1800_dialog_close')
        .width('80%')
        .height(35)
        .onClick(() => {
          this.controller.close()
        })
        .onFocus(() => {
          this.focusLog = 'close 获得焦点'
        })
    }
    .width('90%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}

@Entry
@Component
struct CommonAttrFocusgroup1800 {
  @State focusLog: string = ''
  dialogController: CustomDialogController = new CustomDialogController({
    builder: MyDialog1800(),
    showInSubWindow: true,
    autoCancel: true
  })

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1800')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('dialog页面')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text(this.focusLog)
        .id('commonattr_focusgroup_1800_log')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })

      // ComponentDialog按钮（子窗口）
      Button('ComponentDialog')
        .id('commonattr_focusgroup_1800_open_dialog')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.dialogController.open()
        })
        .onFocus(() => {
          this.focusLog = 'ComponentDialog按钮 获得焦点'
        })

      Button('其他按钮')
        .id('commonattr_focusgroup_1800_other_btn')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onFocus(() => {
          this.focusLog = '其他按钮 获得焦点'
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 20 })
  }
}

