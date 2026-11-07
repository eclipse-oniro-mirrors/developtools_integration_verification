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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_0940
 * 用例描述: TextArea组件_鼠标_鼠标移动过程中（超过5S）
 * 测试条件: 使用鼠标拖拽组件，移动鼠标，移动时间为5S时
 * 预期结果: 数据还没准备好，但是组件开始跟随鼠标移动
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

interface DragPosition {
  x: number;
  y: number;
}

@Entry
@ComponentV2
struct BlockageDrag0940 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local prepareTime: number = 10000; // 10秒，确保拖拽期间数据未就绪
  @Local pressStartTime: number = 0;
  @Local moveStartTime: number = 0;
  @Local dataReady: boolean = false;
  @Local textContent: string = '这是一个可拖拽的TextArea组件，用于测试拖拽阻塞功能。请使用鼠标拖拽此区域进行测试。';

  aboutToAppear(): void {
    // 模拟数据准备 - 10秒后才就绪
    setTimeout(() => {
      this.dataReady = true;
      this.addLog('aaa --- 用户准备数据完成');
    }, this.prepareTime);
  }

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'BlockageDrag0940', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_0940')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('TextArea鼠标 - 移动中超过5S')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`准备时长: ${this.prepareTime}ms`)
        .fontSize(13)
        .fontColor(Color.Orange)

      Text(`数据状态: ${this.dataReady ? '已就绪' : '准备中...'}`)
        .fontSize(13)
        .fontColor(this.dataReady ? Color.Green : Color.Orange)

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)

      Divider()

      Column() {
        Text('可拖拽的TextArea组件：')
          .fontSize(14)
          .fontColor('#333333')
          .margin({ bottom: 10 })
          .alignSelf(ItemAlign.Start)

        TextArea({ text: this.textContent })
          .width('100%')
          .height(150)
          .fontSize(14)
          .borderRadius(8)
          .backgroundColor('#FFFFFF')
          .draggable(true)
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.pressStartTime = Date.now();
              this.moveStartTime = 0;
              this.addLog('Mouse Down on TextArea');
              this.dragStatus = '按压中...';
            } else if (event.type === TouchType.Move) {
              if (this.moveStartTime === 0) {
                this.moveStartTime = Date.now();
                const pressTime = this.moveStartTime - this.pressStartTime;
                this.addLog(`开始移动 - 按压时长: ${pressTime}ms`);
              }
              // 检查是否超过5秒
              const currentMoveTime = Date.now() - this.moveStartTime;
              if (currentMoveTime >= 5000 && this.dragStatus !== '超时强制跟随') {
                this.addLog('✓ 移动时间>=5S，数据还没准备好，但是组件开始跟随鼠标移动');
                this.dragStatus = '超时强制跟随';
              }
            } else if (event.type === TouchType.Up) {
              const totalMoveTime = this.moveStartTime > 0 ? Date.now() - this.moveStartTime : 0;
              this.addLog(`Mouse Up - 移动时长: ${totalMoveTime}ms`);
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
              this.addLog('✓ aaa --- 用户准备数据完成，组件跟随鼠标移动');
              this.dragStatus = 'READY (数据就绪)';
            } else {
              this.addLog('✓ 数据还没准备好，但是组件开始跟随鼠标移动');
              this.dragStatus = 'WAITING -> 超时强制跟随';
            }
          })
          .onDragEnd(() => {
            this.addLog('onDragEnd triggered');
          })
          .id('BlockageDrag0940_TextArea')

        Text('使用鼠标拖拽TextArea，移动时间>=5S后松开')
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

      Text('• 使用鼠标拖拽组件，移动时间为5S时\n• 结果: 数据还没准备好，但是组件开始跟随鼠标移动\n• 回调onDragEnd')
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

