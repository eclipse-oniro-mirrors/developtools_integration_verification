/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@ohos.router'
import inputMethod from '@ohos.inputMethod'

@Entry
@Component
struct PageOneDefaultFocus {
  @State inputText: string = ''
  @State focusedComponent: string = 'jumpBtn' // 焦点状态追踪
  inputController: TextInputController = new TextInputController()

  build() {
    Column() {
      // 跳转按钮（默认焦点）
      Button('跳转到pageTwoDefaultFocus')
        .defaultFocus(true)
        .backgroundColor(this.focusedComponent === 'jumpBtn' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedComponent = 'jumpBtn')
        .onClick(() => router.pushUrl({ url: 'pages/PageTwoDefaultFocus' }))

      // 输入框
      TextInput({ placeholder: '输入内容' })
        .backgroundColor(this.focusedComponent === 'input' ? '#E3F2FD' : '#FFFFFF')
        .onFocus(() => {
          this.focusedComponent = 'input'
          inputMethod.getController().showTextInput()
        })
        .onBlur(() => {
          inputMethod.getController().hideTextInput()
          this.focusedComponent = 'jumpBtn'
        })
    }
  }
}