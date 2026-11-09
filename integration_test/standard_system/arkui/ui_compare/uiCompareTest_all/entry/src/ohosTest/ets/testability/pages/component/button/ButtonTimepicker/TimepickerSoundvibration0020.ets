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
@ComponentV2
export struct TimepickerSoundvibration0020 {
  @Local hapticEnabled: boolean = true;
  @Local isRtl: boolean = false;
  @Local testStatus: string = '待测试';
  @Local selectedTime: Date = new Date();

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_TIMEPICKER_SOUNDVIBRATION_0020')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：滑动过程中，动态切换TimePicker其他属性，音振正常发出`)
        .fontSize(13)
        .fontColor(Color.Gray)

      Divider()

      Text(`音振开关：${this.hapticEnabled ? '开启' : '关闭'} | RTL：${this.isRtl ? '是' : '否'}`)
        .fontSize(14)

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Row({ space: 10 }) {
        Button(this.hapticEnabled ? 'true' : 'false')
          .id('hapticBtn')
          .backgroundColor(this.hapticEnabled ? Color.Green : Color.Gray)
          .onClick(() => {
            this.hapticEnabled = !this.hapticEnabled;
            this.testStatus = `音振已${this.hapticEnabled ? '开启' : '关闭'}`;
          })

        Button('Rtl')
          .id('rtlBtn')
          .backgroundColor(this.isRtl ? Color.Orange : Color.Gray)
          .onClick(() => {
            this.isRtl = !this.isRtl;
            this.testStatus = `RTL已${this.isRtl ? '开启' : '关闭'}`;
          })
      }

      Text('TimePicker 1（快速滑动测试音振）')
        .fontSize(13)
        .alignSelf(ItemAlign.Start)

      TimePicker({
        selected: this.selectedTime
      })
        .id('timePicker1')
        .useMilitaryTime(false)
        .height(150)

      Text('TimePicker 2（动态切换属性时继续滑动）')
        .fontSize(13)
        .alignSelf(ItemAlign.Start)

      TimePicker({
        selected: this.selectedTime
      })
        .id('timePicker2')
        .useMilitaryTime(false)
        .height(150)
        .direction(this.isRtl ? Direction.Rtl : Direction.Ltr)

      Button('确认音振正常')
        .id('confirmBtn')
        .onClick(() => {
          this.testStatus = '✅ 音振功能正常';
        })

      Divider()

      Text(`预期结果：音振可正常发出`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

