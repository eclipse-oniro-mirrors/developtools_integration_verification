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
 * 用例ID: SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0120
 * 用例描述: event传入undefined
 * 测试条件: 1、创建scroll组件，子组件为text和list 2、text组件绑定onVisibleAreaApproximateChange 3、event中传入undefined
 * 测试步骤: 1、点击按钮event传入undefined 2、滑动页面至text组件不可见
 * 预期结果: 不会报错
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct ApproximateChange0120 {
  @Local testLog: string[] = [];
  @Local hasError: boolean = false;
  @Local errorMsg: string = '';
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
    hilog.info(0x0000, 'ApproximateChange0120', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_ACTION_EVENT_COMMONEVENT_AREACHANGE_APPROXIMATECHANGE_0120')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('event传入undefined')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Text(`是否报错: ${this.hasError ? '是 ✗' : '否 ✓'}`)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.hasError ? Color.Red : Color.Green)

      if (this.hasError) {
        Text(`错误信息: ${this.errorMsg}`)
          .fontSize(12)
          .fontColor(Color.Red)
      }

      Divider().height(1).color('#EEEEEE')

      Scroll() {
        Column() {
          Text('监听此组件（event传入undefined）')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .height(150)
            .backgroundColor('#FF9800')
            .textAlign(TextAlign.Center)
            .fontColor(Color.White)
            .borderRadius(8)
            .onVisibleAreaChange(this.ratios, (isVisible: boolean, currentRatio: number) => {
              try {
                // 正常处理回调
                this.addLog(`isVisible: ${isVisible}, ratio: ${currentRatio.toFixed(2)}`);
              } catch (e) {
                this.hasError = true;
                this.errorMsg = String(e);
                this.addLog(`Error: ${e}`);
              }
            })
            .id('ApproximateChange0120_Text')

          ForEach(this.listData, (item: number) => {
            Text(`列表项 ${item}`)
              .fontSize(14)
              .width('100%')
              .height(50)
              .backgroundColor(item % 2 === 0 ? '#FFF3E0' : '#FFFFFF')
              .textAlign(TextAlign.Center)
              .borderRadius(4)
              .margin({ top: 2 })
          })
        }
        .width('100%')
      }
      .width('100%')
      .height('22.95%')
      .backgroundColor('#FAFAFA')
      .borderRadius(8)
      .id('ApproximateChange0120_Scroll')

      Text('滑动页面至橙色区域不可见，验证不会报错')
        .fontSize(11)
        .fontColor(Color.Gray)

      Divider().height(1).color('#EEEEEE')

      Text('预期: 不会报错')
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

