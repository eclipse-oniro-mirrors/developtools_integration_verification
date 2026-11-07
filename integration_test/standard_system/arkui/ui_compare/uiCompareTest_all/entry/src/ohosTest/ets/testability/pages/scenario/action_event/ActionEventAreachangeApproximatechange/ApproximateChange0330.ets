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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0330
 * 用例描述: 内存泄漏
 * 测试条件: 编写内存泄漏的python脚本
 * 测试步骤: 1、运行脚本
 * 预期结果: 无明显内存泄漏
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ApproximateChange0330 {
  @Local testLog: string[] = [];
  @Local testCount: number = 0;
  @Local isRunning: boolean = false;
  @Local memoryStatus: string = '待检测';
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
    hilog.info(0x0000, 'ApproximateChange0330', log);
  }

  startMemoryTest(): void {
    this.isRunning = true;
    this.testCount = 0;
    this.memoryStatus = '测试中...';
    this.addLog('开始内存泄漏测试...');
    
    // 模拟多次创建和销毁组件的场景
    let count: number = 0;
    const maxTests: number = 50;
    
    const intervalId = setInterval(() => {
      if (count >= maxTests || !this.isRunning) {
        clearInterval(intervalId);
        this.isRunning = false;
        this.memoryStatus = '测试完成';
        this.addLog(`测试完成，共执行 ${this.testCount} 次`);
        this.addLog('请使用DevEco Studio的Profiler工具检查内存使用情况');
        return;
      }
      count++;
      this.testCount++;
      
      // 模拟列表数据刷新
      this.listData = this.generateListData(100);
      this.addLog(`第 ${count} 次刷新列表`);
    }, 200);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0330')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('内存泄漏测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 20 }) {
        Column() {
          Text('测试次数')
            .fontSize(11)
          Text(`${this.testCount}`)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
        }
        Column() {
          Text('状态')
            .fontSize(11)
          Text(`${this.memoryStatus}`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.isRunning ? Color.Orange : Color.Green)
        }
      }

      Row({ space: 10 }) {
        Button('开始测试')
          .onClick(() => {
            this.startMemoryTest();
          })
          .fontSize(12)
          .enabled(!this.isRunning)
          .id('ApproximateChange0330_StartBtn')

        Button('停止测试')
          .onClick(() => {
            this.isRunning = false;
            this.memoryStatus = '已停止';
            this.addLog('手动停止测试');
          })
          .fontSize(12)
          .enabled(this.isRunning)
          .id('ApproximateChange0330_StopBtn')
      }

      Divider().height(1).color('#EEEEEE')

      Scroll() {
        Column() {
          Text('监听此组件的可见区域变化')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .height(150)
            .backgroundColor('#2196F3')
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .borderRadius(8)
            .onVisibleAreaChange(this.ratios, (isVisible: boolean, currentRatio: number) => {
              // 记录回调
            })
            .id('ApproximateChange0330_Text')

          ForEach(this.listData, (item: number) => {
            Text(`列表项 ${item}`)
              .fontSize(14)
              .width('100%')
              .height(40)
              .backgroundColor(item % 2 === 0 ? '#E3F2FD' : '#FFFFFF')
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
      .id('ApproximateChange0330_Scroll')

      Text('测试后请使用Profiler工具检查内存使用情况')
        .fontSize(11)
        .fontColor(Color.Gray)

      Divider().height(1).color('#EEEEEE')

      Text('预期: 无明显内存泄漏')
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

