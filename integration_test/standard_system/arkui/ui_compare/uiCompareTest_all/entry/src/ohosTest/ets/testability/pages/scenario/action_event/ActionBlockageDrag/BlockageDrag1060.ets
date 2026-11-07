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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_1060
 * 用例描述: 等待的5S内，松开鼠标，取消拖拽
 * 测试条件: 1、设置当前加载时间：10S
 * 测试步骤: 使用鼠标拖拽组件<5S时，松开鼠标
 * 预期结果: 拖拽取消，回调onDragEnd
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct BlockageDrag1060 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local prepareTime: number = 10000; // 10S加载时间
  @Local dataReady: boolean = false;
  @Local dragStartTime: number = 0;
  @Local dragEndCalled: boolean = false;

  aboutToAppear(): void {
    // 模拟10S数据准备
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
    hilog.info(0x0000, 'BlockageDrag1060', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_1060')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('等待5S内松开鼠标 - 取消拖拽')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`加载时间: ${this.prepareTime / 1000}S`)
        .fontSize(13)
        .fontColor(Color.Orange)

      Text(`数据状态: ${this.dataReady ? '已就绪' : '准备中...'}`)
        .fontSize(13)
        .fontColor(this.dataReady ? Color.Green : Color.Orange)

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)

      Text(`onDragEnd回调: ${this.dragEndCalled ? '已触发 ✓' : '未触发'}`)
        .fontSize(14)
        .fontColor(this.dragEndCalled ? Color.Green : Color.Gray)

      Divider()

      Column() {
        Text('可拖拽组件（使用鼠标）：')
          .fontSize(14)
          .fontColor('#333333')
          .margin({ bottom: 10 })
          .alignSelf(ItemAlign.Start)

        Column() {
          Text('鼠标拖拽我')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
          Text('<5S松开')
            .fontSize(14)
            .fontColor(Color.White)
        }
        .width('27.78%')
        .height('8.2%')
        .backgroundColor('#673AB7')
        .borderRadius(12)
        .justifyContent(FlexAlign.Center)
        .draggable(true)
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            this.dragStartTime = Date.now();
            this.dragEndCalled = false;
            this.dragStatus = '按下中...';
            this.addLog('Mouse Down');
          } else if (event.type === TouchType.Up) {
            const dragTime = Date.now() - this.dragStartTime;
            this.addLog(`Mouse Up - 拖拽时长: ${dragTime}ms`);
            if (dragTime < 5000 && !this.dataReady) {
              this.addLog('✓ 拖拽时间<5S且数据未就绪，拖拽取消');
            }
            this.dragStatus = '已结束';
          }
        })
        .onDragStart(() => {
          this.addLog('onDragStart triggered');
          this.dragStatus = '拖拽中...';
        })
        .onDragEnd(() => {
          const dragTime = Date.now() - this.dragStartTime;
          this.addLog(`onDragEnd triggered - 拖拽时长: ${dragTime}ms ✓`);
          this.dragEndCalled = true;
          this.dragStatus = '拖拽结束';
        })
        .id('BlockageDrag1060_Component')

        Text('使用鼠标拖拽组件，5S内松开鼠标')
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

      Text('• 使用鼠标拖拽组件<5S时，松开鼠标\n• 结果: 拖拽取消，回调onDragEnd')
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

