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
struct PageOne {
  @State focusedComponent: string = 'root'
  @State inputText: string = ''

  build() {
    Column() {
      TextInput({ placeholder: '主输入框' })
        .backgroundColor(this.focusedComponent === 'input' ? '#E3F2FD' : '#FFFFFF')
        .onFocus(() => {
          this.focusedComponent = 'input'
          inputMethod.getController().showTextInput()
        })
        .onBlur(() => this.focusedComponent = 'jumpBtn')

      Button('跳转到pageTwo')
        .backgroundColor(this.focusedComponent === 'jumpBtn' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedComponent = 'jumpBtn')
        .onClick(() => router.pushUrl({ url: 'pages/PageTwo' }))

      Button('ButtonOne')
        .backgroundColor(this.focusedComponent === 'btn1' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedComponent = 'btn1')

      Button('ButtonTwo')
        .backgroundColor(this.focusedComponent === 'btn2' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedComponent = 'btn2')
    }
    .backgroundColor(this.focusedComponent === 'root' ? '#F5F5F5' : '#FFFFFF') // 根容器焦点态[6](@ref)
  }
}