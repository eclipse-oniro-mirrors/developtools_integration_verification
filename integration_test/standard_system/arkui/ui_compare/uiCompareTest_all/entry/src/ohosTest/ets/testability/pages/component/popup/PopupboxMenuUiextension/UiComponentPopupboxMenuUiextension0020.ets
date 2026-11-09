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
struct UiComponentPopupboxMenuUiextension0020 {
  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: '二级菜单项1' })
        .id('submenu_item_1_0020')
      MenuItem({ content: '二级菜单项2' })
        .id('submenu_item_2_0020')
      MenuItem({ content: '二级菜单项3' })
        .id('submenu_item_3_0020')
    }
    .subMenuExpandingMode(SubMenuExpandingMode.SIDE_EXPAND)
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '一级菜单项1' })
        .id('menu_item_1_0020')
      MenuItem({ startIcon: $r('sys.media.ohos_ic_public_cut'), content: '一级菜单项2', endIcon: $r('sys.media.ohos_ic_public_arrow_right'), builder: (): void => this.SubMenu() })
        .id('menu_item_2_0020')
      MenuItem({ content: '一级菜单项3' })
        .id('menu_item_3_0020')
    }
    .subMenuExpandingMode(SubMenuExpandingMode.SIDE_EXPAND)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0020')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0020')

      Text('测试说明：\n不设置preview，subMenuExpandingMode设置为side_expand，长按按钮调起bindContextMenu')
        .fontSize(14)
        .margin({ bottom: 30 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Button('长按调起菜单')
        .id('button_menu_0020')
        .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
          preview: MenuPreviewMode.NONE,
          enableArrow: false,
          placement: Placement.Bottom
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

