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

@Entry
@Component
struct ModalPageOne {
  @State focusedId: string = 'btn1' // 焦点追踪变量
  @State showModal2: boolean = false

  build() {
    Column() {
      Button('buttonOne')
        .defaultFocus(true)
        .backgroundColor(this.focusedId === 'btn1' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedId = 'btn1')

      Button('buttonTwo')
        .backgroundColor(this.focusedId === 'btn2' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedId = 'btn2')

      Button('跳转modal2')
        .backgroundColor(this.focusedId === 'jumpBtn' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedId = 'jumpBtn')
        .onClick(() => this.showModal2 = true)
        .bindContentCover(this.showModal2, this.Modal2Builder)
    }
  }

  @Builder
  Modal2Builder() {
    ModalPageTwo()
  }

  onPageShow(): void {
    setTimeout(() => focusControl.requestFocus('btn1'), 50)
  }
}

// modalPageTwoDefaultFocus.ets
@Component
struct ModalPageTwo {
  @State focusedId: string = 'modal2Btn1'

  build() {
    Column() {
      Button('modal2Btn1')
        .defaultFocus(true)
        .backgroundColor(this.focusedId === 'modal2Btn1' ? '#4CAF50' : '#FFFFFF')
        .onFocus(() => this.focusedId = 'modal2Btn1')

      Button('modal2Btn2')
        .backgroundColor(this.focusedId === 'modal2Btn2' ? '#4CAF50' : '#FFFFFF')
        .onFocus(() => this.focusedId = 'modal2Btn2')
    }
    .onKeyEvent((event: KeyEvent) => {
      if ([KeyType.Up, KeyType.Down].includes(event.keyCode)) {
        event.stopPropagation() // 拦截方向键逃逸
      }
    })
  }
}