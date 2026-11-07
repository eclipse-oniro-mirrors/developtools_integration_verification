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
struct UiComponentPopupboxMenuTransitioneffect0010 {
  @Builder
  SubMenu1() {
    Menu() {
      MenuItem({ content: '子菜单项1-1' })
        .id('submenu_item_1_1_0010')
      MenuItem({ content: '子菜单项1-2' })
        .id('submenu_item_1_2_0010')
    }
  }

  @Builder
  SubMenu2() {
    Menu() {
      MenuItem({ content: '子菜单项2-1' })
        .id('submenu_item_2_1_0010')
      MenuItem({ content: '子菜单项2-2' })
        .id('submenu_item_2_2_0010')
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单项1', builder: (): void => this.SubMenu1() })
        .id('menu_item_1_0010')
      MenuItem({ content: '菜单项2', builder: (): void => this.SubMenu2() })
        .id('menu_item_2_0010')
    }
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_TRANSITIONEFFECT_0010')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0010')

      Text('测试说明：\nbindContextMenu设置非对称转场动画，出现从左边缘，消失从右边缘\n三个按钮分别测试：\n1.bindContextMenu - 无动画\n2.070_opacity_move - 仅透明度动画\n3.opacity_move - 完整非对称动画')
        .fontSize(14)
        .margin({ bottom: 30 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Column() {
        Button('bindContextMenu')
          .id('button_bind_context_menu_0010')
          .width(240)
          .height(50)
          .fontSize(16)
          .margin({ bottom: 15 })
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            enableArrow: false,
            placement: Placement.Top
          })

        Button('070_opacity_move')
          .id('button_070_opacity_move_0010')
          .width(240)
          .height(50)
          .fontSize(16)
          .margin({ bottom: 15 })
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            enableArrow: false,
            placement: Placement.Top,
            transition: TransitionEffect.opacity(0.5).animation({ duration: 3000 })
          })

        Button('opacity_move')
          .id('button_opacity_move_0010')
          .width(240)
          .height(50)
          .fontSize(16)
          .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
            enableArrow: false,
            placement: Placement.Top,
            transition: TransitionEffect.asymmetric(
              TransitionEffect.opacity(0.5).animation({ duration: 3000 }).combine(
                TransitionEffect.move(TransitionEdge.START).animation({ duration: 3000 })
              ),
              TransitionEffect.opacity(0.5).animation({ duration: 3000 }).combine(
                TransitionEffect.move(TransitionEdge.END).animation({ duration: 3000 })
              )
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

