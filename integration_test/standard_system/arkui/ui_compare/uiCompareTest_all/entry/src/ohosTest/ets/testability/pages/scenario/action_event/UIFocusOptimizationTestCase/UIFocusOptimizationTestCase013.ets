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

@Entry
@Component
struct ModalPageOne {
  @State rootBg: string = '#FFFFFF'

  build() {
    Column() {
      Button('跳转modalPageTwo')
        .onClick(() => router.pushUrl({ url: 'pages/ModalPageTwo' }))
        .backgroundColor('#2196F3')

      Button('ButtonOne')
        .backgroundColor('#4CAF50')

      Button('ButtonTwo')
        .backgroundColor('#FF9800')
    }
    .backgroundColor(this.rootBg)
    .onFocus(() => this.rootBg = '#F5F5F5')  // 根容器获焦态
    .onBlur(() => this.rootBg = '#FFFFFF')   // 根容器失焦态
    .onKeyEvent((event: KeyEvent) => {
      if ([KeyType.Up, KeyType.Down].includes(event.keyCode)) {
        event.stopPropagation()  // 拦截方向键逃逸[6](@ref)
      }
    })
  }
  onPageShow(): void {
    setTimeout(() => focusControl.requestFocus('root'), 50)
  }
}