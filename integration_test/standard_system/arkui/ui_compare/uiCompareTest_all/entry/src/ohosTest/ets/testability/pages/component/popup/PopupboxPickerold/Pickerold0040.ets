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
export struct Pickerold0040 {
  @Local testStatus: string = '待测试';
  @Local switchInfo: string = '';

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_PICKEROLD_0040')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：CalendarPickerDialog组件验证不同档位进行切换有无异常情况`)
        .fontSize(13)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button('调起CalendarPickerDialog')
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

      Text(`1. 在字体大小为1.75以下直接切换`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`2. 切换到特大一档（1.75）`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`3. 切换到特大二档（2）`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`4. 切换到特大三档（3.2）`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`5. 打开CalendarPickerDialog页面，观察适老化情况`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`${this.switchInfo}`)
        .fontSize(13)
        .fontColor(Color.Green)

      Button('确认无异常现象')
        .id('confirmBtn')
        .onClick(() => {
          this.switchInfo = '1.75以下无适老化，1.75以上有适老化，切换的时候无异常现象';
          this.testStatus = '✅ 测试通过';
        })

      Divider()

      Text(`预期结果：1.75以下无适老化，1.75以上有适老化，切换的时候无异常现象`)
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

