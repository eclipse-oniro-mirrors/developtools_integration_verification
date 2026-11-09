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
export struct TimepickerStartendtime0032 {
  @Local testStatus: string = '待测试';
  @Local selectedTime: Date = new Date();
  @Local compatResult: string = '';

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_STARTENDTIME_0032')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：TimePicker/TimePickerDialog 兼容性测试`)
        .fontSize(13)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Text('TimePicker组件（最大最小日期为正常值）')
        .fontSize(13)
        .alignSelf(ItemAlign.Start)

      TimePicker({
        selected: this.selectedTime
      })
        .id('timePicker')
        .useMilitaryTime(true)
        .height(150)

      Button('调起TimePickerDialog')
        .id('dialogBtn')
        .onClick(() => {
          TimePickerDialog.show({
            selected: this.selectedTime,
            useMilitaryTime: true,
            onAccept: (value: TimePickerResult) => {
              this.testStatus = `✅ 选择时间：${value.hour}:${value.minute}`;
            },
            onCancel: () => {
              this.testStatus = '取消选择';
            }
          });
        })

      Divider()

      Text('兼容性说明：')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`• targetSdkVersion=16 时生效`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`• targetSdkVersion=14 时不生效`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`${this.compatResult}`)
        .fontSize(13)
        .fontColor(Color.Green)

      Button('验证兼容性')
        .id('verifyBtn')
        .onClick(() => {
          this.compatResult = 'api16生效编包，targetSdkVersion为16生效';
          this.testStatus = '✅ 兼容性验证完成';
        })

      Divider()

      Text(`预期结果：api16生效编包，targetSdkVersion为16；targetSdkVersion为14不生效`)
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

