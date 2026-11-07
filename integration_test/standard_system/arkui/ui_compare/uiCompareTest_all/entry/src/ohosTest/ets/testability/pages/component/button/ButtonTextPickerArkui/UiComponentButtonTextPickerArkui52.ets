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
struct UiComponentButtonTextPickerArkui52 {
  @State isMilitaryTime: boolean = true;
  private selectedTime: Date = new Date('2022-07-01T08:00:00');
  @State text :string = 'timePicker set dateTimeOptions to undefined'

  build() {
    Column() {
      Text(this.text)
        .height(80)
        .fontSize(10)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .lineHeight(10)
        .fontWeight(300)
        .margin(10)

      Button('切换12小时制/24小时制')
        .margin(30)
        .type(ButtonType.Capsule)
        .width('50%')
        .height(100)
        .backgroundColor(0x317aff)
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 10,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .fontSize(10)
        .onClick(() => {
          this.isMilitaryTime = !this.isMilitaryTime;
        })

      TimePicker({
        selected: this.selectedTime
      })
        .dateTimeOptions(undefined)
        .useMilitaryTime(this.isMilitaryTime)
        .onChange((value: TimePickerResult) => {
          if (value.hour >= 0) {
            this.selectedTime.setHours(value.hour, value.minute);
            console.info('select current time is: ' + JSON.stringify(value));
          }
        })
        .onEnterSelectedArea((value: TimePickerResult) => {
          console.info('item enter selected area, time is: ' + JSON.stringify(value));
        })
    }
    .width('100%')
  }
}