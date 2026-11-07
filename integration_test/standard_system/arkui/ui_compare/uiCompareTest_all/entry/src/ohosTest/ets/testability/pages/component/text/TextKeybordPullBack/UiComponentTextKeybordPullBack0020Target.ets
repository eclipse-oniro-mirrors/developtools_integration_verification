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
import { router } from '@kit.ArkUI'

@Entry
@Component
struct UiComponentTextKeybordPullBack0020Target {
  build() {
    Navigation() {
      Column({ space: 20 }) {
        Text('目标页面')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Text('这是跳转后的新页面，无需输入法')
          .fontSize(16)
          .id('text_target_pullback_0020')

        Button('返回')
          .id('btn_back_pullback_0020')
          .width('90%')
          .height(50)
          .onClick(() => {
            router.back()
          })
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .justifyContent(FlexAlign.Center)
    }
    .title('目标页面')
  }
}

