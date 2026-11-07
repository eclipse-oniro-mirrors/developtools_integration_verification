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
struct AvoidContinuumshuWindow0070 {

  showActionMenu() {
    try {
      promptAction.showActionMenu({
        title: 'PromptAction ActionMenu',
        buttons: [
          {
            text: '选项一',
            color: '#0099FF'
          },
          {
            text: '选项二',
            color: '#00CC00'
          },
          {
            text: '选项三',
            color: '#FF6600'
          },
          {
            text: '取消',
            color: '#FF0000'
          }
        ],
        showInSubWindow: true
      }).then((data: promptAction.ActionMenuSuccessResponse) => {
        console.log('PromptAction actionmenu result: ' + JSON.stringify(data))
      }).catch((err: BusinessError) => {
        console.error('PromptAction actionmenu error: ' + JSON.stringify(err))
      })
    } catch (error) {
      console.error('PromptAction showActionMenu error: ' + JSON.stringify(error))
    }
  }

  build() {
    Column() {
      Text('验证promptaction.actionmenu的连续弹子窗场景')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50, bottom: 30 })

      Button('点击弹出PromptAction ActionMenu')
        .id('avoid_continuumshu_actionmenu_button_0070')
        .width(280)
        .height(50)
        .fontSize(16)
        .onClick(() => {
          this.showActionMenu()
        })
        .margin({ bottom: 20 })

      Text('说明：点击按钮弹出子窗promptaction actionmenu，然后连续点击蒙层处关闭actionmenu')
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
