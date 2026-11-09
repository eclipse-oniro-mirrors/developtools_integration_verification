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
struct UiComponentMediaCalendarPickerDate08 {
  // start晚于当前系统日期，选中日期未设置（不设置selected）
  private currentDate: Date = new Date();
  private startDate: Date = new Date(new Date().getTime() + 7 * 24 * 60 * 60 * 1000); // 当前日期+7天
  private endDate: Date = new Date(new Date().getTime() + 30 * 24 * 60 * 60 * 1000); // 当前日期+30天
  @State operationLog: string[] = [];
  @State selectedDateDisplay: string = '未设置';

  aboutToAppear() {
    hilog.info(0x0000, 'testTag', '=== CalendarPicker start晚于当前系统日期测试 ===');
    this.addLog('测试页面已加载');
    this.addLog(`当前系统日期: ${this.currentDate.toLocaleDateString()}`);
    this.addLog(`start: ${this.startDate.toLocaleDateString()} (晚于当前日期)`);
    this.addLog(`end: ${this.endDate.toLocaleDateString()}`);
    this.addLog('选中日期未设置（不传selected参数）');
    this.addLog('预期: 选中日期为起始时间');
    hilog.info(0x0000, 'testTag', `current: ${this.currentDate}, start: ${this.startDate}, end: ${this.endDate}`);
  }

  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    const log = `[${timestamp}] ${message}`;
    this.operationLog.unshift(log);
    if (this.operationLog.length > 15) {
      this.operationLog.pop();
    }
    hilog.info(0x0000, 'testTag', log);
  }

  build() {
    Column({ space: 15 }) {
      // 标题区域
      Column({ space: 5 }) {
        Text('start晚于当前系统日期测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
          .width('100%')
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_UI_COMPONENT_MEDIA_CALENDARPICKER_DATE_0019')
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

              Text('2️⃣ 设置 start 晚于当前系统日期，选中日期未设置')
                .fontSize(13)
                .fontColor('#666666')

              Text('3️⃣ 编译运行代码')
                .fontSize(13)
                .fontColor('#666666')

              Divider()
                .margin({ top: 5, bottom: 5 })

              Text(`当前系统日期: ${this.currentDate.toLocaleDateString()}`)
                .fontSize(14)
                .fontColor('#2196F3')
                .fontWeight(FontWeight.Bold)

              Text(`start: ${this.startDate.toLocaleDateString()} (晚于当前日期)`)
                .fontSize(14)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)

              Text(`end: ${this.endDate.toLocaleDateString()}`)
                .fontSize(14)
                .fontColor('#4CAF50')
                .fontWeight(FontWeight.Bold)

              Text('selected: 未设置 (不传递参数)')
                .fontSize(14)
                .fontColor('#FF9800')
                .fontWeight(FontWeight.Bold)
            }
            .width('100%')
            .padding(12)
            .backgroundColor('#E3F2FD')
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

            Text('(start 晚于当前日期，不设置 selected)')
              .fontSize(12)
              .fontColor('#999999')

            Column({ space: 5 }) {
              Text('配置信息:')
                .fontSize(12)
                .fontColor('#666666')
                .fontWeight(FontWeight.Bold)
              Text(`当前日期: ${this.currentDate.toLocaleDateString()}`)
                .fontSize(11)
                .fontColor('#2196F3')
              Text(`start: ${this.startDate.toLocaleDateString()} (+ 7天)`)
                .fontSize(11)
                .fontColor('#4CAF50')
              Text(`end: ${this.endDate.toLocaleDateString()} (+ 30天)`)
                .fontSize(11)
                .fontColor('#4CAF50')
              Text(`selected: 未设置`)
                .fontSize(11)
                .fontColor('#FF9800')
            }
            .width('100%')
            .padding(8)
            .backgroundColor('#FFF9C4')
            .borderRadius(5)
            .alignItems(HorizontalAlign.Start)

            CalendarPicker({
              hintRadius: 10,
              start: this.startDate,
              end: this.endDate
              // 注意：这里不设置 selected 参数
            })
              .id('UiComponentMediaCalendarPickerDate08_01')
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
                this.selectedDateDisplay = value.toLocaleDateString();
                this.addLog(`CalendarPicker 日期选择: ${value.toLocaleDateString()}`);
                hilog.info(0x0000, 'testTag', `CalendarPicker selected: ${JSON.stringify(value)}`);
              })

            Text(`当前选择: ${this.selectedDateDisplay}`)
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

            Text('(start 晚于当前日期，不设置 selected)')
              .fontSize(12)
              .fontColor('#999999')

            Button('打开 CalendarPickerDialog')
              .fontSize(16)
              .width('80%')
              .height(45)
              .backgroundColor('#00796B')
              .fontColor('#FFFFFF')
              .fontWeight(FontWeight.Bold)
              .id('UiComponentMediaCalendarPickerDate08_02')
              .onClick(() => {
                this.addLog('点击打开 CalendarPickerDialog');
                CalendarPickerDialog.show({
                  start: this.startDate,
                  end: this.endDate,
                  // 注意：这里也不设置 selected 参数
                  onAccept: (value) => {
                    this.selectedDateDisplay = value.toLocaleDateString();
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

            Text(`Dialog 选择: ${this.selectedDateDisplay}`)
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

            Text('当 start 晚于当前系统日期，且未设置 selected 时')
              .fontSize(13)
              .fontColor('#666666')

            Text(`当前日期: ${this.currentDate.toLocaleDateString()}`)
              .fontSize(13)
              .fontColor('#666666')

            Text(`start: ${this.startDate.toLocaleDateString()} (晚于当前日期)`)
              .fontSize(13)
              .fontColor('#666666')

            Text('selected: 未设置 (不传递参数)')
              .fontSize(13)
              .fontColor('#666666')

            Text('预期行为: 选中日期为起始时间')
              .fontSize(13)
              .fontColor('#666666')
              .fontWeight(FontWeight.Bold)

            Text('组件会自动将默认选中日期设置为 start 值')
              .fontSize(13)
              .fontColor('#666666')
              .fontWeight(FontWeight.Bold)

            Text('因为当前日期小于 start，所以不能选择当前日期')
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

