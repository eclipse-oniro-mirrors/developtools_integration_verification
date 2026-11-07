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
struct MenuExpand01 {
  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: '菜单选项1' })
        .id('menu_item_1')
      
      MenuItem({ content: '菜单选项2' })
        .id('menu_item_2')
      
      MenuItem({ content: '菜单选项3' })
        .id('menu_item_3')
    }
    .width(240)
    .height(60)
    .id('menu_container_05')
  }

  build() {
    Column({ space: 20 }) {
      Text('二级菜单三种展开模式样式测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('测试步骤：')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 10 })

      Text('1. 添加一个bindMenu组件')
        .fontSize(14)
        .margin({ left: 20, bottom: 5 })

      Text('2. 设置菜单宽度为240vp，高度为60vp')
        .fontSize(14)
        .margin({ left: 20, bottom: 5 })

      Text('3. subMenuExpandingMod分别设置三种模式，调起二级菜单')
        .fontSize(14)
        .margin({ left: 20, bottom: 5 })

      Text('4. 观察菜单样式')
        .fontSize(14)
        .margin({ left: 20, bottom: 20 })

      Button('点击触发菜单')
        .id('menu_trigger_05')
        .width(200)
        .height(50)
        .fontSize(16)
        .backgroundColor('#007DFF')
        .fontColor(Color.White)
        .borderRadius(8)
        .bindMenu(this.MenuBuilder)

      Text('预期效果：')
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .margin({ top: 20, bottom: 10 })

      Text('• side绘制设置的宽度')
        .fontSize(14)
        .margin({ left: 20, bottom: 5 })

      Text('• embedded继承一级菜单宽度')
        .fontSize(14)
        .margin({ left: 20, bottom: 5 })

      Text('• stack继承一级菜单宽度')
        .fontSize(14)
        .margin({ left: 20, bottom: 5 })

      Text('• 二级菜单高度，等同于设置的二级菜单高度')
        .fontSize(14)
        .margin({ left: 20, bottom: 5 })
        .fontColor('#666666')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}
