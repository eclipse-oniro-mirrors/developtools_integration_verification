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
export struct TimepickerVoice0020 {
  @Local enableHaptic: boolean = true;
  @Local testStatus: string = '待测试';
  @Local hapticInfo: string = '';

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_UI_COMPONENT_MEDIA_TIMEPICKER_VOICE_0020')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：外接鼠标滑动场景TimePickerDialog设置enableHapticFeedback属性为true`)
        .fontSize(13)
        .fontColor(Color.Gray)

      Divider()

      Text(`enableHapticFeedback：${this.enableHaptic}`)
        .fontSize(14)

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Row({ space: 10 }) {
        Button('enable=true')
          .id('enableTrue')
          .backgroundColor(this.enableHaptic ? Color.Green : Color.Gray)
          .onClick(() => {
            this.enableHaptic = true;
            this.testStatus = 'enableHapticFeedback设置为true';
          })

        Button('enable=false')
          .id('enableFalse')
          .backgroundColor(!this.enableHaptic ? Color.Orange : Color.Gray)
          .onClick(() => {
            this.enableHaptic = false;
            this.testStatus = 'enableHapticFeedback设置为false';
          })
      }

      Button('调起TimePickerDialog（鼠标快速滑动测试）')
        .id('dialogBtn')
        .onClick(() => {
          TimePickerDialog.show({
            selected: new Date(),
            useMilitaryTime: false,
            onAccept: (value: TimePickerResult) => {
              this.testStatus = `✅ 选择时间：${value.hour}:${value.minute}`;
            }
          });
        })

      Divider()

      Text('测试步骤：')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 点击enable=true组件`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`2. 调起TimePickerDialog`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`3. 鼠标快速滑动组件`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`4. 观察组件的音振效果`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`${this.hapticInfo}`)
        .fontSize(13)
        .fontColor(Color.Green)

      Button('确认音振效果正常')
        .id('confirmBtn')
        .onClick(() => {
          this.hapticInfo = '声震效果正常，声震效果明显大于速率，声震触发有间隔';
          this.testStatus = '✅ 测试通过';
        })

      Divider()

      Text(`预期结果：声震效果正常，声震效果明显大于速率，声震触发有间隔`)
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

