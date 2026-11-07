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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_SCENARIOS_0290
 * 用例描述: 多次拖拽组件
 * 测试条件: 已更新最新版本镜像，编译demo
 * 测试步骤: 1、使用手指/鼠标，多次拖拽组件
 * 预期结果: 1-1、组件被正常拖动 1-2、拖动事件响应的各个回调时序正常 1-3、拖拽事件每次都有正确的闭环
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct DragScenarios0290 {
  @Local testLog: string[] = [];
  @Local dragCount: number = 0;
  @Local completedDrags: number = 0;
  @Local currentEventSequence: string[] = [];
  @Local allSequencesCorrect: boolean = true;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 50) {
      this.testLog = this.testLog.slice(0, 50);
    }
    hilog.info(0x0000, 'DragScenarios0290', log);
  }

  checkEventSequence(): boolean {
    const hasStart = this.currentEventSequence.includes('onDragStart');
    const hasEnd = this.currentEventSequence.includes('onDragEnd');
    return hasStart && hasEnd;
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_SCENARIOS_0290')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('多次拖拽组件')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 15 }) {
        Column() {
          Text('拖拽次数')
            .fontSize(11)
          Text(`${this.dragCount}`)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
        }
        Column() {
          Text('完成闭环')
            .fontSize(11)
          Text(`${this.completedDrags}`)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Green)
        }
        Column() {
          Text('全部正确')
            .fontSize(11)
          Text(`${this.allSequencesCorrect ? '✓' : '✗'}`)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.allSequencesCorrect ? Color.Green : Color.Red)
        }
      }

      Button('重置')
        .onClick(() => {
          this.dragCount = 0;
          this.completedDrags = 0;
          this.currentEventSequence = [];
          this.allSequencesCorrect = true;
          this.testLog = [];
          this.addLog('已重置，请多次拖拽测试');
        })
        .fontSize(12)
        .id('DragScenarios0290_ResetBtn')

      Divider().height(1).color('#EEEEEE')

      Text('多次拖拽下方组件：')
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Column() {
        Text('📦 多次拖拽测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        Text(`已拖拽 ${this.dragCount} 次`)
          .fontSize(14)
          .fontColor(Color.White)
          .margin({ top: 5 })
      }
      .width('27.78%')
      .height('8.2%')
      .backgroundColor('#673AB7')
      .justifyContent(FlexAlign.Center)
      .borderRadius(12)
      .draggable(true)
      .onDragStart(() => {
        this.currentEventSequence = ['onDragStart'];
        this.dragCount++;
        this.addLog(`[第${this.dragCount}次] onDragStart`);
      })
      .onDragEnd(() => {
        this.currentEventSequence.push('onDragEnd');
        const isCorrect = this.checkEventSequence();
        if (isCorrect) {
          this.completedDrags++;
          this.addLog(`[第${this.dragCount}次] onDragEnd - 闭环正确 ✓`);
        } else {
          this.allSequencesCorrect = false;
          this.addLog(`[第${this.dragCount}次] onDragEnd - 闭环异常 ✗`);
        }
      })
      .id('DragScenarios0290_DragItem')

      Divider().height(1).color('#EEEEEE')

      Text('预期:\n• 组件每次都被正常拖动\n• 每次回调时序正常\n• 每次拖拽都有正确闭环')
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
      .height('8.2%')
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

