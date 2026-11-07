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
struct UiComponentTextKeybordPullBack0020 {
  @State inputValue: string = ''

  build() {
    Navigation() {
      Column({ space: 20 }) {
        Text('页面切换触发输入法收起测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        // 输入框组件
        TextInput({ placeholder: '请输入内容', text: this.inputValue })
          .id('text_input_pullback_0020')
          .width('90%')
          .height(50)
          .onChange((value: string) => {
            this.inputValue = value
          })

        // 页面跳转按钮
        Button('跳转到新页面')
          .id('btn_jump_pullback_0020')
          .width('90%')
          .height(50)
          .fontSize(16)
          .onClick(() => {
            router.pushUrl({
              url: 'testability/pages/TextKeybordPullBack/UiComponentTextKeybordPullBack0020Target'
            })
          })
      }
      .width('100%')
      .height('100%')
      .padding(20)
    }
    .title('页面切换输入法收起')
  }
}

