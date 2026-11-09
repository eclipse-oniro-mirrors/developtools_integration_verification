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
 * 用例ID: ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0110
 * 用例描述: CalendarPicker设置通用属性border的宽度为异常值，日历入口区的边框样式为默认值
 * 预置条件:
 * 1、创建1个CalendarPicker组件
 * 2、设置.border({ width: { left: -10, right: "undef", top: 2, bottom: null } })
 * 测试步骤:
 * 1、点击规格补充
 * 2、点击CalendarPicker
 * 3、查看文字border+异常值下面的组件
 * 预期结果: 
 * 日历入口区的边框上边是2vp的灰色实线，左右下是1vp的灰色实线
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct CalendarPickerBorder0110 {
  @Local selectedDate: Date = new Date();
  @Local testLog: string[] = [];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 10) {
      this.testLog = this.testLog.slice(0, 10);
    }
    hilog.info(0x0000, 'CalendarPickerBorder0110', log);
  }

  build() {
    Column({ space: 20 }) {
      Text('ARKUI_COMPONENTFUNCTION_SPECIALCOMPONENTS_DIALOG_SPECIFICATIONS_UI_0110')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('CalendarPicker Border异常值测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Text('测试条件：')
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('• 设置border宽度异常值\n• left: -10（负值）\n• right: "undef"（字符串）\n• top: 2（正常值）\n• bottom: null（空值）')
        .fontSize(14)
        .fontColor('#666666')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('测试组件：')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('border + 异常值')
        .fontSize(14)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 10, bottom: 5 })

      CalendarPicker({ hintRadius: 10, selected: this.selectedDate })
        .edgeAlign(CalendarAlign.END)
        .textStyle({ color: '#ff182431', font: { size: 20, weight: FontWeight.Normal } })
        .border({
          width: { left: -10, right: 'undef', top: 2, bottom: null }
        })
        .onChange((value: Date) => {
          this.selectedDate = value;
          this.addLog(`Selected date: ${value.toLocaleDateString()}`);
        })
        .id('CalendarPickerBorder0110_Component')

      Divider().height(2).color('#EEEEEE')

      Text('预期结果：')
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text('• 上边框：2vp灰色实线（正常值生效）\n• 左边框：1vp灰色实线（负值使用默认值）\n• 右边框：1vp灰色实线（异常字符串使用默认值）\n• 下边框：1vp灰色实线（null使用默认值）')
        .fontSize(14)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('操作说明：')
        .fontSize(14)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Text('• 点击日历组件打开日历选择器\n• 观察组件边框样式\n• 验证异常值是否回退到默认值')
        .fontSize(12)
        .fontColor('#999999')
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Divider().height(2).color('#EEEEEE')

      Text('测试日志：')
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(12)
              .fontColor('#333333')
              .width('100%')
              .padding(5)
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
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

