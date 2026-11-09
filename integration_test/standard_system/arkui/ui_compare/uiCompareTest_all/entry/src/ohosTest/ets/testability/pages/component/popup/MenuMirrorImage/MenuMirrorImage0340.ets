/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * 用例ID: ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0340
 * 用例描述: bindMenu首次渲染：藏文+Ltr
 * 预置条件:
 * 1、创建一个button组件和menu组件
 * 2、设置-》系统-》语言和地区-》选择 藏文 (Tibetan)
 * 测试步骤: 
 * 0、点击"bindMenu+bindContextMenu"按钮
 * 1、点击"direction:Ltr"按钮
 * 2、点击各个菜单按钮查看属性
 * 预期结果: 藏文+Ltr：菜单从左到右布局
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MenuMirrorImage0340 {
  @Local currentDirection: Direction = Direction.Ltr;  @Local isMenuOpen: boolean = false;
  @Local isMenuOpen2: boolean = false;
  @Local isMenuOpen3: boolean = false;
  @Local testLog: string[] = [];

  @Builder
  MenuBuilder() {
    Column() {
      Text(`མེནུ་རྣམ་གྲངས་ 1 - Menu Item 1`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0340_MenuItem1')
        .onClick(() => {
          this.addLog(`Menu Item 1 clicked`);
          this.isMenuOpen = false;
          this.isMenuOpen2 = false;
        })

      Divider()

      Text(`མེནུ་རྣམ་གྲངས་ 2 - Menu Item 2`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0340_MenuItem2')
        .onClick(() => {
          this.addLog(`Menu Item 2 clicked`);
          this.isMenuOpen = false;
          this.isMenuOpen2 = false;
        })

      Divider()

      Text(`མེནུ་རྣམ་གྲངས་ 3 - Menu Item 3`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0340_MenuItem3')
        .onClick(() => {
          this.addLog(`Menu Item 3 clicked`);
          this.isMenuOpen = false;
          this.isMenuOpen2 = false;
        })
    }
    .padding(10)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }

  @Builder
  CustomContentBuilder() {
    List() {
      ListItem() {
        Text(`རང་བཟོ་ནང་དོན་ 1 - Custom 1`)
          .fontSize(14)
          .padding(10)
      }
      ListItem() {
        Text(`རང་བཟོ་ནང་དོན་ 2 - Custom 2`)
          .fontSize(14)
          .padding(10)
      }
      ListItem() {
        Text(`རང་བཟོ་ནང་དོན་ 3 - Custom 3`)
          .fontSize(14)
          .padding(10)
      }
    }
    .width('200vp')
    .backgroundColor('#F0F0F0')
  }

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 10) {
      this.testLog = this.testLog.slice(0, 10);
    }
    hilog.info(0x0000, 'MenuMirrorImage0340', log);
  }

  build() {
    Column({ space: 15 }) {
      Text(`ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0340`)
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text(`bindMenu首次渲染：藏文+Ltr`)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`测试条件：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`• 系统语言：藏文 (Tibetan)\n• Direction: Ltr\n• 测试 bindMenu 镜像渲染`)
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Row({ space: 10 }) {
        Text(`当前Direction: Ltr`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      Divider().height(2).color('#EEEEEE')

      Scroll() {
        Column({ space: 10 }) {
        Button(`bindMenu菜单（options）`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#4CAF50')
          .bindMenu(this.isMenuOpen, [
            {
              value: 'མེནུ་རྣམ་གྲངས་ 1',
              action: () => {
                this.addLog(`Menu item 1 clicked`);
                this.isMenuOpen = false;
              }
            },
            {
              value: 'མེནུ་རྣམ་གྲངས་ 2',
              action: () => {
                this.addLog(`Menu item 2 clicked`);
                this.isMenuOpen = false;
              }
            },
            {
              value: 'མེནུ་རྣམ་གྲངས་ 3',
              action: () => {
                this.addLog(`Menu item 3 clicked`);
                this.isMenuOpen = false;
              }
            }
          ], {
            title: 'Menu Title',
            showInSubWindow: false
          })
          .onClick(() => {
            this.isMenuOpen = !this.isMenuOpen;
            this.addLog(`Toggle menu (options): ${this.isMenuOpen}`);
          })
          .id('MenuMirrorImage0340_OptionsButton')          .direction(this.currentDirection)

        Button(`bindMenu菜单（自定义builder）`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#2196F3')
          .bindMenu(this.isMenuOpen2, this.MenuBuilder, {
            title: 'Custom Builder Menu',
            showInSubWindow: false
          })
          .onClick(() => {
            this.isMenuOpen2 = !this.isMenuOpen2;
            this.addLog(`Toggle menu (builder): ${this.isMenuOpen2}`);
          })
          .id('MenuMirrorImage0340_BuilderButton')          .direction(this.currentDirection)

        Button(`自定义内容（不支持镜像）`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#FF9800')
          .bindMenu(this.isMenuOpen3, this.CustomContentBuilder, {
            showInSubWindow: false
          })
          .onClick(() => {
            this.isMenuOpen3 = !this.isMenuOpen3;
            this.addLog(`Toggle custom content: ${this.isMenuOpen3}`);
          })
          .id('MenuMirrorImage0340_CustomButton')          .direction(this.currentDirection)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Center)
      }
      .height('40%')
      .width('100%')

      Divider().height(2).color('#EEEEEE')

      Text(`预期结果：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`• 藏文+Ltr：菜单从左到右布局`)
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text(`测试日志：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(12)
              .fontColor('#333333')
              .width('100%')
              .padding(5)
              .backgroundColor(index % 2 === 0 ? '#F0F0F0' : Color.White)
          })
        }
        .width('100%')
      }
      .height('9.84%')
      .width('90%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')    .direction(this.currentDirection)
  }
}
