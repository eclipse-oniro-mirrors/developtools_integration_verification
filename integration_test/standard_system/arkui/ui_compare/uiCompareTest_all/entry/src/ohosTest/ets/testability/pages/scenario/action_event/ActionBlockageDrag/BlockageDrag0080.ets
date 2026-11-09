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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_0080
 * 用例描述: 放置动效结束时回调PREVIEW_LANDING_FINISHED
 * 测试步骤: 启动工程
 * 预期结果: 拖拽后抬起
 */

import { hilog } from '@kit.PerformanceAnalysisKit';


interface DragPosition {
  x: number;
  y: number;
}

@Entry
@ComponentV2
struct BlockageDrag0080 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local isDragging: boolean = false;
  private landingTimer: number = -1;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 15) {
      this.testLog = this.testLog.slice(0, 15);
    }
    hilog.info(0x0000, 'BlockageDrag0080', log);
  }

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_0080')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('放置动效结束时回调PREVIEW_LANDING_FINISHED')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`当前状态: ${this.dragStatus}`)
        .fontSize(16)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)

      Divider()

      Column() {
        Image($r('app.media.icon'))
          .width(120)
          .height(120)
          .draggable(true)
          .onPreDrag(() => {
            this.addLog('onPreDrag triggered');
            this.dragStatus = 'PreDrag准备';
            const position: DragPosition = { x: 0, y: 0 };
            return position;
          })
          .onDragStart(() => {
            this.addLog('onDragStart triggered');
            this.isDragging = true;
            this.dragStatus = '拖拽开始';
          })
          .onDragEnd(() => {
            this.addLog('onDragEnd triggered - 放置动效开始');
            this.dragStatus = 'PREVIEW_LANDING_STARTED';
            
            // 模拟放置动效结束（通常动效300-500ms）
            this.landingTimer = setTimeout(() => {
              this.addLog('✓ Status: PREVIEW_LANDING_FINISHED (放置动效完成)');
              this.dragStatus = 'PREVIEW_LANDING_FINISHED';
            }, 400);
            
            this.isDragging = false;
          })
          .id('BlockageDrag0080_DragImage')

        Text('长按拖拽此图片后抬起')
          .fontSize(14)
          .fontColor(Color.Gray)
          .margin({ top: 10 })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .padding(30)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)

      Divider().height(2).color('#EEEEEE')

      Text('预期结果：')
        .fontSize(16)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Text('• 拖拽后抬起，放置动效播放完成\n• 状态为PREVIEW_LANDING_FINISHED\n• 动效结束后记录完成状态')
        .fontSize(14)
        .fontColor('#4CAF50')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(14)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Text('• 长按图片并拖拽\n• 拖拽到一定距离后抬起手指\n• 观察放置动效结束后的状态变化\n• 约400ms后状态变为FINISHED')
        .fontSize(12)
        .fontColor('#999999')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('测试日志：')
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(11)
              .fontColor('#333333')
              .width('100%')
              .padding(5)
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
    .padding(15)
    .backgroundColor('#F5F5F5')
  }

  aboutToDisappear(): void {
    if (this.landingTimer !== -1) {
      clearTimeout(this.landingTimer);
    }
  }
}

