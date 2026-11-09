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
struct TvMenuFading034 {

  // 二级菜单
  @Builder
  SubMenu() {
    Menu() {
      MenuItem({
        content: '二级菜单项1超长文字测试渐隐效果二级菜单项1超长文字测试渐隐效果'
      })
        .id('sub_menu_item_034_01')
        .width(180)
        .height(50)

      MenuItem({
        content: '二级菜单项2超长文字测试渐隐效果二级菜单项2超长文字测试渐隐效果'
      })
        .id('sub_menu_item_034_02')
        .width(180)
        .height(50)

      MenuItem({
        content: '二级菜单项3超长文字测试渐隐效果二级菜单项3超长文字测试渐隐效果'
      })
        .id('sub_menu_item_034_03')
        .width(180)
        .height(50)
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      // 普通菜单项
      MenuItem({
        content: '普通菜单项超长文字测试渐隐效果普通菜单项超长文字测试渐隐效果'
      })
        .id('menu_item_fading_034_01')
        .width(180)
        .height(50)

      // 带二级菜单的菜单项
      MenuItem({
        content: '展开二级菜单超长文字测试渐隐效果展开二级菜单超长文字测试渐隐效果',
        builder: (): void => this.SubMenu()
      })
        .id('menu_item_fading_034_02')
        .width(180)
        .height(50)

      // 普通菜单项
      MenuItem({
        content: '第三个菜单项超长文字测试渐隐效果第三个菜单项超长文字测试渐隐效果'
      })
        .id('menu_item_fading_034_03')
        .width(180)
        .height(50)
    }
    .width(200)
    .radius(8)
  }

  build() {
    Column() {
      Button('点击显示菜单')
        .id('btn_show_menu_fading_034')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width(200)
        .height(50)
        .bindMenu(this.MyMenu)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}

