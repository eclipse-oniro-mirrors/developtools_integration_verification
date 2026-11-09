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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_VIBRATION_0460
 * 用例描述: 压力测试有蒙及菜单连续拖拽移动50次
 * 测试条件: 1.安装测试应用 2.设置震动权限为true，即draggable为true
 * 测试步骤: bindcontextMenu自定义菜单，连续拖拽移动50次
 * 预期结果: 触发震动50次
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct DragVibration0460 {
  @Local testLog: string[] = [];
  @Local dragCount: number = 0;
  @Local vibrationCount: number = 0;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 50) {
      this.testLog = this.testLog.slice(0, 50);
    }
    hilog.info(0x0000, 'DragVibration0460', log);
  }

  @Builder
  customMenu() {
    Column() {
      Text('复制')
        .fontSize(14)
        .padding(10)
        .onClick(() => {
          this.addLog('点击复制');
        })
      Divider()
      Text('粘贴')
        .fontSize(14)
        .padding(10)
        .onClick(() => {
          this.addLog('点击粘贴');
        })
      Divider()
      Text('删除')
        .fontSize(14)
        .padding(10)
        .onClick(() => {
          this.addLog('点击删除');
        })
    }
    .width('100%')
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 5, color: '#00000030', offsetX: 0, offsetY: 2 })
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_VIBRATION_0460')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('压力测试 - 菜单连续拖拽50次')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 30 }) {
        Column() {
          Text('拖拽次数')
            .fontSize(11)
          Text(`${this.dragCount}`)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
        }
        Column() {
          Text('震动次数')
            .fontSize(11)
          Text(`${this.vibrationCount}`)
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Green)
        }
        Column() {
          Text('目标')
            .fontSize(11)
          Text('50次')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Orange)
        }
      }

      Button('重置计数')
        .onClick(() => {
          this.dragCount = 0;
          this.vibrationCount = 0;
          this.testLog = [];
          this.addLog('计数已重置');
        })
        .fontSize(12)
        .id('DragVibration0460_ResetBtn')

      Divider().height(1).color('#EEEEEE')

      Column() {
        Text('长按显示菜单，然后拖拽此区域：')
          .fontSize(12)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 10 })

        Column() {
          Text('📦 可拖拽组件')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
          Text('长按显示菜单后拖拽')
            .fontSize(12)
            .fontColor(Color.White)
            .margin({ top: 5 })
        }
        .width('100%')
        .height('9.84%')
        .backgroundColor('#9C27B0')
        .justifyContent(FlexAlign.Center)
        .borderRadius(8)
        .draggable(true)
        .bindContextMenu(this.customMenu, ResponseType.LongPress)
        .onDragStart(() => {
          this.dragCount++;
          this.vibrationCount++;
          this.addLog(`第 ${this.dragCount} 次拖拽，震动触发`);
        })
        .id('DragVibration0460_DragArea')
      }
      .width('100%')
      .padding(10)

      Divider().height(1).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 长按紫色区域显示菜单\n2. 拖拽移动\n3. 重复操作50次\n4. 观察震动是否触发50次')
        .fontSize(11)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('预期: 触发震动50次')
        .fontSize(10)
        .fontColor('#4CAF50')

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(9)
              .fontColor('#333333')
              .width('100%')
              .padding(2)
              .backgroundColor(index % 2 === 0 ? '#F5F5F5' : Color.White)
          })
        }
        .width('100%')
      }
      .height('6.56%')
      .width('95%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
    }
    .width('100%')
    .height('100%')
    .padding(8)
    .backgroundColor('#F5F5F5')
  }
}

