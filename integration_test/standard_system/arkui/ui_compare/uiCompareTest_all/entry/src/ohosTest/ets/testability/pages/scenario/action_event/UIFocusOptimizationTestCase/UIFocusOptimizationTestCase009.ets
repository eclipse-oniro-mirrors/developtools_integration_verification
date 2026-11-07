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
import inputMethod from '@ohos.inputMethod';

@Entry
@Component
struct PageOne {
  @State focusState: string = 'root' // 焦点状态跟踪
  @State inputText: string = ''
  inputCtrl: TextInputController = new TextInputController()

  build() {
    Column() {
      TextInput({ placeholder: '主输入框' })
        .backgroundColor(this.focusState === 'input' ? '#E3F2FD' : '#FFFFFF')
        .onFocus(() => {
          this.focusState = 'input'
          inputMethod.getController().showTextInput()
        })
        .onBlur(() => this.focusState = 'root')

      Button('跳转到pageTwo')
        .backgroundColor(this.focusState === 'jumpBtn' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusState = 'jumpBtn')
        .onClick(() => {
          this.inputCtrl.stopEditing() // 跳转前主动关闭键盘[4](@ref)
          router.pushUrl({ url: 'pages/PageTwo' })
        })

      Button('ButtonOne')
        .backgroundColor(this.focusState === 'btn1' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusState = 'btn1')

      Button('ButtonTwo')
        .backgroundColor(this.focusState === 'btn2' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusState = 'btn2')
    }
  }

  onPageShow(): void {
    setTimeout(() => {
      focusControl.requestFocus('root') // 返回时强制焦点到根容器[1,2](@ref)
      this.inputCtrl.stopEditing() // 双重保障关闭键盘[4](@ref)
    }, 50)
  }
}