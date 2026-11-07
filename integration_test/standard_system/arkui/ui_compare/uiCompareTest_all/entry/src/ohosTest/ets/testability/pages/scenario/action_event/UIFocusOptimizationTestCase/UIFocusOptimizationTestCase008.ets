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
struct NavigationPage {
  @State focusColor: string = '#FFFFFF'

  build() {
    Navigation() {
      Column() {
        Button('双栏布局')
          .backgroundColor(this.focusColor)
          .onFocus(() => this.focusColor = '#E3F2FD')
          .onBlur(() => this.focusColor = '#FFFFFF')

        Button('push pageOne')
          .defaultFocus(true)
          .backgroundColor('#2196F3')
          .onClick(() => router.pushUrl({ url: 'pages/PageOne' }))

        Button('清空页面栈')
          .onClick(() => {
            router.clear()
            focusControl.requestFocus('root') // 强制焦点回到根容器
          })
      }
      .width('100%')
      .onFocus(() => console.log('根容器获焦'))
    }
    .title('导航首页')
  }
}

// PageOne.ets
@Component
struct PageOne {
  @State btn2Color: string = '#4CAF50' // 默认焦点颜色

  build() {
    Scroll() {
      Column() {
        Button('Button1')
          .focusable(true)
          .backgroundColor('#F44336')

        Button('Button2')
          .defaultFocus(true)
          .backgroundColor(this.btn2Color)
          .onFocus(() => this.btn2Color = '#81C784')
          .onBlur(() => this.btn2Color = '#4CAF50')
      }
    }
  }
}