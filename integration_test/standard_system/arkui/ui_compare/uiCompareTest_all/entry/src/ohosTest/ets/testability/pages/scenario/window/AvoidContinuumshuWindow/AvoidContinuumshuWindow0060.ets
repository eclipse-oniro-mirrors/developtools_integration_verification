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
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct AvoidContinuumshuWindow0060 {

  showPromptDialog() {
    try {
      promptAction.showDialog({
        title: 'PromptAction Dialog',
        message: '这是一个PromptAction弹窗，用于验证连续弹子窗场景。请选择一个操作。',
        buttons: [
          {
            text: '取消',
            color: '#FF0000'
          },
          {
            text: '确认',
            color: '#0099FF'
          }
        ],
        showInSubWindow: true
      }).then((data: promptAction.ShowDialogSuccessResponse) => {
        console.log('PromptAction dialog result: ' + JSON.stringify(data))
      }).catch((err: BusinessError) => {
        console.error('PromptAction dialog error: ' + JSON.stringify(err))
      })
    } catch (error) {
      console.error('PromptAction showDialog error: ' + JSON.stringify(error))
    }
  }

  build() {
    Column() {
      Text('验证promptaction.showdialog的连续弹子窗场景')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50, bottom: 30 })

      Button('点击弹出PromptAction Dialog')
        .id('avoid_continuumshu_promptaction_button_0060')
        .width(250)
        .height(50)
        .fontSize(16)
        .onClick(() => {
          this.showPromptDialog()
        })
        .margin({ bottom: 20 })

      Text('说明：点击按钮弹出子窗promptaction dialog，然后连续点击蒙层处关闭dialog')
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
