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
export struct CalendarBarrierfree0010 {
  private selectedDate: Date = new Date();
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_BARRIERFREE_0010')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：CalendarPickerDialog验证单击上一年、上一月、下个月、下一年四个按钮能够正常播报`)
        .fontSize(13)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button(`调起CalendarPickerDialog`)
        .id('btn')
        .onClick(() => {
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            onAccept: (value: Date) => {
              this.testStatus = `✅ 选中日期：${value.getFullYear()}-${value.getMonth() + 1}-${value.getDate()}`;
            }
          });
        })

      Divider()

      Text(`预期结果：出现焦点框，且能正确播报：上一年/上一月/下一月/下一年，按钮，单指双击即可执行`)
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

