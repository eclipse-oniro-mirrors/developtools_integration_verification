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
struct MediaTimepickerEnableCascade0071{
  @State isMilitaryTime: boolean = true;
  @State showModifierPage: boolean = false;
  @State refreshKey: number = 0;
  private selectedTime1: Date = new Date('2022-07-22T08:00:00');
  @State selectedTime2: Date = new Date('2022-07-22T00:00:00');

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

          Button('初始化时间-07:00:00')
            .margin(20)
            .onClick(() => {
              // 创建新的Date对象并设置为07:00:00，在12小时制下应该显示为7:00 AM
              let newTime = new Date(2022, 6, 22, 7, 0, 0, 0); // 年,月(0-11),日,时,分,秒,毫秒
              this.selectedTime2 = newTime;
              this.refreshKey++; // 强制刷新TimePicker
              console.info('Time initialized to 07:00:00, Date object: ' + newTime.toString());
              console.info('Hours: ' + newTime.getHours() + ', Minutes: ' + newTime.getMinutes());
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

          Text('第二个TimePicker (用于测试)')
            .fontSize(16)
            .margin(10)
          
          Text(`当前模式: ${this.isMilitaryTime ? '24小时制' : '12小时制'}`)
            .fontSize(14)
            .fontColor(Color.Blue)
            .margin(5)

          TimePicker({
            selected: this.selectedTime2
          })
            .key('timepicker2_' + this.refreshKey)
            .useMilitaryTime(this.isMilitaryTime)
            .enableCascade(true)
            .onChange((value: TimePickerResult) => {
              if (value.hour >= 0) {
                this.selectedTime2.setHours(value.hour, value.minute);
                console.info('TimePicker2 select current time is: ' + JSON.stringify(value));
              }
            })
            .onEnterSelectedArea((value: TimePickerResult) => {
              console.info('TimePicker2 item enter selected area, time is: ' + JSON.stringify(value));
            })
        }
      }
    }.width('100%')
  }
}
