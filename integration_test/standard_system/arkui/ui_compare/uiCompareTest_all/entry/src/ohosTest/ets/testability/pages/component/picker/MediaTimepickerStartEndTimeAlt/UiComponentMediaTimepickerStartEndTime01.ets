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
struct UiComponentMediaTimepickerStartEndTime01 {
  @State selectedTime1: Date = new Date('2024-01-01 23:00:00');
  @State selectedTime2: Date = new Date('2024-01-01 23:00:00');
  @State selectedTime3: Date = new Date('2024-01-01 23:00:00');
  @State selectedTime4: Date = new Date('2024-01-01 23:00:00');

  build() {
    Scroll() {
      Column() {
        // 标题区域
        Column() {
          Text('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0015')
            .fontSize(8)
            .fontWeight(FontWeight.Bold)
            .fontColor('#007DFF')
            .id('UiComponentMediaTimepickerEnableCascade01')
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
          Text('配置: TimePicker 24h | start/end异常值')
            .fontSize(6)
            .fontColor('#E65100')
            .alignSelf(ItemAlign.Start)

          Text('异常值: undefined、null、格式错误')
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
        
        Column({ space: 1 }) {
          Text('预期: 默认设置,可选00:00-23:59')
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
          Text('异常值测试')
            .fontSize(8)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333333')

          // 测试1: undefined
          Column({ space: 2 }) {
            Text('1. start/end = undefined')
              .fontSize(7)
              .fontColor('#D32F2F')
              .alignSelf(ItemAlign.Start)

            TimePicker({
              selected: this.selectedTime1,
              start: undefined,
              end: undefined
            })
              .useMilitaryTime(true)
              .height(90)
              .onChange((value: TimePickerResult) => {
                this.selectedTime1.setHours(value.hour ?? 0, value.minute ?? 0);
              })

            Text(`选中: ${this.selectedTime1.getHours()}:${this.selectedTime1.getMinutes().toString().padStart(2, '0')}`)
              .fontSize(6)
              .fontColor('#2E7D32')
          }
          .width('90%')
          .padding(4)
          .backgroundColor('#FFFFFF')
          .borderRadius(3)
          .border({ width: 1, color: '#FFCDD2' })
          .alignItems(HorizontalAlign.Center)

          // 测试2: null
          Column({ space: 2 }) {
            Text('2. start/end = null')
              .fontSize(7)
              .fontColor('#D32F2F')
              .alignSelf(ItemAlign.Start)

            TimePicker({
              selected: this.selectedTime2,
              start: null,
              end: null
            })
              .useMilitaryTime(true)
              .height(90)
              .onChange((value: TimePickerResult) => {
                this.selectedTime2.setHours(value.hour ?? 0, value.minute ?? 0);
              })

            Text(`选中: ${this.selectedTime2.getHours()}:${this.selectedTime2.getMinutes().toString().padStart(2, '0')}`)
              .fontSize(6)
              .fontColor('#2E7D32')
          }
          .width('90%')
          .padding(4)
          .backgroundColor('#FFFFFF')
          .borderRadius(3)
          .border({ width: 1, color: '#FFCDD2' })
          .alignItems(HorizontalAlign.Center)

          // 测试3: 格式不规范
          Column({ space: 2 }) {
            Text('3. start/end = new Date("invalid")')
              .fontSize(7)
              .fontColor('#D32F2F')
              .alignSelf(ItemAlign.Start)

            TimePicker({
              selected: this.selectedTime3,
              start: new Date('invalid'),
              end: new Date('invalid')
            })
              .useMilitaryTime(true)
              .height(90)
              .onChange((value: TimePickerResult) => {
                this.selectedTime3.setHours(value.hour ?? 0, value.minute ?? 0);
              })

            Text(`选中: ${this.selectedTime3.getHours()}:${this.selectedTime3.getMinutes().toString().padStart(2, '0')}`)
              .fontSize(6)
              .fontColor('#2E7D32')
          }
          .width('90%')
          .padding(4)
          .backgroundColor('#FFFFFF')
          .borderRadius(3)
          .border({ width: 1, color: '#FFCDD2' })
          .alignItems(HorizontalAlign.Center)

          // 测试4: TimePickerDialog
          Column({ space: 2 }) {
            Text('4. TimePickerDialog 异常值')
              .fontSize(7)
              .fontColor('#D32F2F')
              .alignSelf(ItemAlign.Start)

            Row({ space: 5 }) {
              Button('undefined')
                .fontSize(7)
                .width(70)
                .height(24)
                .onClick(() => {
                  TimePickerDialog.show({
                    selected: this.selectedTime4,
                    start: undefined,
                    end: undefined,
                    useMilitaryTime: true,
                    onAccept: (value: TimePickerResult) => {
                      this.selectedTime4.setHours(value.hour ?? 0, value.minute ?? 0);
                    }
                  });
                })
                .id('UiComponentMediaTimepickerEnableCascade01_01')

              Button('null')
                .fontSize(7)
                .width(70)
                .height(24)
                .onClick(() => {
                  TimePickerDialog.show({
                    selected: this.selectedTime4,
                    start: null,
                    end: null,
                    useMilitaryTime: true,
                    onAccept: (value: TimePickerResult) => {
                      this.selectedTime4.setHours(value.hour ?? 0, value.minute ?? 0);
                    }
                  });
                })
                .id('UiComponentMediaTimepickerEnableCascade01_02')

              Button('invalid')
                .fontSize(7)
                .width(70)
                .height(24)
                .onClick(() => {
                  TimePickerDialog.show({
                    selected: this.selectedTime4,
                    start: new Date('invalid'),
                    end: new Date('invalid'),
                    useMilitaryTime: true,
                    onAccept: (value: TimePickerResult) => {
                      this.selectedTime4.setHours(value.hour ?? 0, value.minute ?? 0);
                    }
                  });
                })
            }
            .id('UiComponentMediaTimepickerEnableCascade01_03')

            Text(`选中: ${this.selectedTime4.getHours()}:${this.selectedTime4.getMinutes().toString().padStart(2, '0')}`)
              .fontSize(6)
              .fontColor('#2E7D32')
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

          Text('• start: 起始时间 | end: 结束时间')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• undefined/null: 不限制范围')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 格式异常: 被忽略,不限制')
            .fontSize(6)
            .fontColor('#666666')
            .lineHeight(9)
            .alignSelf(ItemAlign.Start)

          Text('• 24h制: 00:00-23:59')
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
