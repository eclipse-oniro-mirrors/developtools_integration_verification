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

import inputMethod from '@ohos.inputMethod';

@Entry
@Component
struct PopupFocusExample {
  @State showPopup: boolean = false
  @State focusedId: string = 'root'
  @State inputText: string = ''
  inputCtrl: TextInputController = new TextInputController()

  @Builder
  popupContentBuilder() {
    Column() {
      Button('气泡按钮')
        .backgroundColor(this.focusedId === 'popBtn' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedId = 'popBtn')
        .onClick(() => console.log('点击气泡按钮'))

      TextInput({ placeholder: '输入内容' })
        .backgroundColor(this.focusedId === 'popInput' ? '#E3F2FD' : '#FFFFFF')
        .onFocus(() => {
          this.focusedId = 'popInput'
          inputMethod.getController().showTextInput()
        })
        .onBlur(() => this.focusedId = 'popBtn')
    }
    .width(200)
    .padding(10)
    .onKeyEvent((event: KeyEvent) => {
      if ([KeyType.Up, KeyType.Down].includes(event.keyCode)) {
        event.stopPropagation()
      }
    })
  }

  build() {
    Column() {
      Button('打开气泡')
        .backgroundColor(this.focusedId === 'mainBtn' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedId = 'mainBtn')
        .onClick(() => this.showPopup = true)
        .bindPopup(this.showPopup, {
          builder: this.popupContentBuilder,
          placement: Placement.Bottom,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.inputCtrl.stopEditing()  // 关闭输入法[2](@ref)
              focusControl.requestFocus('mainBtn')
            }
          }
        })
    }
  }

  onPageShow(): void {
    setTimeout(() => focusControl.requestFocus('mainBtn'), 50)
  }
}