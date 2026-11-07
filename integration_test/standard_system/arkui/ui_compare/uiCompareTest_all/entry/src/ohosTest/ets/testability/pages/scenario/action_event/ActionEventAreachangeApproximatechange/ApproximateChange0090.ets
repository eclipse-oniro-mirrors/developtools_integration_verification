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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0090
 * 用例描述: ratios设置为[0,0.1,0.2,...,1]，expectedUpdateInterval设置为100
 * 测试条件: 1、创建scroll组件，子组件为text和list 2、text组件绑定onVisibleAreaApproximateChange
 * 测试步骤: 1、设置ratios和expectedUpdateInterval 2、向上滑动至text不可见 3、向下滑动至text可见
 * 预期结果: isExpanding变化，currentRatio打印可见区域比例，回调间隔为100ms
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ApproximateChange0090 {
  @Local testLog: string[] = [];
  @Local lastCallTime: number = 0;
  @Local callCount: number = 0;
  @Local currentRatio: number = 1;
  @Local isExpanding: boolean = true;
  @Local intervalMs: number = 0;
  @Local listData: number[] = this.generateListData(50);

  private generateListData(count: number): number[] {
    let result: number[] = [];
    for (let i: number = 1; i <= count; i++) {
      result.push(i);
    }
    return result;
  }
  
  private ratios: number[] = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
  private expectedUpdateInterval: number = 100;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'ApproximateChange0090', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0090')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('expectedUpdateInterval = 100')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 15 }) {
        Column() {
          Text('currentRatio')
            .fontSize(11)
          Text(`${this.currentRatio.toFixed(2)}`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Color.Blue)
        }
        Column() {
          Text('isExpanding')
            .fontSize(11)
          Text(`${this.isExpanding}`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.isExpanding ? Color.Green : Color.Orange)
        }
        Column() {
          Text('间隔(ms)')
            .fontSize(11)
          Text(`${this.intervalMs}`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor('#9C27B0')
        }
      }

      Text(`回调次数: ${this.callCount}`)
        .fontSize(12)
        .fontColor(Color.Gray)

      Divider().height(1).color('#EEEEEE')

      Scroll() {
        Column() {
          Text('监听此组件的可见区域变化')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .height(150)
            .backgroundColor('#E91E63')
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .borderRadius(8)
            .onVisibleAreaChange(this.ratios, (isVisible: boolean, currentRatio: number) => {
              const now = Date.now();
              if (this.lastCallTime > 0) {
                this.intervalMs = now - this.lastCallTime;
              }
              this.lastCallTime = now;
              this.callCount++;
              this.currentRatio = currentRatio;
              this.isExpanding = currentRatio > this.currentRatio || isVisible;
              this.addLog(`ratio: ${currentRatio.toFixed(2)}, expanding: ${this.isExpanding}, interval: ${this.intervalMs}ms`);
            })
            .id('ApproximateChange0090_Text')

          ForEach(this.listData, (item: number) => {
            Text(`列表项 ${item}`)
              .fontSize(14)
              .width('100%')
              .height(50)
              .backgroundColor(item % 2 === 0 ? '#FCE4EC' : '#FFFFFF')
              .textAlign(TextAlign.Center)
              .borderRadius(4)
              .margin({ top: 2 })
          })
        }
        .width('100%')
      }
      .width('100%')
      .height('20.49%')
      .backgroundColor('#FAFAFA')
      .borderRadius(8)
      .id('ApproximateChange0090_Scroll')

      Text('向上滑动使粉色区域不可见，再向下滑动使其可见')
        .fontSize(11)
        .fontColor(Color.Gray)

      Divider().height(1).color('#EEEEEE')

      Text('预期: 回调间隔为100ms')
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
      .height('8.2%')
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

