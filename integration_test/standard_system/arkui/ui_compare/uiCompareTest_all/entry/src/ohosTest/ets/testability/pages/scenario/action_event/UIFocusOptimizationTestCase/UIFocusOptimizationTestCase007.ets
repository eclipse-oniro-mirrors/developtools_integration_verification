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

interface menuInfo {
  id: string;
  label: string;
  hasSub: boolean;
  enabled?: boolean;
}

@Entry
@Component
struct MenuPageOneDefaultFocus {
  @State menuVisible: boolean = false
  @State subMenuVisible: boolean = false
  @State focusedId: string = 'mainBtn' // 焦点追踪变量
  @State menuItems: menuInfo[] = [
    { id: 'item1', label: '菜单项1', hasSub: false },
    { id: 'item2', label: '菜单项2', hasSub: true },
    { id: 'item3', label: '禁用项', hasSub: false, enabled: false },
    { id: 'item4', label: '菜单项4', hasSub: false },
    { id: 'item5', label: '菜单项5', hasSub: false }
  ]
  // 菜单构建器
  @Builder
  MenuBuilder() {
    Column() {
      ForEach(this.menuItems, (item:menuInfo) => {
        Button(item.label)
          .id(item.id)
          .defaultFocus(item.id === 'item2') // 默认聚焦第二项[6](@ref)
          .enabled(item.enabled ?? true)
          .backgroundColor(this.focusedId === item.id ? '#2196F3' : '#FFFFFF')
          .onFocus(() => this.focusedId = item.id)
          .onClick(() => {
            if (item.hasSub) {
              this.subMenuVisible = true
            }
          })
      })
    }
    .width(200)
    .padding(10)
    .bindMenu(this.subMenuVisible, this.SubMenuBuilder) // 子菜单绑定[4](@ref)
  }
  // 子菜单构建器
  @Builder
  SubMenuBuilder() {
    Column() {
      Button('子项1')
        .defaultFocus(true)
        .backgroundColor(this.focusedId === 'sub1' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedId = 'sub1')

      Button('子项2')
        .backgroundColor(this.focusedId === 'sub2' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedId = 'sub2')
    }
  }

  build() {
    Column() {
      Button('bindMenu 子窗口')
        .id('mainBtn')
        .defaultFocus(true)
        .backgroundColor(this.focusedId === 'mainBtn' ? '#2196F3' : '#FFFFFF')
        .onFocus(() => this.focusedId = 'mainBtn')
        .onClick(() => this.menuVisible = true)
        .bindMenu(this.menuVisible, this.MenuBuilder) // 主菜单绑定[8](@ref)
    }
  }
}