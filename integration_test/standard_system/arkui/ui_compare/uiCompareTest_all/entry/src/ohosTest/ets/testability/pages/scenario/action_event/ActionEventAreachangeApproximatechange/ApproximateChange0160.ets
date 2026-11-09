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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0160
 * 用例描述: 组件下树
 * 测试条件: 1、创建scroll组件，子组件为text和list 2、text组件绑定onVisibleAreaApproximateChange 3、添加按钮控制text组件上下树
 * 测试步骤: 1、点击组件下树按钮 2、点击组件上树按钮
 * 预期结果: 1、isExpanding打印false，currentRatio打印0  2、isExpanding打印true，currentRatio打印1
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ApproximateChange0160 {
  @Local testLog: string[] = [];
  @Local currentRatio: number = 1;
  @Local isExpanding: boolean = true;
  @Local showComponent: boolean = true;
  @Local listData: number[] = this.generateListData(50);

  private generateListData(count: number): number[] {
    let result: number[] = [];
    for (let i: number = 1; i <= count; i++) {
      result.push(i);
    }
    return result;
  }
  
  private ratios: number[] = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 30) {
      this.testLog = this.testLog.slice(0, 30);
    }
    hilog.info(0x0000, 'ApproximateChange0160', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0160')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('组件下树/上树')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Row({ space: 20 }) {
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
          Text('组件状态')
            .fontSize(11)
          Text(`${this.showComponent ? '在树上' : '已下树'}`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor(this.showComponent ? Color.Green : Color.Red)
        }
      }

      Row({ space: 10 }) {
        Button('组件下树')
          .onClick(() => {
            this.showComponent = false;
            this.addLog('组件下树');
          })
          .fontSize(12)
          .enabled(this.showComponent)
          .id('ApproximateChange0160_RemoveBtn')

        Button('组件上树')
          .onClick(() => {
            this.showComponent = true;
            this.addLog('组件上树');
          })
          .fontSize(12)
          .enabled(!this.showComponent)
          .id('ApproximateChange0160_AddBtn')
      }

      Divider().height(1).color('#EEEEEE')

      Scroll() {
        Column() {
          if (this.showComponent) {
            Text('监听此组件的可见区域变化')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .width('100%')
              .height(150)
              .backgroundColor('#8BC34A')
              .textAlign(TextAlign.Center)
              .fontColor(Color.White)
              .borderRadius(8)
              .onVisibleAreaChange(this.ratios, (isVisible: boolean, currentRatio: number) => {
                this.currentRatio = currentRatio;
                this.isExpanding = isVisible;
                this.addLog(`isExpanding: ${isVisible}, currentRatio: ${currentRatio.toFixed(2)}`);
              })
              .id('ApproximateChange0160_Text')
          }

          ForEach(this.listData, (item: number) => {
            Text(`列表项 ${item}`)
              .fontSize(14)
              .width('100%')
              .height(50)
              .backgroundColor(item % 2 === 0 ? '#DCEDC8' : '#FFFFFF')
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
      .id('ApproximateChange0160_Scroll')

      Divider().height(1).color('#EEEEEE')

      Text('预期:\n• 下树: isExpanding=false, currentRatio=0\n• 上树: isExpanding=true, currentRatio=1')
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

