/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@Entry
@Component
struct UiComponentMediaTimepickerStartEndTime03 {
  @State selectedTime1: Date = new Date('2024-01-01 12:00:00');
  @State selectedTime2: Date = new Date('2024-01-01 10:00:00');
  @State selectedTime3: Date = new Date('2024-01-01 15:00:00');

  build() {
    Scroll() {
      Column() {
        // 标题区域
        Column() {
          Text('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0022')
            .fontSize(8)
            .fontWeight(FontWeight.Bold)
            .fontColor('#007DFF')
            .id('UiComponentMediaTimepickerEnableCascade03')
            .textAlign(TextAlign.Center)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          Text('Level 3')
            .fontSize(6)
            .fontColor('#99182431')
            .margin({ top: 1 })
        }
        .width('100%')
        .padding({ top: 1, bottom: 1, left: 3, right: 3 })
        .backgroundColor('#E6F2FD')
        .borderRadius(2)
        .margin({ bottom: 1 })
        .alignItems(HorizontalAlign.Center)

        // 测试配置
        Column({ space: 1 }) {
          Text('配置: TimePicker 12h | start在end之后')
            .fontSize(6)
            .fontColor('#E65100')
            .alignSelf(ItemAlign.Start)

          Text('设置: start=18:00, end=08:00')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(8)
            .alignSelf(ItemAlign.Start)
        }
        .width('90%')
        .padding({ top: 2, bottom: 2, left: 4, right: 4 })
        .backgroundColor('#FFF5F0')
        .borderRadius(2)
        .alignItems(HorizontalAlign.Start)
        .margin({ bottom: 1 })

        // 预期效果
        Column({ space: 1 }) {
          Text('预期: 默认设置,可选全部24小时')
            .fontSize(6)
            .fontColor('#388E3C')
            .lineHeight(8)
            .alignSelf(ItemAlign.Start)
        }
        .width('90%')
        .padding({ top: 2, bottom: 2, left: 4, right: 4 })
        .backgroundColor('#E8F5E9')
        .borderRadius(2)
        .alignItems(HorizontalAlign.Start)
        .margin({ bottom: 1 })

        Divider()
          .strokeWidth(1)
          .color('#E0E0E0')
          .margin({ top: 1, bottom: 2 })

        // 测试组件区域
        Column({ space: 4 }) {
          Text('start在end之后测试')
            .fontSize(8)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')

          // TimePicker测试
          Column({ space: 2 }) {
            Text('TimePicker (start=18:00, end=08:00)')
              .fontSize(7)
              .fontColor('#D32F2F')
              .alignSelf(ItemAlign.Start)

            TimePicker({
              selected: this.selectedTime1,
              start: new Date('2024-01-01 18:00:00'),  // 18:00
              end: new Date('2024-01-01 08:00:00')     // 08:00
            })
              .useMilitaryTime(false)  // 12小时制
              .height(90)
              .onChange((value: TimePickerResult) => {
                this.selectedTime1.setHours(value.hour ?? 0, value.minute ?? 0);
              })

            Text(`选中: ${this.selectedTime1.getHours() % 12 || 12}:${this.selectedTime1.getMinutes().toString().padStart(2, '0')} ${this.selectedTime1.getHours() >= 12 ? 'PM' : 'AM'}`)
              .fontSize(6)
              .fontColor('#2E7D32')

            Text('预期: start>end时被忽略,可选全天24小时')
              .fontSize(6)
              .fontColor('#FF6F00')
              .margin({ top: 2 })
          }
          .width('90%')
          .padding(4)
          .backgroundColor('#FFFFFF')
          .borderRadius(3)
          .border({ width: 1, color: '#FFCDD2' })
          .alignItems(HorizontalAlign.Center)

          // 对比测试: 正常情况
          Column({ space: 2 }) {
            Text('对比: 正常设置 (start=08:00, end=18:00)')
              .fontSize(7)
              .fontColor('#1976D2')
              .alignSelf(ItemAlign.Start)

            TimePicker({
              selected: this.selectedTime2,
              start: new Date('2024-01-01 08:00:00'),  // 08:00
              end: new Date('2024-01-01 18:00:00')     // 18:00
            })
              .useMilitaryTime(false)
              .height(80)
              .onChange((value: TimePickerResult) => {
                this.selectedTime2.setHours(value.hour ?? 0, value.minute ?? 0);
              })

            Text(`选中: ${this.selectedTime2.getHours() % 12 || 12}:${this.selectedTime2.getMinutes().toString().padStart(2, '0')} ${this.selectedTime2.getHours() >= 12 ? 'PM' : 'AM'}`)
              .fontSize(6)
              .fontColor('#2E7D32')

            Text('预期: start<end正常,可选08:00-18:00')
              .fontSize(6)
              .fontColor('#1976D2')
              .margin({ top: 2 })
          }
          .width('90%')
          .padding(4)
          .backgroundColor('#E3F2FD')
          .borderRadius(3)
          .border({ width: 1, color: '#90CAF9' })
          .alignItems(HorizontalAlign.Center)

          // 另一个异常场景
          Column({ space: 2 }) {
            Text('异常2: start=22:00, end=06:00')
              .fontSize(7)
              .fontColor('#D32F2F')
              .alignSelf(ItemAlign.Start)

            TimePicker({
              selected: this.selectedTime3,
              start: new Date('2024-01-01 22:00:00'),  // 22:00
              end: new Date('2024-01-01 06:00:00')     // 06:00
            })
              .useMilitaryTime(false)
              .height(80)
              .onChange((value: TimePickerResult) => {
                this.selectedTime3.setHours(value.hour ?? 0, value.minute ?? 0);
              })

            Text(`选中: ${this.selectedTime3.getHours() % 12 || 12}:${this.selectedTime3.getMinutes().toString().padStart(2, '0')} ${this.selectedTime3.getHours() >= 12 ? 'PM' : 'AM'}`)
              .fontSize(6)
              .fontColor('#2E7D32')

            Text('预期: 22:00>06:00,可选全天')
              .fontSize(6)
              .fontColor('#FF6F00')
              .margin({ top: 2 })
          }
          .width('90%')
          .padding(4)
          .backgroundColor('#FFFFFF')
          .borderRadius(3)
          .border({ width: 1, color: '#FFCDD2' })
          .alignItems(HorizontalAlign.Center)

          // TimePickerDialog测试
          Column({ space: 2 }) {
            Text('TimePickerDialog (start=20:00, end=10:00)')
              .fontSize(7)
              .fontColor('#D32F2F')
              .alignSelf(ItemAlign.Start)

            Button('打开Dialog')
              .fontSize(7)
              .width(100)
              .height(26)
              .onClick(() => {
                TimePickerDialog.show({
                  selected: this.selectedTime1,
                  start: new Date('2024-01-01 20:00:00'),
                  end: new Date('2024-01-01 10:00:00'),
                  useMilitaryTime: false,
                  onAccept: (value: TimePickerResult) => {
                    this.selectedTime1.setHours(value.hour ?? 0, value.minute ?? 0);
                  }
                });
              })
              .id('UiComponentMediaTimepickerEnableCascade03_01')

            Text('预期: 可选择任意时间')
              .fontSize(6)
              .fontColor('#FF6F00')
              .margin({ top: 2 })
          }
          .width('90%')
          .padding(4)
          .backgroundColor('#FFFFFF')
          .borderRadius(3)
          .border({ width: 1, color: '#FFCDD2' })
          .alignItems(HorizontalAlign.Center)
        }
        .width('100%')
        .padding({ top: 2, bottom: 2 })

        // 测试说明
        Column({ space: 2 }) {
          Text('说明')
            .fontSize(7)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF6F00')
            .alignSelf(ItemAlign.Start)

          Text('• start > end: 异常配置')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 异常时: 按默认处理,不限制')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 可选范围: 全部24小时')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)
        }
        .width('90%')
        .padding(4)
        .backgroundColor('#FFF3E0')
        .borderRadius(2)
        .margin({ top: 3, bottom: 5 })
      }
      .width('100%')
      .padding({ left: 3, right: 3, top: 1, bottom: 1 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .scrollBar(BarState.Auto)
  }
}

