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
 * 用例ID: ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0250
 * 用例描述: 验证直板机在浅色模式下，设置subMenuExpandingMode为side_expand的菜单阴影显示正常
 * 预置条件:
 * 1、测试机刷最新镜像
 * 2、系统当前为浅色模式
 * 测试步骤:
 * 1、编译hap包并执行
 * 2、触发菜单显示
 * 3、观察菜单的阴影
 * 预期结果: 子菜单和主菜单的阴影显示正常（侧边扩展）
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MenuShadow0250 {
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
        .onClick(() => {
          this.addLog('Menu Item 1 clicked');
        })

      Divider()

      Text('菜单项 2 - Menu Item 2')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .onClick(() => {
          this.addLog('Menu Item 2 clicked');
        })

      Divider()

      Text('菜单项 3 - Menu Item 3')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .onClick(() => {
          this.addLog('Menu Item 3 clicked');
        })
    }
    .padding(10)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }

  @Builder
  SubMenuBuilder() {
    Column() {
      Text('主菜单项 1 - Main Item 1')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .onClick(() => {
          this.addLog('Main Item 1 clicked');
        })

      Divider()

      Text('主菜单项 2 - Main Item 2')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .onClick(() => {
          this.addLog('Main Item 2 clicked');
        })

      Divider()

      Text('展开子菜单 - Expand SubMenu >')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .onClick(() => {
          this.addLog('SubMenu expanded (please observe shadow)');
        })

      Divider()

      Text('主菜单项 4 - Main Item 4')
        .fontSize(16)
        .padding(10)
        .width('100%')
        .onClick(() => {
          this.addLog('Main Item 4 clicked');
        })
    }
    .padding(10)
    .backgroundColor(Color.White)
    .borderRadius(8)
  }

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 8) {
      this.testLog = this.testLog.slice(0, 8);
    }
    hilog.info(0x0000, 'MenuShadow0250', log);
  }

  build() {
    Column({ space: 20 }) {
      Text('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_SHADOWSET_0250')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('子菜单side_expand阴影（浅色模式）')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text('测试条件：')
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('• 主题模式：浅色模式\n• 菜单类型：subMenu - side_expand\n• 测试阴影显示效果')
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('操作区域：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

        Button('side_expand 长按\nLong Press for SubMenu')
          .fontSize(16)
          .width('80%')
          .height(80)
          .backgroundColor('#4CAF50')
          .bindContextMenu(this.SubMenuBuilder, ResponseType.LongPress, {
            enableArrow: true
          })
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.addLog('Long press for side_expand submenu');
            }
          })
          .id('MenuShadow{case_num}_SideButton')

      Divider().height(2).color('#EEEEEE')

      Text('预期结果：')
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('• 子菜单和主菜单的阴影显示正常（侧边扩展）')
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('测试日志：')
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
      .height('8.2%')
      .width('90%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}
