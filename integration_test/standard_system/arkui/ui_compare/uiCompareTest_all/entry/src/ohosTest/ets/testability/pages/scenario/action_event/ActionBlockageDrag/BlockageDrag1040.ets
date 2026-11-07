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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_1040
 * 用例描述: 等待的5S内松手，取消拖拽
 * 测试条件: 1、设置当前加载时间：10S 2、长按组件2S时移动手指，回调onDragStart
 * 测试步骤: 移动手指5S内，抬手
 * 预期结果: 拖拽取消，回调onDragEnd
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct BlockageDrag1040 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local prepareTime: number = 10000; // 10S加载时间
  @Local dataReady: boolean = false;
  @Local pressStartTime: number = 0;
  @Local moveStartTime: number = 0;
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
    hilog.info(0x0000, 'BlockageDrag1040', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_1040')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('等待5S内松手 - 取消拖拽')
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
        Text('可拖拽组件：')
          .fontSize(14)
          .fontColor('#333333')
          .margin({ bottom: 10 })
          .alignSelf(ItemAlign.Start)

        Column() {
          Text('长按2S后移动')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
          Text('5S内抬手')
            .fontSize(14)
            .fontColor(Color.White)
        }
        .width('27.78%')
        .height('8.2%')
        .backgroundColor('#3F51B5')
        .borderRadius(12)
        .justifyContent(FlexAlign.Center)
        .draggable(true)
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            this.pressStartTime = Date.now();
            this.moveStartTime = 0;
            this.dragEndCalled = false;
            this.dragStatus = '长按中...';
            this.addLog('Touch Down - 开始长按');
          } else if (event.type === TouchType.Move) {
            if (this.moveStartTime === 0) {
              this.moveStartTime = Date.now();
              const pressTime = this.moveStartTime - this.pressStartTime;
              this.addLog(`开始移动 - 长按时长: ${pressTime}ms`);
            }
          } else if (event.type === TouchType.Up) {
            const totalTime = Date.now() - this.pressStartTime;
            const moveTime = this.moveStartTime > 0 ? Date.now() - this.moveStartTime : 0;
            this.addLog(`Touch Up - 总时长: ${totalTime}ms, 移动时长: ${moveTime}ms`);
            if (moveTime > 0 && moveTime < 5000 && !this.dataReady) {
              this.addLog('✓ 等待5S内松手，拖拽取消');
            }
            this.dragStatus = '已结束';
          }
        })
        .onDragStart(() => {
          const totalTime = Date.now() - this.pressStartTime;
          this.addLog(`onDragStart - 总时长: ${totalTime}ms`);
          this.dragStatus = '拖拽中（等待数据）...';
        })
        .onDragEnd(() => {
          this.addLog('onDragEnd triggered ✓');
          this.dragEndCalled = true;
          this.dragStatus = '拖拽结束';
        })
        .id('BlockageDrag1040_Component')

        Text('步骤：长按2S → 移动手指 → 5S内抬手')
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

      Text('• 移动手指5S内，抬手\n• 结果: 拖拽取消，回调onDragEnd')
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
      .height('8.2%')
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

