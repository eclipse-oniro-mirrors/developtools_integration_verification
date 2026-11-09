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
struct UiComponentTextKeybordPullUp0020 {
  @State inputValue: string = ''
  @State dialogVisible: boolean = false

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogWithInput({
      inputValue: this.inputValue,
      cancel: () => {
        this.dialogVisible = false
      }
    }),
    autoCancel: true,
    alignment: DialogAlignment.Center
  })

  build() {
    Navigation() {
      Column({ space: 20 }) {
        Text('弹窗控件中拉起输入法测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Button('打开弹窗')
          .id('btn_open_dialog_pullup_0020')
          .width('90%')
          .height(50)
          .fontSize(16)
          .onClick(() => {
            this.dialogVisible = true
            this.dialogController.open()
          })

        Text('点击按钮打开包含输入框的弹窗')
          .fontSize(14)
          .fontColor(Color.Gray)
      }
      .width('100%')
      .height('100%')
      .padding(20)
    }
    .title('弹窗中拉起输入法')
  }
}

@CustomDialog
struct CustomDialogWithInput {
  @Link inputValue: string
  controller?: CustomDialogController
  cancel: () => void = () => {}

  build() {
    Column({ space: 20 }) {
      Text('弹窗对话框')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      TextInput({ placeholder: '请在弹窗中输入', text: this.inputValue })
        .id('text_input_dialog_pullup_0020')
        .width('100%')
        .height(50)
        .onChange((value: string) => {
          this.inputValue = value
        })

      Row({ space: 20 }) {
        Button('取消')
          .id('btn_cancel_dialog_pullup_0020')
          .width('45%')
          .onClick(() => {
            this.controller?.close()
            this.cancel()
          })

        Button('确定')
          .id('btn_confirm_dialog_pullup_0020')
          .width('45%')
          .onClick(() => {
            this.controller?.close()
            this.cancel()
          })
      }
      .width('100%')
    }
    .padding(20)
    .width('90%')
  }
}

