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

import { window } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'
import { common } from '@kit.AbilityKit'

@Entry
@Component
struct GesturesEnabledNew0380 {
  @State logMessage: string = ''

  build() {
    Column() {
      Text('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0380')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('手势启用-隐藏标题栏-触控板-双击')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('setWindowTitleMoveEnabled true')
        .id('gestures_enabled_new_0380_btn')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          let context = getContext(this) as common.UIAbilityContext
          window.getLastWindow(context).then((lastWindow) => {
            try {
              lastWindow.setWindowTitleMoveEnabled(true)
              this.logMessage = 'setWindowTitleMoveEnabled(true) success, 触控板双击缩放已启用'
              console.log('setWindowTitleMoveEnabled(true) success, 触控板双击缩放已启用')
            } catch (err) {
              let error = err as BusinessError
              // 错误码801表示设备不支持此API，但传参是正确的
              if (error.code == 801) {
                this.logMessage = 'setWindowTitleMoveEnabled(true) called, 触控板双击缩放已启用 (device not support)'
                console.log('setWindowTitleMoveEnabled(true) called, 触控板双击缩放已启用 (device not support, code: 801)')
              } else {
                this.logMessage = `setWindowTitleMoveEnabled failed: ${error.code}, ${error.message}`
                console.error(`setWindowTitleMoveEnabled failed: ${error.code}, ${error.message}`)
              }
            }
          }).catch((err: BusinessError) => {
            this.logMessage = `getLastWindow failed: ${err.code}, ${err.message}`
            console.error(`getLastWindow failed: ${err.code}, ${err.message}`)
          })
        })

      Text(this.logMessage)
        .id('gestures_enabled_new_0380_log')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 10 })

      Text('步骤2：窗口最大化时，触控板上双击标题栏（隐藏标题栏模式）')
        .fontSize(12)
        .fontColor(Color.Red)
        .margin({ top: 20 })

      Text('预期：窗口缩小')
        .fontSize(12)
        .fontColor(Color.Red)
        .margin({ top: 5 })

      Text('步骤3：窗口缩放模式时，触控板上双击标题栏（隐藏标题栏模式）')
        .fontSize(12)
        .fontColor(Color.Red)
        .margin({ top: 10 })

      Text('预期：窗口变为最大化')
        .fontSize(12)
        .fontColor(Color.Red)
        .margin({ top: 5 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .padding(20)
  }
}

