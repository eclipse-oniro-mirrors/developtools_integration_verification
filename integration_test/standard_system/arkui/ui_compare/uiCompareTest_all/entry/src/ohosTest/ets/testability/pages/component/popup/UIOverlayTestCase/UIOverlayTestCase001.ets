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
import router from '@ohos.router';

@Entry
@Component
struct MainPage {
  @State currentFocus: string = 'jumpBtn'
  @State inputText: string = ''
  inputCtrl: TextInputController = new TextInputController()

  build() {
    Column({ space: 20 }) {
      Button('跳转次级页')
        .id('jumpBtn')
        .backgroundColor(this.currentFocus === 'jumpBtn' ? '#2196F3' : '#E0E0E0')
        .onFocus(() => this.currentFocus = 'jumpBtn')
        .onClick(() => {
          router.pushUrl({ url: 'pages/SubPage' })
        })

      TextInput({ placeholder: '输入内容' })
        .id('mainInput')
        .backgroundColor(this.currentFocus === 'mainInput' ? '#E3F2FD' : '#FFFFFF')
        .onFocus(() => {
          this.currentFocus = 'mainInput'
          inputMethod.getController().showTextInput()
        })
        .onBlur(() => {
          this.currentFocus = 'jumpBtn'
          this.inputCtrl.stopEditing()
        })

      Button('测试按钮')
        .id('testBtn')
        .backgroundColor(this.currentFocus === 'testBtn' ? '#4CAF50' : '#E0E0E0')
        .onFocus(() => this.currentFocus = 'testBtn')
    }
    .width('100%')
    .padding(20)
    .onKeyEvent((event: KeyEvent) => {
      if ([KeyType.Up, KeyType.Down].includes(event.keyCode)) {
        event.stopPropagation()
      }
    })
  }

  onPageShow(): void {
    setTimeout(() => focusControl.requestFocus('jumpBtn'), 50)
  }
}

// SubPage.ets
@Component
struct SubPage {
  @State subFocus: string = 'backBtn'

  build() {
    Column({ space: 15 }) {
      Button('返回主页面')
        .id('backBtn')
        .backgroundColor(this.subFocus === 'backBtn' ? '#FF9800' : '#E0E0E0')
        .onFocus(() => this.subFocus = 'backBtn')
        .onClick(() => {
          router.back()
        })

      TextInput({ placeholder: '次级页输入' })
        .backgroundColor(this.subFocus === 'subInput' ? '#E3F2FD' : '#FFFFFF')
        .onFocus(() => {
          this.subFocus = 'subInput'
          inputMethod.getController().showTextInput()
        })
        .onBlur(() => this.subFocus = 'backBtn')

      Button('测试按钮2')
        .id('testBtn2')
        .backgroundColor(this.subFocus === 'testBtn2' ? '#4CAF50' : '#E0E0E0')
        .onFocus(() => this.subFocus = 'testBtn2')
    }
    .width('100%')
    .padding(20)
  }

  onPageShow(): void {
    setTimeout(() => focusControl.requestFocus('backBtn'), 50)
  }
}