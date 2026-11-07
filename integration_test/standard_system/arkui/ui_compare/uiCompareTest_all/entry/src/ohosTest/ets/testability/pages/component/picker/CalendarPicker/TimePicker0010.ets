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
export struct TimePicker0010 {
  private selectedTime: Date = new Date();
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('ARKUI_COMPONENTFUNCTION_BASICCONTAINER_FORMSELECTION_TIMEPICKER_LANGUAGEORDER_0010_DUPLICATE')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：TimePicker的(24小时制、时分)首次渲染：英文（补充）`)
        .fontSize(13)
        .fontColor(Color.Gray)

      Divider()

      TimePicker({
        selected: this.selectedTime
      })
        .useMilitaryTime(true)
        .onChange((value: TimePickerResult) => {
          this.testStatus = `✅ 选择时间：${value.hour}:${value.minute}`;
        })

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button(`验证渲染`)
        .id('btn')
        .onClick(() => {
          this.testStatus = '✅ TimePicker已渲染，使用24小时制';
        })

      Divider()

      Text(`预期结果：时间显示时分，24小时制，滑动时正确返回日志`)
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

