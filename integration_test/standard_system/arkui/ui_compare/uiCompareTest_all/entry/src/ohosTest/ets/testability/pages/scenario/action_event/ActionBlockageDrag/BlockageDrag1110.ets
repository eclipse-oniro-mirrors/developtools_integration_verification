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
 * 用例ID: SUB_ACE_ACTION_BLOCKAGE_DRAG_1110
 * 用例描述: 手指长按拖拽*50次
 * 测试条件: 更新最新版本镜像，打开demo
 * 测试步骤: 手指长按组件、拖拽，连续拖拽50次
 * 预期结果: 功能正常，不会崩溃、卡顿等；每次拖拽均能正确闭环
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct BlockageDrag1110 {
  @Local testLog: string[] = [];
  @Local dragCount: number = 0;
  @Local targetCount: number = 50;
  @Local dragStatus: string = '未开始';
  @Local successCount: number = 0;
  @Local failCount: number = 0;
  @Local lastDragTime: number = 0;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'BlockageDrag1110', log);
  }

  resetTest(): void {
    this.dragCount = 0;
    this.successCount = 0;
    this.failCount = 0;
    this.dragStatus = '未开始';
    this.testLog = [];
    this.addLog('测试已重置');
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_BLOCKAGE_DRAG_1110')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('手指长按拖拽*50次')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Row({ space: 15 }) {
        Column() {
          Text('拖拽次数')
            .fontSize(12)
          Text(`${this.dragCount}/${this.targetCount}`)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.dragCount >= this.targetCount ? Color.Green : Color.Blue)
        }
        Column() {
          Text('成功')
            .fontSize(12)
          Text(`${this.successCount}`)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Green)
        }
        Column() {
          Text('失败')
            .fontSize(12)
          Text(`${this.failCount}`)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.failCount > 0 ? Color.Red : Color.Gray)
        }
      }

      Progress({ value: this.dragCount, total: this.targetCount })
        .width('80%')
        .height(10)

      Text(`状态: ${this.dragStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Divider()

      Column() {
        Text('可拖拽组件（长按拖拽）：')
          .fontSize(14)
          .fontColor('#333333')
          .margin({ bottom: 10 })
          .alignSelf(ItemAlign.Start)

        Column() {
          Text('长按拖拽')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.White)
          Text(`已拖拽: ${this.dragCount}次`)
            .fontSize(14)
            .fontColor(Color.White)
        }
        .width('25%')
        .height('7.38%')
        .backgroundColor('#2196F3')
        .borderRadius(12)
        .justifyContent(FlexAlign.Center)
        .draggable(true)
        .onTouch((event: TouchEvent) => {
          if (event.type === TouchType.Down) {
            this.dragStatus = '长按中...';
            this.lastDragTime = Date.now();
          }
        })
        .onDragStart(() => {
          this.addLog(`第${this.dragCount + 1}次拖拽开始`);
          this.dragStatus = '拖拽中...';
        })
        .onDragEnd(() => {
          this.dragCount++;
          this.successCount++;
          const duration = Date.now() - this.lastDragTime;
          this.addLog(`第${this.dragCount}次拖拽完成 (${duration}ms)`);
          this.dragStatus = this.dragCount >= this.targetCount ? '测试完成 ✓' : '等待下次拖拽';
          if (this.dragCount >= this.targetCount) {
            this.addLog('✓ 50次拖拽测试完成！');
          }
        })
        .id('BlockageDrag1110_Component')
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)

      Button('重置测试')
        .onClick(() => this.resetTest())
        .fontSize(14)
        .width(100)

      Divider().height(2).color('#EEEEEE')

      Text('预期结果：')
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Text('• 连续拖拽50次\n• 功能正常，不会崩溃、卡顿\n• 每次拖拽均能正确闭环')
        .fontSize(11)
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
              .padding(2)
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

