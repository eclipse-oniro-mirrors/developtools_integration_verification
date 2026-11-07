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
 * 用例ID: ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0010
 * 用例描述: bindContextMenu首次渲染：简体中文+Auto
 * 预置条件:
 * 1、创建一个button组件和menu组件
 * 2、设置-》系统-》语言和地区-》选择 简体中文
 * 测试步骤:
 * 0、点击"bindMenu+bindContextMenu"按钮
 * 1、点击"direction:Auto"按钮
 * 2、长按"bindContextMenu长按控制菜单"按钮后查看各个菜单属性
 * 3、鼠标右击"bindContextMenu右键控制菜单"按钮
 * 4、点击"bindContextMenu绑定自定义内容不支持镜像"按钮
 * 5、点击"验证bindContextMenu控制绑定菜单的属性(preview、offset、placement、arrowOffset)"按钮
 * 预期结果:
 * 2、菜单的显示和布局为（从左到右布局）
 * 3、同2
 * 4、list组件的显示和布局为（从左到右布局）（不支持镜像）
 * 5、同2
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MenuMirrorImage0010 {
  @Local currentDirection: Direction = Direction.Auto;
  @Local testLog: string[] = [];

  @Builder
  MenuBuilder() {
    Column() {
      Text(`菜单项1 - MenuItem 1`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0010_MenuItem1')
        .onClick(() => {
          this.addLog(`菜单项1点击`);
        })

      Divider()

      Text(`菜单项2 - MenuItem 2`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0010_MenuItem2')
        .onClick(() => {
          this.addLog(`菜单项2点击`);
        })

      Divider()

      Text(`菜单项3 - MenuItem 3`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0010_MenuItem3')
        .onClick(() => {
          this.addLog(`菜单项3点击`);
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
        Text(`自定义内容项1 - Custom Item 1`)
          .fontSize(14)
          .padding(10)
      }
      ListItem() {
        Text(`自定义内容项2 - Custom Item 2`)
          .fontSize(14)
          .padding(10)
      }
      ListItem() {
        Text(`自定义内容项3 - Custom Item 3`)
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
    if (this.testLog.length > 8) {
      this.testLog = this.testLog.slice(0, 8);
    }
    hilog.info(0x0000, 'MenuMirrorImage0010', log);
  }

  build() {
    Column({ space: 15 }) {
      Text(`ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0010`)
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text(`bindContextMenu首次渲染：简体中文+Auto`)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`测试条件：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`• 系统语言：简体中文\n• Direction: Auto\n• 测试 bindContextMenu 镜像渲染`)
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      // Direction 切换按钮
      Row({ space: 10 }) {
        Text(`当前Direction:`)
          .fontSize(14)
        
        Button(`Auto`)
          .fontSize(14)
          .backgroundColor(this.currentDirection === Direction.Auto ? Color.Blue : Color.Gray)
          .onClick(() => {
            this.currentDirection = Direction.Auto;
            this.addLog(`切换到 Direction.Auto`);
          })
          .id('MenuMirrorImage0010_DirectionAuto')
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      Divider().height(2).color('#EEEEEE')

      // 测试按钮区域
      Column({ space: 10 }) {
        Button(`长按触发菜单 - LongPress`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#4CAF50')
          .bindContextMenu(this.MenuBuilder, ResponseType.LongPress, {
            enableArrow: true
          })
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.addLog(`长按按钮，准备触发菜单`);
            }
          })
          .id('MenuMirrorImage0010_LongPressButton')
          .direction(this.currentDirection)

        Button(`右键触发菜单 - RightClick`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#2196F3')
          .bindContextMenu(this.MenuBuilder, ResponseType.RightClick, {
            enableArrow: true
          })
          .onClick(() => {
            this.addLog(`右键按钮（需要鼠标右键点击）`);
          })
          .id('MenuMirrorImage0010_RightClickButton')
          .direction(this.currentDirection)

        Button(`自定义内容（不支持镜像）`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#FF9800')
          .bindContextMenu(this.CustomContentBuilder, ResponseType.LongPress, {
            enableArrow: false
          })
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.addLog(`长按自定义内容按钮`);
            }
          })
          .id('MenuMirrorImage0010_CustomButton')
          .direction(this.currentDirection)

        Button(`验证菜单属性(offset/placement)`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#9C27B0')
          .bindContextMenu(this.MenuBuilder, ResponseType.LongPress, {
            enableArrow: true,
            offset: { x: 20, y: 10 },
            placement: Placement.Bottom
          })
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.addLog(`长按验证属性按钮`);
            }
          })
          .id('MenuMirrorImage0010_AttributeButton')
          .direction(this.currentDirection)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)

      Divider().height(2).color('#EEEEEE')

      Text(`预期结果：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`• 简体中文+Auto：菜单从左到右布局\n• 自定义内容：List组件从左到右布局（不支持镜像）\n• 验证offset、placement等属性生效`)
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
    .direction(this.currentDirection)
  }
}

