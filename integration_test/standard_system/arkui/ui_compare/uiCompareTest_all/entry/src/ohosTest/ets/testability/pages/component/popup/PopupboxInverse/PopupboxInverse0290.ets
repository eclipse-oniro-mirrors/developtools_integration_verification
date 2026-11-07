/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct PopupboxInverse0290 {

  @Builder
  MyMenu() {
    Menu() {
      MenuItemGroup({ header: '菜单分组' }) {
        MenuItem({ content: '菜单项1' })
          .id('menu_item_inverse_0290_1')
        MenuItem({ content: '菜单项2' })
          .id('menu_item_inverse_0290_2')
          .margin({ bottom: 20 })
        MenuItem({ content: '菜单项3' })
          .id('menu_item_inverse_0290_3')
        MenuItem({ content: '菜单项4' })
          .id('menu_item_inverse_0290_4')
      }
    }
  }

  build() {
    Row() {
      Column() {
        Button('点击显示菜单')
          .id('PopupboxInverse0290_001')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .bindMenu(this.MyMenu)
      }
      .width('100%')
    }
    .height('100%')
  }
}

