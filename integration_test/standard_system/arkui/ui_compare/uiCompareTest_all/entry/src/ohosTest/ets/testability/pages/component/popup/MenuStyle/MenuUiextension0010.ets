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
@ComponentV2
export struct MenuUiextension0010 {
  @Local testStatus: string = '待测试';

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: '一级菜单项1（带二级）' })
        .bindMenu(this.SubMenuBuilder.bind(this))
      MenuItem({ content: '一级菜单项2' })
      MenuItem({ content: '一级菜单项3' })
    }
  }

  @Builder
  SubMenuBuilder() {
    Menu() {
      MenuItem({ content: '二级菜单项1' })
      MenuItem({ content: '二级菜单项2' })
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_UIEXTENSION_0010')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：验证不设置preview，subMenuExpandingMode设置为embedded_expand，bindContextMenu的一级、二级菜单能够在UIExtension中正常显示`)
        .fontSize(12)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button(`长按调起bindContextMenu`)
        .id('btn')
        .bindContextMenu(this.MenuBuilder, ResponseType.LongPress)
        .onClick(() => {
          this.testStatus = '请长按按钮弹出菜单';
        })

      Divider()

      Text(`预期结果：无预览图，一级菜单和二级菜单均能在UIExtension正常调起并显示，菜单调起没蒙层，二级菜单是嵌入式展开`)
        .fontSize(12)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

