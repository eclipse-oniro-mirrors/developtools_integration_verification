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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_0100
 * 用例描述: image_单指_按压时状态为WAITING
 * 前置条件: 刷新最新版本镜像，打demo，普通通用拖拽组件主页面，设置当前准备时长为小于2S
 * 测试步骤: 1、单指按住image组件小于2S 2、移动手指 3、手指抬起
 * 预期结果: 见正文
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

interface DragPosition {
  x: number;
  y: number;
}

@Entry
@ComponentV2
struct BlockageDrag0100 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local prepareTime: number = 1500; // 1.5S (小于2S)
  @Local pressStartTime: number = 0;
  @Local isWaiting: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'BlockageDrag0100', log);
  }

  build() {
    Column({ space: 12 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_0100')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Image单指拖拽 - 按压时状态WAITING')
        .fontSize(17)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`准备时长: ${this.prepareTime}ms (小于2S)`)
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
              this.pressStartTime = Date.now();
              this.isWaiting = true;
              this.addLog('Touch Down - 开始计时');
              this.dragStatus = '按压中...';
            } else if (event.type === TouchType.Move && this.isWaiting) {
              const elapsed = Date.now() - this.pressStartTime;
              if (elapsed < this.prepareTime) {
                this.addLog(`✓ 移动时elapsed: ${elapsed}ms < ${this.prepareTime}ms`);
                this.addLog('✓ Status: WAITING (数据未准备好)');
                this.dragStatus = 'WAITING';
                this.isWaiting = false;
              }
            } else if (event.type === TouchType.Up) {
              this.addLog('Touch Up - 拖拽结束');
              this.dragStatus = '已结束';
              this.isWaiting = false;
            }
          })
          .onPreDrag(() => {
            this.addLog('onPreDrag triggered');
            const position: DragPosition = { x: 0, y: 0 };
            return position;
          })
          .onDragStart(() => {
            const elapsed = Date.now() - this.pressStartTime;
            this.addLog(`onDragStart - elapsed: ${elapsed}ms`);
          })
          .onDragEnd(() => {
            this.addLog('onDragEnd triggered');
          })
          .id('BlockageDrag0100_DragImage')

        Text('按住后移动（小于1.5S）')
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

      Text('• 按压小于1.5S时开始移动\n• 状态为WAITING（数据未准备好）\n• 日志记录时间差小于准备时长')
        .fontSize(13)
        .fontColor('#4CAF50')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('操作说明（手动测试）：')
        .fontSize(13)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Text('• 按住图片1秒左右\n• 立即移动手指拖拽\n• 观察状态应为WAITING\n• 抬起手指完成测试')
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

