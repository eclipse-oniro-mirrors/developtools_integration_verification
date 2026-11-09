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
struct NavigationHome {
  @State focusColor: string = '#FFFFFF'

  build() {
    Navigation() {
      Column() {
        Button('双栏布局')
          .backgroundColor(this.focusColor)
          .onFocus(() => this.focusColor = '#E3F2FD')
          .onBlur(() => this.focusColor = '#FFFFFF')

        Button('push pageOne')
          .backgroundColor('#2196F3')
          .onClick(() => router.pushUrl({ url: 'pages/PageOne' }))

        Button('replace pageTwo')
          .onClick(() => router.replaceUrl({ url: 'pages/PageTwo' }))
      }
      .onFocus(() => console.log('根容器获焦'))
    }
    .title('导航首页')
  }
  onPageShow(): void {
    setTimeout(() => focusControl.requestFocus('root'), 50)
  }
}

// PageOne.ets
@Component
struct PageOne {
  @State btnColor: string = '#FFFFFF'

  build() {
    Scroll() {
      Column() {
        Button('Button1')
          .backgroundColor(this.btnColor)
          .onFocus(() => this.btnColor = '#81C784')
          .onBlur(() => this.btnColor = '#FFFFFF')

        Button('返回')
          .onClick(() => router.back())
      }
    }
  }
  onPageShow(): void {
    setTimeout(() => focusControl.requestFocus('Button1'), 50)
  }
}

// PageTwo.ets
@Component
struct PageTwo {
  @State scrollBg: string = '#F5F5F5'

  build() {
    Scroll() {
      Column() {
        TextInput({ placeholder: '输入内容' })
          .onFocus(() => this.scrollBg = '#E3F2FD')
          .onBlur(() => this.scrollBg = '#F5F5F5')
      }
    }
    .backgroundColor(this.scrollBg)
  }
  onPageShow(): void {
    setTimeout(() => focusControl.requestFocus('root'), 50)
  }
}