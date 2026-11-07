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
struct PopupBoxAlertdialogScenarios0090 {
  @State showDialog1: boolean = false
  @State showDialog2: boolean = false
  private richEditorController: RichEditorController = new RichEditorController()

  showAlertDialog1() {
    AlertDialog.show({
      title: '警告弹窗1',
      message: '这是第一个警告弹窗，点击遮障层关闭',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      confirm: {
        value: '确认',
        action: () => {
          this.showDialog1 = false
        }
      },
      cancel: () => {
        this.showDialog1 = false
        this.richEditorController.addTextSpan('Alert1 Close\n', {
          style: {
            fontColor: Color.Blue,
            fontSize: 16
          }
        })
      }
    })
  }

  showAlertDialog2() {
    AlertDialog.show({
      title: '警告弹窗2',
      message: '这是第二个警告弹窗，点击遮障层关闭',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      confirm: {
        value: '确认',
        action: () => {
          this.showDialog2 = false
        }
      },
      cancel: () => {
        this.showDialog2 = false
        this.richEditorController.addTextSpan('Alert2 Close\n', {
          style: {
            fontColor: Color.Red,
            fontSize: 16
          }
        })
      }
    })
  }

  build() {
    Column({ space: 20 }) {
      Text('警告弹窗Cancel回调验证')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Button('one button dialog')
        .id('one_button_dialog_0090')
        .onClick(() => {
          this.showDialog1 = true
          this.showAlertDialog1()
        })
        .width(200)
        .height(40)

      Button('two button dialog')
        .id('two_button_dialog_0090')
        .onClick(() => {
          this.showDialog2 = true
          this.showAlertDialog2()
        })
        .width(200)
        .height(40)

      Text('日志输出区域：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      RichEditor({ controller: this.richEditorController })
        .id('rich_editor_log_0090')
        .width('90%')
        .height(200)
        .borderWidth(1)
        .borderColor(Color.Gray)
        .backgroundColor(Color.White)

      Text('操作说明：点击按钮弹出弹窗，然后点击遮障层关闭弹窗，观察日志输出')
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .margin({ top: 10 })
        .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
