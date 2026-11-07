/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct MediaTimepickerEnableCascade0074{
  @State showModifierPage: boolean = false;
  @State refreshKey: number = 0;
  private selectedTime: Date = new Date('2022-07-22T08:00:00');
  @State private currentAmPm: string = this.getAmPm(this.selectedTime.getHours());
  @State private displayHour: number = this.get12Hour(this.selectedTime.getHours());

  // 获取上午/下午标识
  private getAmPm(hour: number): string {
    return hour < 12 ? '上午' : '下午';
  }

  // 将24小时制转换为12小时制
  private get12Hour(hour: number): number {
    if (hour === 0) {
      return 12;
    }
    if (hour > 12) {
      return hour - 12;
    }
    return hour;
  }

  // 处理时间变化的逻辑
  private handleTimeChange(value: TimePickerResult) {
    if (value.hour >= 0) {
      const newAmPm = this.getAmPm(value.hour);
      const new12Hour = this.get12Hour(value.hour);
      
      // 检测11点到12点的切换
      if (this.displayHour === 11 && new12Hour === 12) {
        // 从11点切换到12点，切换上午/下午
        this.currentAmPm = value.hour === 12 ? '下午' : '上午';
        console.info(`时间切换: 从11点到12点，切换为${this.currentAmPm}`);
      } else if (this.displayHour === 12 && new12Hour === 11) {
        // 从12点切换到11点，切换上午/下午
        this.currentAmPm = value.hour === 11 ? '上午' : '下午';
        console.info(`时间切换: 从12点到11点，切换为${this.currentAmPm}`);
      } else {
        this.currentAmPm = newAmPm;
      }
      
      this.displayHour = new12Hour;
      this.selectedTime.setHours(value.hour, value.minute);
      
      console.info(`当前时间: ${this.currentAmPm} ${this.displayHour}:${value.minute.toString().padStart(2, '0')}`);
      console.info('完整时间数据: ' + JSON.stringify(value));
    }
  }

  build() {
    Column() {
      Button('modifierPage')
        .margin(20)
        .onClick(() => {
          this.showModifierPage = !this.showModifierPage;
        })

      if (this.showModifierPage) {
        Column({ space: 20 }) {
          Text(`${this.currentAmPm} ${this.displayHour}:${this.selectedTime.getMinutes().toString().padStart(2, '0')}`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)

          TimePicker({
            selected: this.selectedTime,
          })
            .key('timepicker_' + this.refreshKey)
            .enableCascade(true)
            .loop(true)
            .onChange((value: TimePickerResult) => {
              this.handleTimeChange(value);
            })

        }.width('100%').padding(20)
      }
    }.width('100%')
  }
}
