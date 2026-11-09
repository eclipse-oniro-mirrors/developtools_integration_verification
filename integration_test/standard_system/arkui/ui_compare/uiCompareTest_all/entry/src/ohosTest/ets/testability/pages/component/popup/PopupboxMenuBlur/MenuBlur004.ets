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
export struct MenuBlur004 {
  @Local menuVisible: boolean = false;
  @Local testStatus: string = '待测试';

  @Builder
  CustomMenuBuilder() {
    Menu() {
      MenuItem({ content: '菜单项1' })
        .onClick(() => {
          this.testStatus = '✅ 点击了菜单项1';
          this.menuVisible = false;
        })
      MenuItem({ content: '菜单项2（带二级菜单）' })
        .bindMenu(this.SubMenuBuilder.bind(this))
      MenuItem({ content: '菜单项3' })
      MenuItem({ content: '菜单项4' })
      MenuItem({ content: '菜单项5' })
    }
    .width(180)
  }

  @Builder
  SubMenuBuilder() {
    Menu() {
      MenuItem({ content: '二级菜单项1' })
      MenuItem({ content: '二级菜单项2' })
      MenuItem({ content: '二级菜单项3' })
      MenuItem({ content: '二级菜单项4' })
      MenuItem({ content: '二级菜单项5' })
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BLUR_004')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：bindcontextmenu（入参为CustomBuilder，使用Menu()）`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`预置条件：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`• ets页面中加入button组件\n• 通过长按（ResponseType.LongPress）弹出bindContextmenu\n• 写入5个菜单项，其中第一个菜单项绑定二级菜单`)
        .fontSize(13)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Divider()

      Button('长按弹出菜单（bindContextMenu）')
        .id('btn')
        .bindContextMenu(this.CustomMenuBuilder, ResponseType.LongPress)
        .onClick(() => {
          this.testStatus = '请长按此按钮弹出菜单';
        })

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Divider()

      Text(`测试步骤：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 长按button组件，查看弹出的一级菜单\n2. 点击第一个菜单项，查看弹出的二级菜单\n3. 通过ArkUI Inspector查看MenuWrapper节点下的Menu节点的backgroundBlurStyle的value值\n4. 通过ArkUI Inspector查看MenuWrapper节点下的MenuItem节点的backgroundBlurStyle的value值`)
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 整个一级菜单背景都有模糊材质\n2. 整个二级菜单背景都有模糊材质\n3. 一级菜单和二级菜单都是BlurStyle.COMPONENT_ULTRA_THICK\n4. 值为空`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`说明：`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`本测试验证使用Menu()的bindContextMenu模糊材质效果。需通过ArkUI Inspector查看backgroundBlurStyle属性。`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

