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
struct TvMenuFading021 {

  // SIDE_EXPAND方式的子菜单
  @Builder
  SubMenuSideExpand() {
    Menu() {
      MenuItem({
        content: 'SIDE子菜单超长文字测试渐隐效果SIDE子菜单超长文字测试渐隐效果'
      })
        .id('sub_menu_side_001')
        .width(180)
        .height(50)

      MenuItem({
        content: 'SIDE子菜单第二项超长文字测试渐隐效果SIDE子菜单第二项超长'
      })
        .id('sub_menu_side_002')
        .width(180)
        .height(50)
    }
  }

  // EMBEDDED_EXPAND方式的子菜单
  @Builder
  SubMenuEmbeddedExpand() {
    Menu() {
      MenuItem({
        content: 'EMBEDDED子菜单超长文字测试渐隐效果EMBEDDED子菜单超长文字'
      })
        .id('sub_menu_embedded_001')
        .width(180)
        .height(50)

      MenuItem({
        content: 'EMBEDDED子菜单第二项超长文字测试渐隐效果EMBEDDED子菜单'
      })
        .id('sub_menu_embedded_002')
        .width(180)
        .height(50)
    }
  }

  // STACK_EXPAND方式的子菜单
  @Builder
  SubMenuStackExpand() {
    Menu() {
      MenuItem({
        content: 'STACK子菜单超长文字测试渐隐效果STACK子菜单超长文字测试渐隐'
      })
        .id('sub_menu_stack_001')
        .width(180)
        .height(50)

      MenuItem({
        content: 'STACK子菜单第二项超长文字测试渐隐效果STACK子菜单第二项'
      })
        .id('sub_menu_stack_002')
        .width(180)
        .height(50)
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      // MenuItem带子菜单，使用SIDE_EXPAND方式
      MenuItem({
        content: 'SIDE_EXPAND超长菜单文字测试渐隐效果超长菜单文字测试渐隐效果',
        builder: (): void => this.SubMenuSideExpand()
      })
        .id('menu_item_fading_021_01')
        .width(200)
        .height(50)

      // MenuItem带子菜单，使用EMBEDDED_EXPAND方式
      MenuItem({
        content: 'EMBEDDED_EXPAND超长菜单文字测试渐隐效果超长菜单文字测试',
        builder: (): void => this.SubMenuEmbeddedExpand()
      })
        .id('menu_item_fading_021_02')
        .width(200)
        .height(50)

      // MenuItem带子菜单，使用STACK_EXPAND方式
      MenuItem({
        content: 'STACK_EXPAND超长菜单文字测试渐隐效果超长菜单文字测试渐隐',
        builder: (): void => this.SubMenuStackExpand()
      })
        .id('menu_item_fading_021_03')
        .width(200)
        .height(50)
    }
    .width(220)
    .radius(8)
    .subMenuExpandingMode(SubMenuExpandingMode.SIDE_EXPAND)
  }

  build() {
    Column() {
      Button('点击显示菜单(SIDE_EXPAND)')
        .id('btn_show_menu_fading_021')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .width(250)
        .height(50)
        .bindMenu(this.MyMenu)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

