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
struct UiComponentPopupboxMenuTransitioneffect0100 {
  @Builder
  SubMenu1() {
    Menu() {
      MenuItem({ content: '子菜单项1-1' })
        .id('submenu_item_1_1_0100')
      MenuItem({ content: '子菜单项1-2' })
        .id('submenu_item_1_2_0100')
    }
  }

  @Builder
  SubMenu2() {
    Menu() {
      MenuItem({ content: '子菜单项2-1' })
        .id('submenu_item_2_1_0100')
      MenuItem({ content: '子菜单项2-2' })
        .id('submenu_item_2_2_0100')
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单项1', builder: (): void => this.SubMenu1() })
        .id('menu_item_1_0100')
      MenuItem({ content: '菜单项2', builder: (): void => this.SubMenu2() })
        .id('menu_item_2_0100')
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0100')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0100')

      Text('测试说明：\nbindMenu设置组合转场动画（透明度+平移效果）\n三个按钮分别测试：\n1.bindMenu - 无动画\n2.010_opacity_translate - 仅透明度动画\n3.opacity_translate - 完整组合动画')
        .fontSize(14)
        .margin({ bottom: 30 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Column() {
        Button('bindMenu')
          .id('button_bind_menu_0100')
          .width(240)
          .height(50)
          .fontSize(16)
          .margin({ bottom: 15 })
          .bindMenu(this.MyMenu, {
            enableArrow: false,
            placement: Placement.Top
          })

        Button('010_opacity_translate')
          .id('button_010_opacity_translate_0100')
          .width(240)
          .height(50)
          .fontSize(16)
          .margin({ bottom: 15 })
          .bindMenu(this.MyMenu, {
            enableArrow: false,
            placement: Placement.Top,
            transition: TransitionEffect.opacity(0.5).animation({ duration: 3000 })
          })

        Button('opacity_translate')
          .id('button_opacity_translate_0100')
          .width(240)
          .height(50)
          .fontSize(16)
          .bindMenu(this.MyMenu, {
            enableArrow: false,
            placement: Placement.Top,
            transition: TransitionEffect.opacity(0.5).animation({ duration: 3000 }).combine(
              TransitionEffect.translate({ x: 10, y: 10, z: 10 }).animation({ duration: 3000 })
            )
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

