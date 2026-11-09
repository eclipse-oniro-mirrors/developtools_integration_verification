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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_INTERFACE_0190
 * 用例描述: 在Datepicker组件中，验证通用属性height子父组件设置异常
 * 测试条件: 设置子组件的高大于父组件的高
 * 测试步骤: 编译HAP并运行，查看子组件和父组件的高度
 * 预期结果: 会画出父组件的范围
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct DatePickerInterface0190 {
  @State testLog: string[] = [];
  @State selectedDate: Date = new Date('2023-04-30');

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'DatePickerInterface0190', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_DATEPICKER_INTERFACE_0190')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('height属性异常测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('子组件DatePicker高度(300)大于父组件(150)\n验证溢出处理')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('父容器 (height=150, 红色边框):')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      // 父容器高度150，子组件DatePicker高度300
      Column() {
        DatePicker({
          start: new Date('1980-4-30'),
          end: new Date('2370-4-30'),
          selected: this.selectedDate
        })
          .width('100%')
          .height(300) // 子组件高度大于父组件
          .id('DatePickerInterface0190_Picker')
          .onChange((value: DatePickerResult) => {
            this.addLog(`选择: ${value.year}-${(value.month ?? 0) + 1}-${value.day}`);
          })
      }
      .width('90%')
      .height('12.3%') // 父组件高度
      .borderWidth(2)
      .borderColor(Color.Red)
      .clip(true) // 裁剪超出部分

      Text('父容器高度: 150, 子组件高度: 300')
        .fontSize(10)
        .fontColor('#666666')

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('DatePicker被裁剪在父容器范围内显示')
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
      .height('4.92%')
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

