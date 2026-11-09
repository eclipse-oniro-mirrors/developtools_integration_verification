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
 * 用例ID: ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0360
 * 用例描述: 验证直板机在深色模式下，鼠标右键点击打开web菜单的阴影显示正常
 * 预置条件:
 * 1、测试机刷最新镜像
 * 2、系统当前为深色模式
 * 测试步骤:
 * 1、编译hap包并执行
 * 2、触发菜单显示
 * 3、观察菜单的阴影
 * 预期结果: Web菜单的阴影显示正常
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MenuShadow0360 {
  @Local isMenuOpen: boolean = false;
  @Local isMenuOpen2: boolean = false;
  @Local testLog: string[] = [];

  @Builder
  MenuBuilder() {
    Column() {
      Text('菜单项 1 - Menu Item 1')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .fontColor('#E8E8E8')
        .onClick(() => {
          this.addLog('Menu Item 1 clicked');
        })

      Divider()

      Text('菜单项 2 - Menu Item 2')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .fontColor('#E8E8E8')
        .onClick(() => {
          this.addLog('Menu Item 2 clicked');
        })

      Divider()

      Text('菜单项 3 - Menu Item 3')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .fontColor('#E8E8E8')
        .onClick(() => {
          this.addLog('Menu Item 3 clicked');
        })
    }
    .padding(10)
    .backgroundColor('#2D2D2D')
    .borderRadius(8)
  }

  @Builder
  SubMenuBuilder() {
    Column() {
      Text('主菜单项 1 - Main Item 1')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .fontColor('#E8E8E8')
        .onClick(() => {
          this.addLog('Main Item 1 clicked');
        })

      Divider()

      Text('主菜单项 2 - Main Item 2')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .fontColor('#E8E8E8')
        .onClick(() => {
          this.addLog('Main Item 2 clicked');
        })

      Divider()

      Text('展开子菜单 - Expand SubMenu >')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .fontColor('#E8E8E8')
        .onClick(() => {
          this.addLog('SubMenu expanded (please observe shadow)');
        })

      Divider()

      Text('主菜单项 4 - Main Item 4')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .fontColor('#E8E8E8')
        .onClick(() => {
          this.addLog('Main Item 4 clicked');
        })
    }
    .padding(10)
    .backgroundColor('#2D2D2D')
    .borderRadius(8)
  }

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 8) {
      this.testLog = this.testLog.slice(0, 8);
    }
    hilog.info(0x0000, 'MenuShadow0360', log);
  }

  build() {
    Column({ space: 20 }) {
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0360')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .fontColor('#E8E8E8')

      Text('Web菜单右键阴影（深色模式）')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .fontColor('#E8E8E8')

      Divider().height(2).color('#555555')

      Text('测试条件：')
        .fontSize(16)
        .fontColor('#CCCCCC')
        .alignSelf(ItemAlign.Start)

      Text('• 主题模式：深色模式\n• 菜单类型：Web菜单（右键）\n• 测试阴影显示效果')
        .fontSize(14)
        .fontColor('#999999')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#555555')

      Text('操作区域：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor('#E8E8E8')
        .alignSelf(ItemAlign.Start)

        Button('Web菜单 右键点击\nRight Click for Web Menu')
          .fontSize(16)
          .width('80%')
          .height(80)
          .backgroundColor('#607d7B')
          .bindContextMenu(this.MenuBuilder, ResponseType.RightClick, {
            enableArrow: true
          })
          .onClick(() => {
            this.addLog('Right click to show web menu');
          })
          .id('MenuShadow{case_num}_WebButton')

      Divider().height(2).color('#555555')

      Text('预期结果：')
        .fontSize(16)
        .fontColor('#CCCCCC')
        .alignSelf(ItemAlign.Start)

      Text('• Web菜单的阴影显示正常')
        .fontSize(14)
        .fontColor('#4CAF50')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#555555')

      Text('测试日志：')
        .fontSize(16)
        .fontColor('#CCCCCC')
        .alignSelf(ItemAlign.Start)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(12)
              .fontColor('#E8E8E8')
              .width('100%')
              .padding(5)
              .backgroundColor(index % 2 === 0 ? '#2D2D2D' : '#1E1E1E')
          })
        }
        .width('100%')
      }
      .height('8.2%')
      .width('90%')
      .backgroundColor('#1E1E1E')
      .borderRadius(4)
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#121212')
  }
}
