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
export struct MenuArrowFocus0160 {
  @Local isMenuShown: boolean = false;
  @Local testStatus: string = '待测试';

  @Builder
  MenuBuilder() {
    Menu() {
      MenuItem({ content: '主菜单项1' })
        .id('menuItem1')
        .onClick(() => {
          this.testStatus = '点击了主菜单项1';
          this.isMenuShown = false;
        })

      MenuItem({ content: '主菜单项2' })
        .id('menuItem2')
        .onClick(() => {
          this.testStatus = '点击了主菜单项2';
          this.isMenuShown = false;
        })

      MenuItem({ content: '子菜单(SIDE_EXPAND)' })
        .id('menuItem3')
        .onClick(() => {
          this.testStatus = '点击了子菜单项';
          this.isMenuShown = false;
        })
    }
  }

  @Builder
  SubMenuBuilder() {
    Menu() {
      MenuItem({ content: '子菜单项1' })
        .onClick(() => {
          this.testStatus = '点击了子菜单项1';
          this.isMenuShown = false;
        })

      MenuItem({ content: '子菜单项2' })
        .onClick(() => {
          this.testStatus = '点击了子菜单项2';
          this.isMenuShown = false;
        })
    }
  }

  build() {
    Column({ space: 15 }) {
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWKEYSOYTOFFOCUS_0160')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)

      Text('测试：bindMenu二级菜单SIDE_EXPAND')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Button('点击显示菜单')
        .id('triggerBtn')
        .width('60%')
        .height(50)
        .bindMenu(this.isMenuShown, this.MenuBuilder, {
          title: 'HelloWorld',
          showInSubWindow: false,
          enableArrow: false
        })
        .onClick(() => {
          this.isMenuShown = !this.isMenuShown;
          this.testStatus = this.isMenuShown ? '菜单已显示' : '菜单已关闭';
        })

      Column({ space: 5 }) {
        Text('测试步骤：').fontSize(14).fontWeight(FontWeight.Bold).alignSelf(ItemAlign.Start)
        Text('1. 点击按钮弹出菜单').fontSize(12).alignSelf(ItemAlign.Start)
        Text('2. 点击"子菜单"项查看二级菜单').fontSize(12).alignSelf(ItemAlign.Start)
        Text('3. 观察二级菜单展开方式为侧边展开(SIDE_EXPAND)').fontSize(12).alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      Text(`状态：${this.testStatus}`).fontSize(14).fontColor(Color.Blue)

      Text('预期结果：二级菜单以SIDE_EXPAND方式展开')
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

