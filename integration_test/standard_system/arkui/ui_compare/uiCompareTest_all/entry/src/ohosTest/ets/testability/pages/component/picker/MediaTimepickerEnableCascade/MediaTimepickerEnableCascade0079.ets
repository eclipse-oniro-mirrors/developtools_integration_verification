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
struct MediaTimepickerEnableCascade0079 {
  @State isMilitaryTime: boolean = true;
  @State showModifierPage: boolean = false;
  @State refreshKey: number = 0;
  @State selectedTime1: Date = new Date('2022-07-22T08:00:00');
  @State selectedTime2: Date = new Date('2022-07-22T00:00:00');
  @State private currentAmPm: string = this.getAmPm(this.selectedTime2.getHours());
  @State private displayHour: number = this.get12Hour(this.selectedTime2.getHours());

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

  // 初始化时间为00:00:00
  private initializeTime() {
    // 创建全新的Date对象，确保TimePicker能够检测到变化
    this.selectedTime2 = new Date('2022-07-22T00:00:00');
    
    this.currentAmPm = this.getAmPm(0);
    this.displayHour = this.get12Hour(0);
    this.refreshKey++; // 强制刷新TimePicker，使用新的key
    
    console.info('初始化时间为00:00:00，父级菜单显示：' + this.currentAmPm + '，小时数显示：' + this.displayHour);
    console.info('selectedTime2更新为：' + this.selectedTime2.toString());
    console.info('小时：' + this.selectedTime2.getHours() + '，分钟：' + this.selectedTime2.getMinutes());
    console.info('refreshKey更新为：' + this.refreshKey);
  }

  // 处理第二个TimePicker的时间变化
  private handleTime2Change(value: TimePickerResult) {
    if (value.hour >= 0) {
      this.selectedTime2.setHours(value.hour, value.minute);
      this.currentAmPm = this.getAmPm(value.hour);
      this.displayHour = this.get12Hour(value.hour);
      console.info('第二个TimePicker时间变化：父级菜单显示：' + this.currentAmPm + '，小时数显示：' + this.displayHour);
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
        Column() {
          Button('12小时制/24小时制')
            .margin(20)
            .onClick(() => {
              this.isMilitaryTime = !this.isMilitaryTime;
              this.refreshKey++; // 强制刷新TimePicker以更新显示格式
              console.info('Military time mode changed to: ' + this.isMilitaryTime);
            })

          Button('初始化时间-00:00:00')
            .margin(20)
            .onClick(() => {
              console.info('点击初始化按钮，当前refreshKey：' + this.refreshKey);
              console.info('初始化前selectedTime2：' + this.selectedTime2.toString());
              this.initializeTime();
              console.info('初始化后selectedTime2：' + this.selectedTime2.toString());
            })

          Text('第一个TimePicker')
            .fontSize(16)
            .margin(10)

          TimePicker({
            selected: this.selectedTime1
          })
            .key('timepicker1_' + this.refreshKey)
            .useMilitaryTime(this.isMilitaryTime)
            .enableCascade(true)
            .onChange((value: TimePickerResult) => {
              if (value.hour >= 0) {
                this.selectedTime1.setHours(value.hour, value.minute);
                console.info('TimePicker1 select current time is: ' + JSON.stringify(value));
              }
            })
            .onEnterSelectedArea((value: TimePickerResult) => {
              console.info('TimePicker1 item enter selected area, time is: ' + JSON.stringify(value));
            })

          Text('第二个TimePicker (enableCascade: false)')
            .fontSize(16)
            .margin(10)

          Text(`当前模式: ${this.isMilitaryTime ? '24小时制' : '12小时制'}`)
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin(5)

          Text(`父级菜单显示：${this.currentAmPm}`)
            .fontSize(16)
            .fontColor(Color.Red)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .margin({ bottom: 10 })

          Text(`当前时间: ${this.selectedTime2.getHours().toString().padStart(2, '0')}:${this.selectedTime2.getMinutes().toString().padStart(2, '0')}`)
            .fontSize(14)
            .fontColor(Color.Green)
            .textAlign(TextAlign.Center)
            .margin({ bottom: 10 })

          TimePicker({
            selected: this.selectedTime2
          })
            .key('timepicker2_' + this.refreshKey)
            .useMilitaryTime(this.isMilitaryTime)
            .enableCascade(false)
            .onChange((value: TimePickerResult) => {
              this.handleTime2Change(value);
            })
            .onEnterSelectedArea((value: TimePickerResult) => {
              console.info('TimePicker2 item enter selected area, time is: ' + JSON.stringify(value));
            })
        }
      }
    }.width('100%')
  }
}
