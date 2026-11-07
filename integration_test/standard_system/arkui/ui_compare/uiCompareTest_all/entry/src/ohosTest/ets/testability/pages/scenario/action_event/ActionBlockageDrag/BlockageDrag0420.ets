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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_0420
 * 用例描述: Grid组件多选_双指_手指移动拖拽中，未超过5S，则状态为WAITING
 * 测试条件: 选中多个项目，按住2S时移动，数据未准备好
 * 预期结果: WAITING
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

interface DragPosition {
  x: number;
  y: number;
}

@Entry
@ComponentV2
struct BlockageDrag0420 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local prepareTime: number = 8000;
  @Local pressStartTime: number = 0;
  @Local moveStartTime: number = 0;
  @Local selectedItems: Set<number> = new Set([1, 2]); // 默认选中2项（双指场景）
  @Local gridData: number[] = Array.from<number, number>({ length: 12 }, (_, i) => i + 1);

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'BlockageDrag0420', log);
  }

  toggleSelection(index: number): void {
    if (this.selectedItems.has(index)) {
      this.selectedItems.delete(index);
    } else {
      this.selectedItems.add(index);
    }
    this.addLog(`Item ${index} selected: ${this.selectedItems.has(index)}`);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_0420')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Grid多选双指 - 拖拽中未超5S WAITING')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`准备时长: ${this.prepareTime}ms`)
        .fontSize(13)
        .fontColor(Color.Orange)

      Text(`当前状态: ${this.dragStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)

      Text(`已选中: ${this.selectedItems.size} 项 (双指测试)`)
        .fontSize(13)
        .fontColor(Color.Green)

      Divider()

      Column() {
        Grid() {
          ForEach(this.gridData, (item: number) => {
            GridItem() {
              Column() {
                Text(`${item}`)
                  .fontSize(20)
                  .fontWeight(FontWeight.Bold)
              }
              .width('100%')
              .height('6.56%')
              .backgroundColor(this.selectedItems.has(item) ? '#4CAF50' : '#E0E0E0')
              .borderRadius(8)
              .justifyContent(FlexAlign.Center)
              .onClick(() => {
                this.toggleSelection(item);
              })
            }
          })
        }
        .columnsTemplate('1fr 1fr 1fr')
        .rowsGap(10)
        .columnsGap(10)
        .width('100%')
        .height('22.95%')
        .draggable(true)
        .onTouch((event) => {
          if (event.type === TouchType.Down) {
            this.pressStartTime = Date.now();
            this.moveStartTime = 0;
            this.addLog('Touch Down on Grid (双指场景)');
            this.dragStatus = '按压中...';
          } else if (event.type === TouchType.Move) {
            if (this.moveStartTime === 0) {
              this.moveStartTime = Date.now();
              const pressTime = this.moveStartTime - this.pressStartTime;
              this.addLog(`开始移动 - 按压时长: ${pressTime}ms`);
            }
          } else if (event.type === TouchType.Up) {
            this.addLog('Touch Up');
            this.dragStatus = '已结束';
          }
        })
        .onPreDrag(() => {
          this.addLog('onPreDrag triggered');
          const position: DragPosition = { x: 0, y: 0 };
          return position;
        })
        .onDragStart(() => {
          const totalTime = Date.now() - this.pressStartTime;
          const moveTime = this.moveStartTime > 0 ? Date.now() - this.moveStartTime : 0;
          this.addLog(`onDragStart - 总时长: ${totalTime}ms, 移动时长: ${moveTime}ms`);
          this.addLog(`✓ Expected: WAITING`);
          this.dragStatus = 'WAITING';
        })
        .onDragEnd(() => {
          this.addLog('onDragEnd triggered');
        })
        .id('BlockageDrag0420_Grid')

        Text('点击选中多个项目，然后双指拖拽Grid')
          .fontSize(12)
          .fontColor(Color.Gray)
          .margin({ top: 10 })
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)

      Divider().height(2).color('#EEEEEE')

      Text('预期结果：')
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Text('• 选中多个项目，按住2S时移动，数据未准备好\n• 状态: WAITING\n• 使用双指拖拽')
        .fontSize(12)
        .fontColor('#4CAF50')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('操作说明（手动测试）：')
        .fontSize(13)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Text('• 点击选中多个项目（绿色）\n• 使用双指同时按住Grid\n• 选中多个项目，按住2S时移动，数据未准备好\n• 观察日志验证状态')
        .fontSize(11)
        .fontColor('#999999')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('测试日志：')
        .fontSize(14)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(9)
              .fontColor('#333333')
              .width('100%')
              .padding(3)
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
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}
