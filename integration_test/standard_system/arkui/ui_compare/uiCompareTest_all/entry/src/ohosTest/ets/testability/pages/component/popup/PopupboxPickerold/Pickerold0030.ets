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
export struct Pickerold0030 {
  @Local testStatus: string = '待测试';
  @Local fontSizeInfo: string = '请调整系统字体大小进行测试';

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0030')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：验证CalendarPickerDialog的宽高保持固定，调整系统的字体大小，CalendarPickerDialog的字体会发生变化`)
        .fontSize(13)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Text(`${this.fontSizeInfo}`)
        .fontSize(13)
        .fontColor(Color.Orange)

      Button('调起CalendarPickerDialog（宽400vp，高50vp）')
        .id('dialogBtn')
        .onClick(() => {
          CalendarPickerDialog.show({
            selected: new Date(),
            onAccept: (value: Date) => {
              this.testStatus = `✅ 选中日期：${value.getFullYear()}-${value.getMonth() + 1}-${value.getDate()}`;
            }
          });
        })

      Divider()

      Text('测试步骤：')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 调整CalendarPickerDialog的宽度为400vp，高度为50vp`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`2. 调整系统的字体大小，在特大一、二、三档和小于1.75的档位来回切换`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`3. 观察字体的布局变化`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text('字体档位说明：')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`• 小（0.75）、标准（1）、大（1.15）、超大（1.3）、特大（1.45）`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`• 特大一档（1.75）、特大二档（2）、特大三档（3.2）`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Button('确认字体随系统变化')
        .id('confirmBtn')
        .onClick(() => {
          this.fontSizeInfo = 'CalendarPickerDialog的字体随着系统的字体的变化而变化';
          this.testStatus = '✅ 测试通过';
        })

      Divider()

      Text(`预期结果：CalendarPickerDialog的字体随着系统的字体的变化而变化`)
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

