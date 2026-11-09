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

import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct PopupboxPromptScenarios0040 {
  build() {
    Column({ space: 20 }) {
      Text('无按钮弹窗场景(WGR)-prompt')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      Button('弹出无按钮弹窗')
        .id('PopupboxPromptScenarios0040_001')
        .onClick(() => {
          promptAction.showDialog({
            title: 'Title',
            message: 'Message',
            showInSubWindow: true
          })
        })

      Text('showInSubWindow设置为true')
        .fontSize(14)
        .fontColor(Color.Gray)

      Text('验证弹窗图层可以穿透')
        .fontSize(14)
        .fontColor(Color.Gray)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
