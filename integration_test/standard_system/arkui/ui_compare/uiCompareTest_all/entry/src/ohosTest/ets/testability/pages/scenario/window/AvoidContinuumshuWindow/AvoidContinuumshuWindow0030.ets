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
struct AvoidContinuumshuWindow0030 {
  dialogController: CustomDialogController | undefined

  aboutToAppear(): void {
    this.dialogController = new CustomDialogController({
      builder: AlertDialogExample(),
      showInSubWindow: true,
      isModal: true,
      customStyle: false
    })
  }

  build() {
    Column() {
      Text('验证alertdialog的连续弹子窗场景')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50, bottom: 30 })

      Button('点击弹出AlertDialog')
        .id('avoid_continuumshu_alertdialog_button_0030')
        .width(200)
        .height(50)
        .fontSize(16)
        .onClick(() => {
          if (this.dialogController != undefined) {
            this.dialogController.open()
          }
        })
        .margin({ bottom: 20 })

      Text('说明：点击按钮弹出子窗alertdialog，然后连续点击蒙层处关闭alertdialog')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .margin({ top: 20 })
        .padding(20)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

@CustomDialog
struct AlertDialogExample {
  controller?: CustomDialogController

  build() {
    Column() {
      Text('AlertDialog标题')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('这是一个AlertDialog弹窗内容，用于验证连续弹子窗场景。')
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })

      Row() {
        Button('取消')
          .fontSize(14)
          .width(80)
          .height(35)
          .backgroundColor(Color.Gray)
          .onClick(() => {
            if (this.controller != undefined) {
              this.controller.close()
            }
          })
          .margin({ right: 10 })

        Button('确认')
          .fontSize(14)
          .width(80)
          .height(35)
          .onClick(() => {
            if (this.controller != undefined) {
              this.controller.close()
            }
          })
      }
      .justifyContent(FlexAlign.Center)
    }
    .width('38.89%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }
}

