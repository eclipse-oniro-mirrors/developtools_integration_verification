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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_1020
 * 用例描述: 长按过程中，另一只手指点击组件外的区域，取消拖拽
 * 测试条件: 手指长按组件，另一只手指点击组件外的区域
 * 预期结果: 拖拽取消
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct BlockageDrag1020 {
  @Local testLog: string[] = [];
  @Local dragStatus: string = '未开始';
  @Local dragCancelled: boolean = false;
  @Local pressStartTime: number = 0;
  @Local outsideClickCount: number = 0;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'BlockageDrag1020', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_1020')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('长按中另一手指点击外部 - 取消拖拽')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text(`拖拽状态: ${this.dragStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)
        .fontWeight(FontWeight.Bold)

      Text(`外部点击次数: ${this.outsideClickCount}`)
        .fontSize(14)
        .fontColor(Color.Orange)

      Text(`拖拽是否取消: ${this.dragCancelled ? '是 ✓' : '否'}`)
        .fontSize(14)
        .fontColor(this.dragCancelled ? Color.Green : Color.Gray)

      Divider()

      Row({ space: 20 }) {
        Column() {
          Text('可拖拽组件：')
            .fontSize(12)
            .fontColor('#333333')
            .margin({ bottom: 5 })

          Column() {
            Text('长按我')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor(Color.White)
          }
          .width('16.67%')
          .height('8.2%')
          .backgroundColor('#E91E63')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)
          .draggable(true)
          .onTouch((event: TouchEvent) => {
            if (event.type === TouchType.Down) {
              this.pressStartTime = Date.now();
              this.dragStatus = '长按中...';
              this.dragCancelled = false;
              this.addLog('Touch Down - 开始长按');
            } else if (event.type === TouchType.Up) {
              const pressTime = Date.now() - this.pressStartTime;
              this.addLog(`Touch Up - 长按时长: ${pressTime}ms`);
              this.dragStatus = '已结束';
            } else if (event.type === TouchType.Cancel) {
              this.addLog('Touch Cancel - 拖拽被取消');
              this.dragStatus = '已取消';
              this.dragCancelled = true;
            }
          })
          .onDragStart(() => {
            this.addLog('onDragStart triggered');
            this.dragStatus = '拖拽中...';
          })
          .onDragEnd(() => {
            this.addLog('onDragEnd triggered');
            this.dragStatus = '拖拽结束';
          })
          .id('BlockageDrag1020_Component')
        }

        Column() {
          Text('点击此区域：')
            .fontSize(12)
            .fontColor('#333333')
            .margin({ bottom: 5 })

          Column() {
            Text('点击这里')
              .fontSize(14)
              .fontColor(Color.White)
          }
          .width('16.67%')
          .height('8.2%')
          .backgroundColor('#607d7B')
          .borderRadius(12)
          .justifyContent(FlexAlign.Center)
          .onClick(() => {
            this.outsideClickCount++;
            this.addLog(`外部区域被点击 (第${this.outsideClickCount}次)`);
            if (this.dragStatus === '长按中...') {
              this.addLog('✓ 长按过程中点击外部，预期拖拽取消');
            }
          })
          .id('BlockageDrag1020_Outside')
        }
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)
      .justifyContent(FlexAlign.Center)

      Text('一只手指长按左边组件，另一只手指点击右边区域')
        .fontSize(12)
        .fontColor(Color.Gray)

      Divider().height(2).color('#EEEEEE')

      Text('预期结果：')
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Text('• 手指长按组件，另一只手指点击组件外的区域\n• 结果: 拖拽取消')
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

