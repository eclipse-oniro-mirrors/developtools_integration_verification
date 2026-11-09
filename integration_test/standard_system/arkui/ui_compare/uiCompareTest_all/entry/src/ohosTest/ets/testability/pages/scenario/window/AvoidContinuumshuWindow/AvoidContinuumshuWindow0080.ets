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

import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct AvoidContinuumshuWindow0080 {
  @State customDialogId: number = -1

  openCustomDialog() {
    try {
      promptAction.openCustomDialog({
        builder: () => {
          this.CustomDialogBuilder()
        },
        showInSubWindow: true,
        isModal: true,
        backgroundColor: 0x80000000,
        onWillDismiss: (dismissDialogAction: DismissDialogAction) => {
          console.log('PromptAction openCustomDialog onWillDismiss')
        }
      }).then((dialogId: number) => {
        this.customDialogId = dialogId
        console.log('PromptAction openCustomDialog success, dialogId: ' + dialogId)
      }).catch((err: Error) => {
        console.error('PromptAction openCustomDialog error: ' + JSON.stringify(err))
      })
    } catch (error) {
      console.error('PromptAction openCustomDialog error: ' + JSON.stringify(error))
    }
  }

  @Builder
  CustomDialogBuilder() {
    Column() {
      Text('PromptAction OpenCustomDialog')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })

      Text('这是一个PromptAction自定义对话框，用于验证连续弹子窗场景。')
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })
        .lineHeight(20)

      Row() {
        Text('选择项：')
          .fontSize(14)
          .margin({ right: 10 })

        Radio({ value: 'option1', group: 'radioGroup' })
          .checked(true)
          .margin({ right: 5 })
        Text('选项1')
          .fontSize(14)
          .margin({ right: 15 })

        Radio({ value: 'option2', group: 'radioGroup' })
          .margin({ right: 5 })
        Text('选项2')
          .fontSize(14)
      }
      .margin({ bottom: 20 })
      .alignItems(VerticalAlign.Center)

      Row() {
        Button('取消')
          .id('avoid_continuumshu_opencustomdialog_button_0080_001')
          .fontSize(14)
          .width(80)
          .height(35)
          .backgroundColor(Color.Gray)
          .onClick(() => {
            promptAction.closeCustomDialog(this.customDialogId)
          })
          .margin({ right: 15 })

        Button('确认')
          .fontSize(14)
          .width(80)
          .height(35)
          .onClick(() => {
            promptAction.closeCustomDialog(this.customDialogId)
          })
      }
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .padding(25)
    .backgroundColor(Color.White)
    .borderRadius(12)
  }

  build() {
    Column() {
      Text('验证promptaction.opencustomdialog的连续弹子窗场景')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50, bottom: 30 })

      Button('点击弹出PromptAction OpenCustomDialog')
        .id('avoid_continuumshu_opencustomdialog_button_0080')
        .width(320)
        .height(50)
        .fontSize(16)
        .onClick(() => {
          this.openCustomDialog()
        })
        .margin({ bottom: 20 })

      Text('说明：点击按钮弹出子窗promptaction opencustomdialog，然后连续点击蒙层处关闭dialog')
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
