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
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct UiComponentMediaCalendarPickerDate03 {
  @State selectedDate: Date = new Date('2024-06-15');
  // 设置为 null/undefined
  private startDate: Date | null = null;
  private endDate: Date | undefined = undefined;
  @State operationLog: string[] = [];

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '=== CalendarPicker start/end为null/undefined测试 ===');
    this.addLog('测试页面已加载');
    this.addLog(`start: ${this.startDate} (null)`);
    this.addLog(`end: ${this.endDate} (undefined)`);
    this.addLog('预期: start,end无效,日期可任意选择');
  }

  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    const log = `[${timestamp}] ${message}`;
    this.operationLog.unshift(log);
    if (this.operationLog.length > 12) {
      this.operationLog.pop();
    }
    hilog.info(0x0000, 'testTag', log);
  }

  build() {
    Column({ space: 15 }) {
      // 标题区域
      Column({ space: 5 }) {
        Text('start/end为null/undefined测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .width('100%')
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0014')
          .fontSize(10)
          .fontColor('#FFD700')
          .fontFamily('Courier')
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(12)
      .backgroundColor('#00796B')

      Scroll() {
        Column({ space: 15 }) {
          // 测试说明
          Column({ space: 8 }) {
            Text('📝 测试说明')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')

            Column({ space: 5 }) {
              Text('1️⃣ 添加 CalendarPicker/CalendarPickerDialog 组件')
                .fontSize(13)
                .fontColor('#666666')

              Text('2️⃣ 设置最大最小日期 start、end 为 null/undefined')
                .fontSize(13)
                .fontColor('#666666')

              Text('3️⃣ 编译运行代码')
                .fontSize(13)
                .fontColor('#666666')

              Divider()
                .margin({ top: 5, bottom: 5 })

              Text(`start: null`)
                .fontSize(14)
                .fontColor('#F44336')
                .fontWeight(FontWeight.Bold)

              Text(`end: undefined`)
                .fontSize(14)
                .fontColor('#F44336')
                .fontWeight(FontWeight.Bold)

              Text('预期: start,end无效,日期可任意选择')
                .fontSize(14)
                .fontColor('#666666')
            }
            .width('100%')
            .padding(12)
            .backgroundColor('#FFEBEE')
            .borderRadius(8)
            .alignItems(HorizontalAlign.Start)
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // CalendarPicker 组件
          Column({ space: 10 }) {
            Text('📅 CalendarPicker 组件')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')

            Text('(不设置 start 和 end)')
              .fontSize(12)
              .fontColor('#999999')

            CalendarPicker({
              hintRadius: 10,
              selected: this.selectedDate,
              start: this.startDate,
              end: this.endDate
            })
              .id('UiComponentMediaCalendarPickerDate03_01')
              .edgeAlign(CalendarAlign.END)
              .textStyle({
                color: '#ff182431',
                font: {
                  size: 20,
                  weight: FontWeight.Normal
                }
              })
              .margin({ top: 10 })
              .onChange((value) => {
                this.selectedDate = value;
                this.addLog(`CalendarPicker 日期选择: ${value.toLocaleDateString()}`);
                hilog.info(0x0000, 'testTag', `CalendarPicker selected: ${JSON.stringify(value)}`);
              })

            Text(`当前选择: ${this.selectedDate.toLocaleDateString()}`)
              .fontSize(14)
              .fontColor('#00796B')
              .fontWeight(FontWeight.Bold)
              .margin({ top: 10 })
          }
          .width('95%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
          .border({ width: 2, color: '#00796B' })
          .alignItems(HorizontalAlign.Center)

          // CalendarPickerDialog 按钮
          Column({ space: 10 }) {
            Text('📅 CalendarPickerDialog 组件')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')

            Text('(不设置 start 和 end)')
              .fontSize(12)
              .fontColor('#999999')

            Button('打开 CalendarPickerDialog')
              .fontSize(16)
              .width('80%')
              .height(45)
              .backgroundColor('#00796B')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
              .id('UiComponentMediaCalendarPickerDate03_02')
              .onClick(() => {
                this.addLog('点击打开 CalendarPickerDialog');
                CalendarPickerDialog.show({
                  selected: this.selectedDate,
                  start: this.startDate,
                  end: this.endDate,
                  onAccept: (value) => {
                    this.selectedDate = value;
                    this.addLog(`CalendarPickerDialog 日期确认: ${value.toLocaleDateString()}`);
                    hilog.info(0x0000, 'testTag', `CalendarPickerDialog accepted: ${JSON.stringify(value)}`);
                  },
                  onCancel: () => {
                    this.addLog('CalendarPickerDialog 取消');
                    hilog.info(0x0000, 'testTag', 'CalendarPickerDialog cancelled');
                  },
                  onChange: (value) => {
                    this.addLog(`CalendarPickerDialog 日期变化: ${value.toLocaleDateString()}`);
                    hilog.info(0x0000, 'testTag', `CalendarPickerDialog changed: ${JSON.stringify(value)}`);
                  }
                })
              })

            Text(`当前选择: ${this.selectedDate.toLocaleDateString()}`)
              .fontSize(14)
              .fontColor('#00796B')
              .fontWeight(FontWeight.Bold)
              .margin({ top: 5 })
          }
          .width('95%')
          .padding(15)
          .backgroundColor('#FFFFFF')
          .borderRadius(8)
          .border({ width: 2, color: '#00796B' })
          .alignItems(HorizontalAlign.Center)

          // 操作日志
          Column({ space: 8 }) {
            Text('📋 事件日志')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')

            Scroll() {
              Column({ space: 1 }) {
                if (this.operationLog.length > 0) {
                  ForEach(this.operationLog, (log: string, index: number) => {
                    Text(log)
                      .fontSize(11)
                      .fontColor('#666666')
                      .fontFamily('Courier')
                      .width('100%')
                      .padding(5)
                      .backgroundColor(index % 2 === 0 ? '#F5F5F5' : '#FFFFFF')
                  }, (log: string, index: number) => `${index}_${log}`)
                } else {
                  Text('暂无事件日志')
                    .fontSize(11)
                    .fontColor('#999999')
                    .width('100%')
                    .textAlign(TextAlign.Center)
                    .padding(8)
                }
              }
              .width('100%')
            }
            .width('100%')
            .height('12.3%')
            .backgroundColor('#FAFAFA')
            .borderRadius(8)
            .border({ width: 1, color: '#E0E0E0' })
            .scrollBar(BarState.Auto)
          }
          .width('95%')
          .alignItems(HorizontalAlign.Start)

          // 补充说明
          Column({ space: 8 }) {
            Text('💡 说明')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF9800')

            Text('当 start 或 end 为 null/undefined 时，参数无效')
              .fontSize(13)
              .fontColor('#666666')

            Text('不设置 start 和 end 参数')
              .fontSize(13)
              .fontColor('#666666')

            Text('预期行为: start,end无效,日期可任意选择')
              .fontSize(13)
              .fontColor('#666666')
              .fontWeight(FontWeight.Bold)

            Text('用户可以选择任意日期，没有范围限制')
              .fontSize(13)
              .fontColor('#666666')
          }
          .width('95%')
          .padding(12)
          .backgroundColor('#FFF3E0')
          .borderRadius(8)
          .alignItems(HorizontalAlign.Start)

        }
        .width('100%')
        .padding({ left: 10, right: 10, bottom: 20 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}

