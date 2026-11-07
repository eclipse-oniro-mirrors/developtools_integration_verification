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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_0860
 * 用例描述: Grid组件多选_鼠标_起拖时状态为READY
 * 测试条件: 选择多个组件，使用鼠标拖拽组件
 * 预期结果: log打印：aaa --- data ok，组件跟随鼠标移动
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

interface DragPosition {
  x: number;
  y: number;
}

@Entry
@ComponentV2
struct BlockageDrag0860 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local prepareTime: number = 0; // 立即就绪
  @Local pressStartTime: number = 0;
  @Local moveStartTime: number = 0;
  @Local selectedItems: number[] = [1, 2, 3]; // 默认多选
  @Local dataReady: boolean = false;
  @Local gridData: number[] = Array.from<number, number>({ length: 12 }, (_, i) => i + 1);

  aboutToAppear(): void {
    // 模拟数据准备 - 立即就绪
    setTimeout(() => {
      this.dataReady = true;
      this.addLog('aaa --- data ok');
    }, this.prepareTime);
  }

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'BlockageDrag0860', log);
  }

  toggleSelection(index: number): void {
    const pos = this.selectedItems.indexOf(index);
    if (pos > -1) {
      this.selectedItems = this.selectedItems.filter(item => item !== index);
    } else {
      this.selectedItems = [...this.selectedItems, index];
    }
    this.addLog(`Selected items: ${this.selectedItems.join(', ')}`);
  }

  isSelected(index: number): boolean {
    return this.selectedItems.includes(index);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_0860')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Grid多选鼠标 - 起拖时READY')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`准备时长: ${this.prepareTime}ms (立即就绪)`)
        .fontSize(13)
        .fontColor(Color.Orange)

      Text(`数据状态: ${this.dataReady ? '已就绪' : '准备中...'}`)
        .fontSize(13)
        .fontColor(this.dataReady ? Color.Green : Color.Orange)

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)

      Text(`已选中: ${this.selectedItems.length}项 [${this.selectedItems.join(', ')}]`)
        .fontSize(13)
        .fontColor(Color.Green)

      Divider()

      Column() {
        Text('可拖拽的Grid组件（多选）：')
          .fontSize(14)
          .fontColor('#333333')
          .margin({ bottom: 10 })
          .alignSelf(ItemAlign.Start)

        Grid() {
          ForEach(this.gridData, (item: number) => {
            GridItem() {
              Column() {
                Text(`${item}`)
                  .fontSize(20)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(this.isSelected(item) ? Color.White : Color.Black)
              }
              .width('100%')
              .height('6.56%')
              .backgroundColor(this.isSelected(item) ? '#4CAF50' : '#E0E0E0')
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
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            this.pressStartTime = Date.now();
            this.moveStartTime = 0;
            this.addLog('Mouse Down on Grid (多选)');
            this.dragStatus = '按压中...';
          } else if (event.type === TouchType.Move) {
            if (this.moveStartTime === 0) {
              this.moveStartTime = Date.now();
              const pressTime = this.moveStartTime - this.pressStartTime;
              this.addLog(`开始移动 - 按压时长: ${pressTime}ms`);
            }
          } else if (event.type === TouchType.Up) {
            this.addLog('Mouse Up');
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
          
          if (this.dataReady) {
            this.addLog('✓ aaa --- data ok，组件跟随鼠标移动');
            this.dragStatus = 'READY (数据就绪)';
          } else {
            this.addLog('✓ log不会打印：aaa --- data ok，组件不会跟随鼠标移动');
            this.dragStatus = 'WAITING (数据未就绪)';
          }
        })
        .onDragEnd(() => {
          this.addLog('onDragEnd triggered');
        })
        .id('BlockageDrag0860_Grid')

        Text('点击选中多个项目，然后使用鼠标拖拽Grid')
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

      Text('• 选择多个组件，使用鼠标拖拽组件\n• 结果: log打印：aaa --- data ok，组件跟随鼠标移动')
        .fontSize(12)
        .fontColor('#4CAF50')
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

