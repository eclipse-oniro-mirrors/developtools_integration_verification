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
struct BackwardAnalysisAln1430 {
  @State inputText: string = ''
  dialogController: CustomDialogController | null = null

  aboutToAppear() {
    this.dialogController = new CustomDialogController({
      builder: DialogContent1430({ inputText: this.inputText }),
      autoCancel: false,
      alignment: DialogAlignment.Bottom,
      customStyle: false
    })
    // 自动弹出dialog
    setTimeout(() => {
      this.showDialog()
    }, 500)
  }

  showDialog() {
    if (this.dialogController) {
      this.dialogController.open()
    }
  }

  build() {
    Column() {
      Text('Dialog避让输入法测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Button('显示Dialog')
        .id('show_dialog_btn_1430')
        .onClick(() => {
          this.showDialog()
        })
        .margin({ bottom: 20 })

      Text('请在Dialog中点击输入框拉起输入法，观察Dialog是否避让输入法')
        .fontSize(14)
        .fontColor('#666666')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}

@CustomDialog
struct DialogContent1430 {
  controller?: CustomDialogController
  @State inputText: string = ''

  build() {
    Column() {
      Text('Dialog弹窗')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      Text('请点击输入框拉起输入法')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 10 })

      TextInput({ placeholder: '点击此处拉起输入法', text: this.inputText })
        .id('dialog_text_input_1430')
        .width('90%')
        .height(50)
        .onChange((value: string) => {
          this.inputText = value
        })
        .margin({ bottom: 20 })

      Row() {
        Button('取消')
          .onClick(() => {
            if (this.controller) {
              this.controller.close()
            }
          })
          .margin({ right: 10 })

        Button('确定')
          .id('dialog_confirm_btn_1430')
          .onClick(() => {
            if (this.controller) {
              this.controller.close()
            }
          })
      }
      .margin({ bottom: 20 })
    }
    .width('100%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(16)
  }
}

