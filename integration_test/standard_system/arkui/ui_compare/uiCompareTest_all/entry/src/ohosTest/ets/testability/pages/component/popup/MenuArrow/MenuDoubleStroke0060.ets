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
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct MenuDoubleStroke0060 {
  @Local testStatus: string = '待测试';

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: '菜单项1' })
        .id('menuItem1')
        .onClick(() => {
          this.testStatus = '点击了菜单项1';
          hilog.info(0x0000, 'testTag', 'Menu item 1 clicked');
        })

      MenuItem({ content: '菜单项2' })
        .id('menuItem2')
        .onClick(() => {
          this.testStatus = '点击了菜单项2';
        })

      MenuItem({ content: '菜单项3' })
        .id('menuItem3')
        .onClick(() => {
          this.testStatus = '点击了菜单项3';
        })
    }
  }

  build() {
    Column({ space: 15 }) {
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_DOUBLESTROKE_0060')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)

      Text('测试：bindContextMenu双描边效果')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text('手机设备（默认双描边4）')
        .fontSize(12)
        .fontColor(Color.Orange)

      Text('长按下方按钮弹出菜单')
        .fontSize(12)

      Button('长按我')
        .id('triggerBtn')
        .width('60%')
        .height(50)
        .bindContextMenu(this.MenuBuilder, ResponseType.LongPress, {
          enableArrow: true
        })
        .onClick(() => {
          this.testStatus = '请长按弹出菜单';
        })

      Column({ space: 5 }) {
        Text('测试步骤：').fontSize(14).fontWeight(FontWeight.Bold).alignSelf(ItemAlign.Start)
        Text('1. 在手机设备上运行').fontSize(12).alignSelf(ItemAlign.Start)
        Text('2. 长按按钮弹出菜单').fontSize(12).alignSelf(ItemAlign.Start)
        Text('3. 观察菜单边框是否有双描边效果（默认4px）').fontSize(12).alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      Text(`状态：${this.testStatus}`).fontSize(14).fontColor(Color.Blue)

      Text('预期结果：菜单显示双描边效果')
        .fontSize(13)
        .fontColor(Color.Green)
        .padding(8)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

