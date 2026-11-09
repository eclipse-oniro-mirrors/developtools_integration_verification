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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0320
 * 用例描述: 频繁调用接口
 * 测试条件: 编写频繁调用接口的python脚本
 * 测试步骤: 1、运行脚本
 * 预期结果: 无crash
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ApproximateChange0320 {
  @Local testLog: string[] = [];
  @Local callCount: number = 0;
  @Local isRunning: boolean = false;
  @Local currentRatio: number = 1;
  @Local hasCrash: boolean = false;
  @Local listData: number[] = this.generateListData(100);

  private ratios: number[] = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];

  private generateListData(count: number): number[] {
    let result: number[] = [];
    for (let i: number = 1; i <= count; i++) {
      result.push(i);
    }
    return result;
  }

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 50) {
      this.testLog = this.testLog.slice(0, 50);
    }
    hilog.info(0x0000, 'ApproximateChange0320', log);
  }

  startFrequentCalls(): void {
    this.isRunning = true;
    this.callCount = 0;
    this.addLog('开始频繁调用测试...');
    
    // 模拟频繁滚动触发回调
    let count: number = 0;
    const maxCalls: number = 100;
    
    const intervalId = setInterval(() => {
      if (count >= maxCalls || !this.isRunning) {
        clearInterval(intervalId);
        this.isRunning = false;
        this.addLog(`测试完成，共调用 ${this.callCount} 次`);
        this.addLog(this.hasCrash ? '❌ 发生crash' : '✓ 无crash');
        return;
      }
      count++;
      // 触发状态更新
      this.currentRatio = Math.random();
      this.callCount++;
    }, 10);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0320')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('频繁调用接口测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 20 }) {
        Column() {
          Text('调用次数')
            .fontSize(11)
          Text(`${this.callCount}`)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
        }
        Column() {
          Text('状态')
            .fontSize(11)
          Text(`${this.isRunning ? '运行中...' : '已停止'}`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.isRunning ? Color.Orange : Color.Green)
        }
        Column() {
          Text('Crash')
            .fontSize(11)
          Text(`${this.hasCrash ? '是 ✗' : '否 ✓'}`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.hasCrash ? Color.Red : Color.Green)
        }
      }

      Row({ space: 10 }) {
        Button('开始测试')
          .onClick(() => {
            this.startFrequentCalls();
          })
          .fontSize(12)
          .enabled(!this.isRunning)
          .id('ApproximateChange0320_StartBtn')

        Button('停止测试')
          .onClick(() => {
            this.isRunning = false;
            this.addLog('手动停止测试');
          })
          .fontSize(12)
          .enabled(this.isRunning)
          .id('ApproximateChange0320_StopBtn')
      }

      Divider().height(1).color('#EEEEEE')

      Scroll() {
        Column() {
          Text('监听此组件的可见区域变化')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .height(150)
            .backgroundColor('#4CAF50')
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .borderRadius(8)
            .onVisibleAreaChange(this.ratios, (isVisible: boolean, currentRatio: number) => {
              try {
                this.callCount++;
                this.currentRatio = currentRatio;
              } catch (e) {
                this.hasCrash = true;
                this.addLog(`Crash: ${e}`);
              }
            })
            .id('ApproximateChange0320_Text')

          ForEach(this.listData, (item: number) => {
            Text(`列表项 ${item}`)
              .fontSize(14)
              .width('100%')
              .height(40)
              .backgroundColor(item % 2 === 0 ? '#E8F5E9' : '#FFFFFF')
              .textAlign(TextAlign.Center)
              .borderRadius(4)
              .margin({ top: 2 })
          })
        }
        .width('100%')
      }
      .width('100%')
      .height('16.39%')
      .backgroundColor('#FAFAFA')
      .borderRadius(8)
      .id('ApproximateChange0320_Scroll')

      Text('快速滚动测试区域，验证频繁调用不会crash')
        .fontSize(11)
        .fontColor(Color.Gray)

      Divider().height(1).color('#EEEEEE')

      Text('预期: 无crash')
        .fontSize(11)
        .fontColor('#4CAF50')

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(9)
              .fontColor('#333333')
              .width('100%')
              .padding(2)
              .backgroundColor(index % 2 === 0 ? '#F5F5F5' : Color.White)
          })
        }
        .width('100%')
      }
      .height('6.56%')
      .width('95%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
    }
    .width('100%')
    .height('100%')
    .padding(8)
    .backgroundColor('#F5F5F5')
  }
}

