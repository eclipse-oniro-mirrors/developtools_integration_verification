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
struct GesturesEnabledNew0500 {
  @State logMessage: string = ''

  build() {
    Column() {
      Text('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0500')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('设置禁用后，拖拽100次、双击100次')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 20 })

      Button('setWindowTitleMoveEnabled false')
        .id('gestures_enabled_new_0500_btn')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .onClick(() => {
          let context = getContext(this) as common.UIAbilityContext
          window.getLastWindow(context).then((lastWindow) => {
            try {
              lastWindow.setWindowTitleMoveEnabled(false)
              this.logMessage = 'setWindowTitleMoveEnabled(false) success, 手势已禁用'
              console.log('setWindowTitleMoveEnabled(false) success, 手势已禁用')
            } catch (err) {
              let error = err as BusinessError
              if (error.code == 801) {
                this.logMessage = 'setWindowTitleMoveEnabled(false) called, 手势已禁用 (device not support)'
                console.log('setWindowTitleMoveEnabled(false) called, 手势已禁用 (device not support, code: 801)')
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
        .id('gestures_enabled_new_0500_log')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 10 })

      Text('步骤1：打开标题栏，拖拽、双击100次')
        .fontSize(12)
        .fontColor(Color.Red)
        .margin({ top: 20 })

      Text('预期：功能正常')
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

