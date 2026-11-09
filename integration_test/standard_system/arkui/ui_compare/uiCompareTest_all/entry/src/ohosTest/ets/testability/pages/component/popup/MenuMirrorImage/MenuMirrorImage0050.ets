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
 * 用例ID: ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0050
 * 用例描述: bindContextMenu首次渲染：繁体中文+Auto
 * 预置条件:
 * 1、创建一个button组件和menu组件
 * 2、设置-》系统-》语言和地区-》选择 繁体中文
 * 测试步骤: 同0010
 * 预期结果: 菜单从左到右布局
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MenuMirrorImage0050 {
  @Local currentDirection: Direction = Direction.Auto;
  @Local testLog: string[] = [];

  @Builder
  MenuBuilder() {
    Column() {
      Text(`菜單項1 - MenuItem 1`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0050_MenuItem1')
        .onClick(() => {
          this.addLog(`菜單項1點擊`);
        })

      Divider()

      Text(`菜單項2 - MenuItem 2`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0050_MenuItem2')
        .onClick(() => {
          this.addLog(`菜單項2點擊`);
        })

      Divider()

      Text(`菜單項3 - MenuItem 3`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0050_MenuItem3')
        .onClick(() => {
          this.addLog(`菜單項3點擊`);
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
        Text(`自定義內容項1 - Custom Item 1`)
          .fontSize(14)
          .padding(10)
      }
      ListItem() {
        Text(`自定義內容項2 - Custom Item 2`)
          .fontSize(14)
          .padding(10)
      }
      ListItem() {
        Text(`自定義內容項3 - Custom Item 3`)
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
    hilog.info(0x0000, 'MenuMirrorImage0050', log);
  }

  build() {
    Column({ space: 15 }) {
      Text(`ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0050`)
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text(`bindContextMenu首次渲染：繁體中文+Auto`)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`測試條件：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`• 系統語言：繁體中文\n• Direction: Auto\n• 測試 bindContextMenu 鏡像渲染`)
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Row({ space: 10 }) {
        Text(`當前Direction: Auto`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Blue)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)

      Divider().height(2).color('#EEEEEE')

      Column({ space: 10 }) {
        Button(`長按觸發菜單 - LongPress`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#4CAF50')
          .bindContextMenu(this.MenuBuilder, ResponseType.LongPress, {
            enableArrow: true
          })
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.addLog(`長按按鈕，準備觸發菜單`);
            }
          })
          .id('MenuMirrorImage0050_LongPressButton')
          .direction(this.currentDirection)

        Button(`右鍵觸發菜單 - RightClick`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#2196F3')
          .bindContextMenu(this.MenuBuilder, ResponseType.RightClick, {
            enableArrow: true
          })
          .onClick(() => {
            this.addLog(`右鍵按鈕（需要滑鼠右鍵點擊）`);
          })
          .id('MenuMirrorImage0050_RightClickButton')
          .direction(this.currentDirection)

        Button(`自定義內容（不支持鏡像）`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#FF9800')
          .bindContextMenu(this.CustomContentBuilder, ResponseType.LongPress, {
            enableArrow: false
          })
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.addLog(`長按自定義內容按鈕`);
            }
          })
          .id('MenuMirrorImage0050_CustomButton')
          .direction(this.currentDirection)

        Button(`驗證菜單屬性(offset/placement)`)
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
              this.addLog(`長按驗證屬性按鈕`);
            }
          })
          .id('MenuMirrorImage0050_AttributeButton')
          .direction(this.currentDirection)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)

      Divider().height(2).color('#EEEEEE')

      Text(`預期結果：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`• 繁體中文+Auto：菜單從左到右布局\n• 自定義內容：List組件從左到右布局（不支持鏡像）`)
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text(`測試日誌：`)
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

