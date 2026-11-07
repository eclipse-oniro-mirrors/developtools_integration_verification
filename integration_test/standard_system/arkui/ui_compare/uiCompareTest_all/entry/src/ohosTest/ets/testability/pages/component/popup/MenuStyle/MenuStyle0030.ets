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
export struct MenuStyle0030 {
  @Local testStatus: string = '待测试';

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: '菜单项1' })
      MenuItem({ content: '菜单项2' })
      MenuItem({ content: '菜单项3' })
    }
    .width(240)
  }

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_STYLE_ENHANCEMENT_0030')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：MenuItemDivider横竖屏切换对菜单固定数值分割线的影响`)
        .fontSize(13)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button(`长按弹出菜单`)
        .id('btn')
        .bindContextMenu(this.MenuBuilder, ResponseType.LongPress)
        .onClick(() => {
          this.testStatus = '请长按按钮弹出菜单';
        })

      Divider()

      Text(`预期结果：startmargin和endMargin为60vp时，分割线距离菜单侧边的起始端以及结束端的距离为60vp，分割线的颜色显示为Color_red，分割线的粗细为3fp，横竖屏切换后保持一致`)
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

