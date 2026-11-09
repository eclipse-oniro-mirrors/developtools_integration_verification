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
struct PopupBoxAlertdialogScenarios0050 {
  @State showDialog1: boolean = false
  @State showDialog2: boolean = false
  @State showDialog3: boolean = false
  @State dialogCount: number = 0

  showAlertDialog1() {
    AlertDialog.show({
      title: '第一层警告弹窗',
      message: '这是第一层弹窗，按ESC键可关闭',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      confirm: {
        value: '确认',
        action: () => {
          this.showDialog1 = false
          this.dialogCount = 0
        }
      },
      cancel: () => {
        this.showDialog1 = false
        this.dialogCount = 0
      }
    })
  }

  showAlertDialog2() {
    AlertDialog.show({
      title: '第二层场景测试弹窗',
      message: '这是第二层弹窗，按ESC键可关闭',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      confirm: {
        value: '确认',
        action: () => {
          this.showDialog2 = false
          this.dialogCount = 1
        }
      },
      cancel: () => {
        this.showDialog2 = false
        this.dialogCount = 1
      }
    })
  }

  showAlertDialog3() {
    AlertDialog.show({
      title: '第三层AlertDialogParamWithConfirm测试',
      message: '这是第三层弹窗，按ESC键可关闭',
      autoCancel: true,
      alignment: DialogAlignment.Center,
      confirm: {
        value: '确认',
        action: () => {
          this.showDialog3 = false
          this.dialogCount = 2
        }
      },
      cancel: () => {
        this.showDialog3 = false
        this.dialogCount = 2
      }
    })
  }

  build() {
    Column({ space: 20 }) {
      Text('警告弹窗多层堆叠测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Button('警告弹窗')
        .id('alert_dialog_button_0050')
        .onClick(() => {
          this.showDialog1 = true
          this.dialogCount = 1
          this.showAlertDialog1()
        })

      Button('场景测试')
        .id('scenario_test_button_0050')
        .onClick(() => {
          this.showDialog2 = true
          this.dialogCount = 2
          this.showAlertDialog2()
        })

      Button('AlertDialogParamWithConfirm测试用例1')
        .id('confirm_test_button_0050')
        .onClick(() => {
          this.showDialog3 = true
          this.dialogCount = 3
          this.showAlertDialog3()
        })

      Text(`当前弹窗层数: ${this.dialogCount}`)
        .fontSize(16)
        .margin({ top: 20 })

      Text('操作说明：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 连接键盘\n2. 按TAB键获焦\n3. 按空格键弹出弹窗\n4. 按ESC键关闭弹窗\n5. 重复操作测试多层弹窗')
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
