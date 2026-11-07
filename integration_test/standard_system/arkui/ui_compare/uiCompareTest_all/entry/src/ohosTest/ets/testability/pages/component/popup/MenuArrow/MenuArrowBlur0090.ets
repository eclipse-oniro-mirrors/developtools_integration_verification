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

/**
 * 测试用例：ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWBLUR_0090
 * 测试目的：bindMenu设置isShown，content（CustomBuilder有3个菜单），showInSubWindow（true）,enableArrow（true）,backgroundBlurStyle（BlurStyle.Regular）,backgroundColor（0xff0000）
 * 预期结果：菜单正常显示，箭头、模糊效果和背景色正确
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct MenuArrowBlur0090 {
  @Local isMenuShown: boolean = false;
  @Local testStatus: string = '待测试';

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: '菜单项1' })
        .id('menuItem1')
        .onClick(() => {
          this.testStatus = '点击了菜单项1';
          this.isMenuShown = false;
          hilog.info(0x0000, 'testTag', 'Menu item 1 clicked');
        })

      MenuItem({ content: '菜单项2' })
        .id('menuItem2')
        .onClick(() => {
          this.testStatus = '点击了菜单项2';
          this.isMenuShown = false;
          hilog.info(0x0000, 'testTag', 'Menu item 2 clicked');
        })

      MenuItem({ content: '菜单项3' })
        .id('menuItem3')
        .onClick(() => {
          this.testStatus = '点击了菜单项3';
          this.isMenuShown = false;
          hilog.info(0x0000, 'testTag', 'Menu item 3 clicked');
        })
    }
  }

  build() {
    Column({ space: 15 }) {
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWBLUR_0090')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)

      Text('测试：bindMenu箭头+模糊+背景色')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      // 参数显示
      Column({ space: 8 }) {
        Text('菜单参数：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('• showInSubWindow: true')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('• enableArrow: true')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('• backgroundBlurStyle: BlurStyle.Regular')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('• backgroundColor: 0xff0000 (红色)')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#E3F2FD')
      .borderRadius(8)

      Divider()

      // 触发按钮
      Button('点击显示菜单')
        .id('triggerBtn')
        .width('60%')
        .height(50)
        .fontSize(16)
        .bindMenu(this.isMenuShown, this.MenuBuilder, {
          showInSubWindow: true,
          enableArrow: true,
          backgroundBlurStyle: BlurStyle.Regular,
          backgroundColor: 0xff0000
        })
        .onClick(() => {
          this.isMenuShown = !this.isMenuShown;
          this.testStatus = this.isMenuShown ? '菜单已显示' : '菜单已关闭';
          hilog.info(0x0000, 'testTag', `Menu ${this.isMenuShown ? 'shown' : 'hidden'}`);
        })

      Divider()

      // 测试说明
      Column({ space: 8 }) {
        Text('测试步骤：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. 点击上方按钮弹出菜单')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('2. 观察菜单是否有箭头指向按钮')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('3. 确认菜单背景为红色且有模糊效果')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('4. 点击菜单项测试交互')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      Text(`状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      // 预期结果
      Text('预期结果：菜单正常显示，箭头、模糊效果和背景色正确')
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

