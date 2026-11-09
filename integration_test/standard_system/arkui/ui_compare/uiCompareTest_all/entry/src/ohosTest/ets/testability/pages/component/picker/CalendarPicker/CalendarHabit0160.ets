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
export struct CalendarHabit0160 {
  private selectedDate: Date = new Date();
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_HABIT_0160')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：语言设置为维吾尔语时，验证不影响CalendarPickerDialog中onAccept事件返回的value的正确性`)
        .fontSize(13)
        .fontColor(Color.Gray)

      Divider()

      Text(`当前语言：维吾尔语（镜像语言）`)
        .fontSize(14)
        .fontColor(Color.Orange)

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button(`调起CalendarPickerDialog`)
        .id('btn')
        .onClick(() => {
          CalendarPickerDialog.show({
            selected: this.selectedDate,
            onAccept: (value: Date) => {
              this.testStatus = `✅ onAccept返回正确：${value.getFullYear()}-${value.getMonth() + 1}-${value.getDate()}`;
            }
          });
        })

      Divider()

      Text(`预期结果：CalendarPickerDialog中的头部年月操作按钮、星期，日期、底部按钮镜像显示从右到左，有相关日志打印，且返回选中的日期值`)
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

