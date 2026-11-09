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
struct MenuPadding01 {
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
    .padding(10)
    .id('menu_container_01')
  }

  build() {
    Column({ space: 20 }) {
      Text('Menu Padding对Divider Margin影响测试')
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

      Text('3. menu设置对应的padding为10vp')
        .fontSize(14)
        .margin({ left: 20, bottom: 5 })

      Text('4. 观察divider的margin')
        .fontSize(14)
        .margin({ left: 20, bottom: 20 })

      Button('点击触发菜单')
        .id('menu_trigger_01')
        .width(200)
        .height(50)
        .fontSize(16)
        .backgroundColor('#007DFF')
        .fontColor(Color.White)
        .borderRadius(8)
        .bindMenu(this.MenuBuilder)

      Text('预期效果：menu设置的padding在divider对应的生效')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ top: 20 })
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}
