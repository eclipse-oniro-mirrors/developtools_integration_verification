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
struct TvMenuFading036 {

  @Builder
  MyMenu() {
    Menu() {
      // 多个MenuItem，每个content均超长，用于测试焦点来回切换
      MenuItem({
        content: '第一个超长菜单文字内容测试焦点来回切换跑马灯效果第一个超长菜单文字内容'
      })
        .id('menu_item_fading_036_01')
        .width(180)
        .height(50)

      MenuItem({
        content: '第二个超长菜单文字内容测试焦点来回切换跑马灯效果第二个超长菜单文字内容'
      })
        .id('menu_item_fading_036_02')
        .width(180)
        .height(50)

      MenuItem({
        content: '第三个超长菜单文字内容测试焦点来回切换跑马灯效果第三个超长菜单文字内容'
      })
        .id('menu_item_fading_036_03')
        .width(180)
        .height(50)

      MenuItem({
        content: '第四个超长菜单文字内容测试焦点来回切换跑马灯效果第四个超长菜单文字内容'
      })
        .id('menu_item_fading_036_04')
        .width(180)
        .height(50)

      MenuItem({
        content: '第五个超长菜单文字内容测试焦点来回切换跑马灯效果第五个超长菜单文字内容'
      })
        .id('menu_item_fading_036_05')
        .width(180)
        .height(50)
    }
    .width(200)
    .radius(8)
  }

  build() {
    Column() {
      Button('点击显示菜单')
        .id('btn_show_menu_fading_036')
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

