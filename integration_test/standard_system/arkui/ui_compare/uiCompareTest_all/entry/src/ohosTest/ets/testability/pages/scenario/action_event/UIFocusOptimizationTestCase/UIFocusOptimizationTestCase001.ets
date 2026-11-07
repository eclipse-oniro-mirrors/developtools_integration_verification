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
struct MenuPageOne {
  @State mainMenuVisible: boolean = false
  @State subMenuVisible: boolean = false
  @State mainMenuFocused: boolean = false
  @State subMenuFocused: boolean = false

  @Builder buildMainMenu() {
    Menu() {
      MenuItem({ content: '选项一' })
        .enabled(true)
        .backgroundColor(this.getMenuItemColor(1))
        .onClick(() => console.info('选项一'))

      MenuItem({ content: '选项二' })
        .enabled(true)
        .backgroundColor(this.getMenuItemColor(2))
        .onClick(() => this.showSubMenu())

      MenuItem({ content: '选项三' })
        .enabled(false)
        .backgroundColor('#BDBDBD')

      MenuItem({ content: '选项四' })
        .enabled(true)
        .backgroundColor(this.getMenuItemColor(4))
        .onClick(() => console.info('选项四'))

      MenuItem({ content: '选项五' })
        .enabled(true)
        .backgroundColor(this.getMenuItemColor(5))
        .onClick(() => console.info('选项五'))
    }
      .width(200)
      .backgroundColor(this.mainMenuFocused ? '#E3F2FD' : '#FFFFFF')
      .onAppear(() => this.mainMenuFocused = true)
      .onDisAppear(() => this.mainMenuFocused = false)
      .bindMenu()
      .padding(10)
  }
  // 子菜单构建器
  @Builder buildSubMenu() {
    Menu() {
      MenuItem({ content: '子选项一' })
        .backgroundColor(this.getSubItemColor(1))
        .onClick(() => console.info('子选项一'))
      MenuItem({ content: '子选项二' })
        .backgroundColor(this.getSubItemColor(2))
        .onClick(() => console.info('子选项二'))
    }
      .width(180)
      .backgroundColor(this.subMenuFocused ? '#F3E5F5' : '#FFFFFF')
      .onAppear(() => this.subMenuFocused = true)
      .onDisAppear(() => {
        this.subMenuFocused = false
        this.mainMenuFocused = true
      })
      .padding(10)
  }

  build() {
    Column() {
      Button('bindMenu 非子窗口')
        .id('bindMenu 非子窗口')
        .margin(10)
        .onClick(() => this.mainMenuVisible = true)

      Button('bindMenu 子窗口')
        .id('bindMenu 子窗口')
        .margin(10)
        .onClick(() => {
          this.mainMenuVisible = true
          this.mainMenuFocused = true
        })
        .bindMenu(this.buildMainMenu())

      Button('bindContextMenu')
        .id('bindContextMenu')
        .margin(10)
        .bindContextMenu(this.buildMainMenu(), ResponseType.LongPress)

      Button('返回')
        .margin(10)
        .onClick(() => router.back())
    }
    .bindMenu(this.buildSubMenu())
    .onClick(() => {
      this.mainMenuVisible = false
      this.subMenuVisible = false
    })
  }

  private showSubMenu(): void {
    this.subMenuVisible = true
    this.mainMenuFocused = false
  }

  private getMenuItemColor(index: number): string {
    return this.mainMenuFocused ?
      (index === 2 ? '#BBDEFB' : '#E3F2FD') :
      '#FFFFFF'
  }

  private getSubItemColor(index: number): string {
    return this.subMenuFocused ?
      (index === 1 ? '#F3E5F5' : '#E1BEE7') :
      '#FFFFFF'
  }
}