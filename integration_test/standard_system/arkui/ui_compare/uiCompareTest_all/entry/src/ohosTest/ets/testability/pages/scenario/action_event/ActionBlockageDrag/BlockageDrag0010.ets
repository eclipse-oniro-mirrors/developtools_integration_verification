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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_0010
 * 用例描述: onPreDrag中调用PREPARING_FOR_DRAG_DETECTION
 * 测试步骤: 启动工程
 * 预期结果: onPreDrag中调用PREPARING_FOR_DRAG_DETECTION
 */

import { hilog } from '@kit.PerformanceAnalysisKit';


interface DragPosition {
  x: number;
  y: number;
}

@Entry
@ComponentV2
struct BlockageDrag0010 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 15) {
      this.testLog = this.testLog.slice(0, 15);
    }
    hilog.info(0x0000, 'BlockageDrag0010', log);
  }

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_0010')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('onPreDrag中调用PREPARING_FOR_DRAG_DETECTION')
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
            this.addLog('onPreDrag triggered - Status: PREPARING_FOR_DRAG_DETECTION');
            this.dragStatus = 'PREPARING_FOR_DRAG_DETECTION';
            const position: DragPosition = { x: 0, y: 0 };
            return position;
          })
          .onDragStart(() => {
            this.addLog('onDragStart triggered');
            this.dragStatus = '拖拽开始';
          })
          .onDragEnd(() => {
            this.addLog('onDragEnd triggered');
            this.dragStatus = '拖拽结束';
          })
          .id('BlockageDrag0010_DragImage')

        Text('长按拖拽此图片')
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

      Text('• 长按图片时触发onPreDrag\n• 状态显示PREPARING_FOR_DRAG_DETECTION\n• 日志记录状态变化')
        .fontSize(14)
        .fontColor('#4CAF50')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(14)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Text('• 长按图片触发拖拽\n• 观察状态变化\n• 查看日志记录')
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
}

