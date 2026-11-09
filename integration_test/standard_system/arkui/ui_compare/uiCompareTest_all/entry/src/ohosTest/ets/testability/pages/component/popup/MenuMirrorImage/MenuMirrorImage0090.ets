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
 * 用例ID: ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0090
 * 用例描述: bindContextMenu首次渲染：英語+Auto
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct MenuMirrorImage0090 {
  @Local currentDirection: Direction = Direction.Auto;
  @Local testLog: string[] = [];

  @Builder
  MenuBuilder() {
    Column() {
      Text(`Menu Item1 - Menu Item 1`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0090_MenuItem1')
        .onClick(() => {
          this.addLog(`Menu Item1點擊`);
        })

      Divider()

      Text(`Menu Item2 - Menu Item 2`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0090_MenuItem2')
        .onClick(() => {
          this.addLog(`Menu Item2點擊`);
        })

      Divider()

      Text(`Menu Item3 - Menu Item 3`)
        .fontSize(16)
        .padding(10)
        .width('100%')
        .id('MenuMirrorImage0090_MenuItem3')
        .onClick(() => {
          this.addLog(`Menu Item3點擊`);
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
        Text(`Custom Item1 - Custom Item 1`)
          .fontSize(14)
          .padding(10)
      }
      ListItem() {
        Text(`Custom Item2 - Custom Item 2`)
          .fontSize(14)
          .padding(10)
      }
      ListItem() {
        Text(`Custom Item3 - Custom Item 3`)
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
    hilog.info(0x0000, 'MenuMirrorImage0090', log);
  }

  build() {
    Column({ space: 15 }) {
      Text(`ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_MIRRORIMAG_0090`)
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text(`bindContextMenu首次渲染：英語+Auto`)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`測試條件：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`• 系統語言：English\n• Direction: Auto`)
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Column({ space: 10 }) {
        Button(`Long Press Trigger`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#4CAF50')
          .bindContextMenu(this.MenuBuilder, ResponseType.LongPress, {
            enableArrow: true
          })
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.addLog(`Long press button`);
            }
          })
          .id('MenuMirrorImage0090_LongPressButton')          .direction(this.currentDirection)

        Button(`Right Click Trigger`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#2196F3')
          .bindContextMenu(this.MenuBuilder, ResponseType.RightClick, {
            enableArrow: true
          })
          .onClick(() => {
            this.addLog(`Right click button`);
          })
          .id('MenuMirrorImage0090_RightClickButton')          .direction(this.currentDirection)

        Button(`Custom Content`)
          .fontSize(16)
          .width('90%')
          .backgroundColor('#FF9800')
          .bindContextMenu(this.CustomContentBuilder, ResponseType.LongPress, {
            enableArrow: false
          })
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.addLog(`Custom content button`);
            }
          })
          .id('MenuMirrorImage0090_CustomButton')          .direction(this.currentDirection)

        Button(`Verify Attributes`)
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
              this.addLog(`Verify attributes`);
            }
          })
          .id('MenuMirrorImage0090_AttributeButton')          .direction(this.currentDirection)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)

      Divider().height(2).color('#EEEEEE')

      Text(`預期結果：`)
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`• 英語+Auto：菜單從左到右布局`)
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text(`Test Log:`)
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
    .backgroundColor('#F5F5F5')    .direction(this.currentDirection)
  }
}
