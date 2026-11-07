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
struct MediaTimepickerEnableCascade0087 {
  @State showModifierPage: boolean = false;
  @State refreshKey: number = 0;
  private selectedTime: Date = new Date('2022-07-22T00:00:00'); // 初始时间设置为最早时间（00:00
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

  private handleTimeChange(value: TimePickerResult) {
    if (value.hour >= 0) {
      const previousAmPm = this.currentAmPm;
      const previousHour = this.displayHour;
      const previousMinute = this.selectedTime.getMinutes();
      
      const newAmPm = this.getAmPm(value.hour);
      const new12Hour = this.get12Hour(value.hour);
      
      this.currentAmPm = newAmPm;
      this.displayHour = new12Hour;
      this.selectedTime.setHours(value.hour, value.minute);
      
      if (previousAmPm !== this.currentAmPm) {
        console.info(`上午/下午切换: 从${previousAmPm}${previousHour}:${previousMinute.toString().padStart(2, '0')} 切换到 ${this.currentAmPm}${this.displayHour}:${value.minute.toString().padStart(2, '0')}`);
        console.info(`测试场景: 快速切换最早时间和最晚时间 - 上/下午切换正常`);
      }
      
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
          Text('测试场景：快速切换最早时间和最晚时间')
            .fontSize(16)
            .fontColor(Color.Blue)
            .textAlign(TextAlign.Center)
            .margin({ bottom: 10 })
          
          Text(`当前时间: ${this.currentAmPm} ${this.displayHour}:${this.selectedTime.getMinutes().toString().padStart(2, '0')}`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
          
          Text('操作提示：快速在 12:00 AM 和 11:59 PM 之间切换')
            .fontSize(14)
            .fontColor(Color.Gray)
            .textAlign(TextAlign.Center)
            .margin({ bottom: 10 })

          TimePicker({
            selected: this.selectedTime,
          })
            .key('timepicker_' + this.refreshKey)
            .enableCascade(false)
            .loop(true)
            .onChange((value: TimePickerResult) => {
              this.handleTimeChange(value);
            })

        }.width('100%').padding(20)
      }
    }.width('100%')
  }
}
