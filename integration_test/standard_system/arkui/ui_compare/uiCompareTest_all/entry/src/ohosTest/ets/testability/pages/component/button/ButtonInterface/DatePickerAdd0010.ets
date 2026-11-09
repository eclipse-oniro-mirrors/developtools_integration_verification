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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_ADD_0010
 * 用例描述: DatePicker多列同时滑动，观察DatePicker是否表现异常
 * 测试条件: 页面中创建一个DatePicker组件
 * 测试步骤: 多指滑动DatePicker的多列，查看DatePicker是否表现正常
 * 预期结果: DatePicker表现正常
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct DatePickerAdd0010 {
  @State testLog: string[] = [];
  @State selectedDate: Date = new Date('2023-04-30');

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'DatePickerAdd0010', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_ADD_0010')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('DatePicker多列同时滑动测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('使用多指同时滑动DatePicker的多列\n观察是否表现正常')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      DatePicker({
        start: new Date('1980-1-1'),
        end: new Date('2100-12-31'),
        selected: this.selectedDate
      })
        .width('90%')
        .height(200)
        .id('DatePickerAdd0010_Picker')
        .onChange((value: DatePickerResult) => {
          this.addLog(`选择: ${value.year}-${(value.month ?? 0) + 1}-${value.day}`);
        })

      Text(`当前选择: ${this.selectedDate.getFullYear()}-${this.selectedDate.getMonth() + 1}-${this.selectedDate.getDate()}`)
        .fontSize(12)
        .fontColor('#666666')

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('多指同时滑动各列时，DatePicker表现正常，无异常行为')
          .fontSize(9)
          .fontColor('#4CAF50')
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E8F5E9')
      .borderRadius(4)

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

