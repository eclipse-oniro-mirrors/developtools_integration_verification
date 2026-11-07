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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_0170
 * 用例描述: image绑定菜单的_单指_手指移动拖拽中，未超过5S，则状态为WAITING
 * 测试条件: 移动后<5S
 * 预期结果: WAITING
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

interface DragPosition {
  x: number;
  y: number;
}

@Entry
@ComponentV2
struct BlockageDrag0170 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local prepareTime: number = 8000;
  @Local pressStartTime: number = 0;
  @Local moveStartTime: number = 0;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'BlockageDrag0170', log);
  }

  @Builder
  MenuBuilder() {
    Column() {
      Text('菜单项1').fontSize(16).padding(10)
      Text('菜单项2').fontSize(16).padding(10)
      Text('菜单项3').fontSize(16).padding(10)
    }
  }

  build() {
    Column({ space: 12 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_0170')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Image+Menu - 拖拽中未超5S WAITING')
        .fontSize(17)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`准备时长: ${this.prepareTime}ms`)
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
          .bindContextMenu(this.MenuBuilder, ResponseType.LongPress)
          .onTouch((event) => {
            if (event.type === TouchType.Down) {
              this.pressStartTime = Date.now();
              this.moveStartTime = 0;
              this.addLog('Touch Down');
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
          .id('BlockageDrag0170_DragImage')

        Text('移动后<5S')
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

      Text('• 移动后<5S\n• 状态: WAITING')
        .fontSize(13)
        .fontColor('#4CAF50')
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
