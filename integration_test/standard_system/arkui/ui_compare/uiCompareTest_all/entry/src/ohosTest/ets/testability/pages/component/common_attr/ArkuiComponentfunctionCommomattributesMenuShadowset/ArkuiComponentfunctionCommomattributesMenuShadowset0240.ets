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
struct ArkuiComponentfunctionCommomattributesMenuShadowset0240 {
  @Builder
  SubMenu() {
    Menu() {
      MenuItem({ content: '二级菜单项1' })
        .id('submenu_item_1_0240')
      MenuItem({ content: '二级菜单项2' })
        .id('submenu_item_2_0240')
      MenuItem({ content: '二级菜单项3' })
        .id('submenu_item_3_0240')
    }
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '一级菜单项1' })
        .id('menu_item_1_0240')
      MenuItem({ content: '一级菜单项2-子菜单', endIcon: $r('sys.media.ohos_ic_public_arrow_right'), builder: (): void => this.SubMenu() })
        .id('menu_item_submenu_0240')
      MenuItem({ content: '一级菜单项3' })
        .id('menu_item_3_0240')
    }
    .subMenuExpandingMode(SubMenuExpandingMode.EMBEDDED_EXPAND)
  }

  build() {
    Column() {
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0240')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('title_text_0240')

      Text('测试说明：\n验证直板机在浅色模式下，设置subMenuExpandingMode为embedded_expand的菜单阴影显示正常')
        .fontSize(14)
        .margin({ bottom: 30 })
        .padding(10)
        .backgroundColor(Color.Gray)
        .borderRadius(8)

      Button('embedded_expand-长按')
        .id('button_embedded_0240')
        .margin({ bottom: 10 })
        .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
          enableArrow: false
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

