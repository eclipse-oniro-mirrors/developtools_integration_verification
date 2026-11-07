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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_EVENT_0010
 * 用例描述: 在DatePicker组件中，onChange事件：滑动选择器，当前选择项改变时触发
 * 测试条件: 新建DatePicker组件
 * 测试步骤: 滑动日期选择4号，滑动月份选择7月，滑动年份选择1990年
 * 预期结果: 打印log: value{"year":"1990","month":7,"day":"4"}
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct DatePickerEvent0010 {
  @State testLog: string[] = [];
  @State selectedDate: Date = new Date('2023-04-30');
  @State currentSelection: string = '';

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'DatePickerEvent0010', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_EVENT_0010')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('DatePicker onChange事件测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('1. 滑动日期选择4号\n2. 滑动月份选择7月\n3. 滑动年份选择1990年')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      DatePicker({
        start: new Date('1980-4-30'),
        end: new Date('2370-4-30'),
        selected: this.selectedDate
      })
        .width('90%')
        .height(200)
        .id('DatePickerEvent0010_Picker')
        .onChange((value: DatePickerResult) => {
          const month = (value.month ?? 0) + 1;
          this.currentSelection = `{"year":"${value.year}","month":${month},"day":"${value.day}"}`;
          this.addLog(`onChange: ${this.currentSelection}`);
        })

      Text('当前选择:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(this.currentSelection || '未选择')
        .fontSize(11)
        .fontColor('#007DFF')
        .width('95%')
        .padding(8)
        .backgroundColor(Color.White)
        .borderRadius(4)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('选择1990年7月4日后，打印:\nvalue{"year":"1990","month":7,"day":"4"}')
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

