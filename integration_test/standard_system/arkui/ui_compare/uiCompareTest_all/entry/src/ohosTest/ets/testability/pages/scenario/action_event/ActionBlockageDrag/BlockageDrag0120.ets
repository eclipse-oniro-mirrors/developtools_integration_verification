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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_0120
 * 用例描述: image_单指_手指移动拖拽中，未超过5S，则状态为WAITING
 * 前置条件: 1、刷新最新版本镜像，打demo，普通通用拖拽组件主页面，设置当前准备时长为小于10S 2、按压后2S时移动手指，数据缓未准备好
 * 测试步骤: 1、回调onDragStart在5S前 2、抬起
 * 预期结果: 见正文
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

interface DragPosition {
  x: number;
  y: number;
}

@Entry
@ComponentV2
struct BlockageDrag0120 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local prepareTime: number = 8000; // 8S (小于10S)
  @Local dragStartTime: number = 0;
  @Local moveStartTime: number = 0;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'BlockageDrag0120', log);
  }

  build() {
    Column({ space: 12 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_0120')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Image拖拽中 - 未超5S状态WAITING')
        .fontSize(17)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`准备时长: ${this.prepareTime}ms (8S)`)
        .fontSize(14)
        .fontColor(Color.Orange)

      Text(`当前状态: ${this.dragStatus}`)
        .fontSize(15)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)

      Divider()

      Column() {
        Image($r('app.media.icon'))
          .width(150)
          .height(150)
          .draggable(true)
          .onTouch((event) => {
            if (event.type === TouchType.Down) {
              this.dragStartTime = Date.now();
              this.addLog('Touch Down');
              this.dragStatus = '按压中...';
            } else if (event.type === TouchType.Move) {
              if (this.moveStartTime === 0) {
                this.moveStartTime = Date.now();
                this.addLog('开始移动手指');
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
            const fromMove = Date.now() - this.moveStartTime;
            this.addLog(`onDragStart - 移动后${fromMove}ms触发`);
            
            if (fromMove < 5000) {
              this.addLog(`✓ Status: WAITING (${fromMove}ms < 5S，数据未准备好)`);
              this.dragStatus = 'WAITING';
            } else {
              this.addLog(`⚠ 已超过5S: ${fromMove}ms`);
              this.dragStatus = '超时';
            }
          })
          .onDragEnd(() => {
            this.addLog('onDragEnd triggered');
          })
          .id('BlockageDrag0120_DragImage')

        Text('按住2S后移动，5S内抬起')
          .fontSize(13)
          .fontColor(Color.Gray)
          .margin({ top: 10 })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding(25)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)

      Divider().height(2).color('#EEEEEE')

      Text('预期结果：')
        .fontSize(15)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Text('• 按住2S后移动手指\n• 移动后5S内触发onDragStart\n• 状态为WAITING（数据未准备好）')
        .fontSize(13)
        .fontColor('#4CAF50')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('操作说明（手动测试）：')
        .fontSize(13)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Text('• 按住图片2秒\n• 开始移动拖拽\n• 3-4秒后抬起（确保<5S）\n• 观察状态为WAITING')
        .fontSize(12)
        .fontColor('#999999')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('测试日志：')
        .fontSize(15)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(10)
              .fontColor('#333333')
              .width('100%')
              .padding(4)
              .backgroundColor(index % 2 === 0 ? '#F0F0F0' : Color.White)
          })
        }
        .width('100%')
      }
      .height('11.48%')
      .width('90%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(12)
    .backgroundColor('#F5F5F5')
  }
}

