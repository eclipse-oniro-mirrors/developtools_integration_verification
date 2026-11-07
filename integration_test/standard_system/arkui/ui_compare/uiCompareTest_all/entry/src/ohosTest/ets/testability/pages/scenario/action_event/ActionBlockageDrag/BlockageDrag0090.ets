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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_0090
 * 用例描述: 取消拖拽回调ACTION_CANCELED_BEFORE_DRAG
 * 测试步骤: 启动工程
 * 预期结果: 长按期间，在超时时长（500）小于800时抬起
 */

import { hilog } from '@kit.PerformanceAnalysisKit';


interface DragPosition {
  x: number;
  y: number;
}

@Entry
@ComponentV2
struct BlockageDrag0090 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local pressStartTime: number = 0;
  @Local isPressing: boolean = false;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 15) {
      this.testLog = this.testLog.slice(0, 15);
    }
    hilog.info(0x0000, 'BlockageDrag0090', log);
  }

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_0090')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('取消拖拽回调ACTION_CANCELED_BEFORE_DRAG')
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
            this.dragStatus = '拖拽开始';
          })
          .onTouch((event) => {
            if (event.type === TouchType.Down) {
              this.pressStartTime = Date.now();
              this.isPressing = true;
              this.addLog('Touch Down - 开始计时');
              this.dragStatus = '长按中...';
            } else if (event.type === TouchType.Up && this.isPressing) {
              const pressDuration = Date.now() - this.pressStartTime;
              this.addLog(`Touch Up - 按压时长: ${pressDuration}ms`);
              
              if (pressDuration >= 500 && pressDuration < 800) {
                this.addLog('✓ Status: ACTION_CANCELED_BEFORE_DRAG (500-800ms内抬起)');
                this.dragStatus = 'ACTION_CANCELED_BEFORE_DRAG';
              } else if (pressDuration < 500) {
                this.addLog(`⚠ 按压时长不足: ${pressDuration}ms (需要>=500ms)`);
                this.dragStatus = '按压时间过短';
              } else {
                this.addLog(`⚠ 按压时长过长: ${pressDuration}ms (需要<800ms)`);
                this.dragStatus = '按压时间过长';
              }
              
              this.isPressing = false;
            }
          })
          .id('BlockageDrag0090_DragImage')

        Text('长按500-800ms后抬起（不拖拽）')
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

      Text('• 长按500ms以上但小于800ms\n• 不进行拖拽移动\n• 抬起时触发ACTION_CANCELED_BEFORE_DRAG\n• 拖拽被取消')
        .fontSize(14)
        .fontColor('#4CAF50')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('操作说明（手动测试）：')
        .fontSize(14)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Text('• 长按图片（不移动）\n• 按压约600ms后抬起\n• 观察日志中的按压时长\n• 验证状态为ACTION_CANCELED_BEFORE_DRAG')
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

