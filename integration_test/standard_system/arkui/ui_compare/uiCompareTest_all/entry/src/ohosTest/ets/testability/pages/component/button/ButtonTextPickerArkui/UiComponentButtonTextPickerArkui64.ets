/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UiComponentButtonTextPickerArkui64 {
  @State ratingValue: number = 2;
  @State isOnChangeTriggered: boolean = false;

  build() {
    Column({ space: 30 }) {
      CheckboxGroup({ group: 'checkboxGroup' })
        .checkboxShape(CheckBoxShape.ROUNDED_SQUARE)
        .selectedColor('#007DFF')
        .onChange(undefined)
        .mark({
          strokeColor:Color.Black,
          size: 40,
          strokeWidth: 5
        })
        .unselectedColor(Color.Red)
        .width(30)
        .height(30)
        .id('UiComponentButtonTextPickerArkui64')
      Text('Select All')
        .fontSize(14)
        .lineHeight(20)
        .fontColor('#182431')
        .fontWeight(500)

      Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
        .selectedColor('#007DFF')
        .shape(CheckBoxShape.ROUNDED_SQUARE)
        .onChange((value: boolean) => {
          console.info('Checkbox1 change is' + value);
        })
      Text('Checkbox1')
        .fontSize(14)
        .lineHeight(20)
        .fontColor('#182431')
        .fontWeight(500)

      Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
        .selectedColor('#007DFF')
        .shape(CheckBoxShape.ROUNDED_SQUARE)
        .onChange((value: boolean) => {
          console.info('Checkbox2 change is' + value);
        })
      Text('Checkbox2')
        .fontSize(14)
        .lineHeight(20)
        .fontColor('#182431')
        .fontWeight(500)

      Checkbox({ name: 'checkbox3', group: 'checkboxGroup' })
        .selectedColor('#007DFF')
        .shape(CheckBoxShape.ROUNDED_SQUARE)
        .onChange((value: boolean) => {
          console.info('Checkbox3 change is' + value);
        })
      Text('Checkbox3')
        .fontSize(14)
        .lineHeight(20)
        .fontColor('#182431')
        .fontWeight(500)

      Text(`当前评星：${this.ratingValue}星`)
        .fontColor(Color.Blue)
        .fontSize(20)
        .maxLines(3)
        .wordBreak(WordBreak.NORMAL)
        .textCase(TextCase.Normal)
        .draggable(true)
        .copyOption(CopyOptions.InApp)
        .fontColor(Color.Red)
        .margin({
          top:1,
          bottom:1,
          left:1,
          right:1
        })

      Text(`onChange是否触发：${this.isOnChangeTriggered ? "是" : "否"}`)
        .fontSize(16)
        .fontColor(this.isOnChangeTriggered ? Color.Red : Color.Green)
        .fontSize(20)
        .maxLines(3)
        .wordBreak(WordBreak.NORMAL)
        .textCase(TextCase.Normal)
        .draggable(true)
        .copyOption(CopyOptions.InApp)
        .fontColor(Color.Red)
        .margin({
          top:1,
          bottom:1,
          left:1,
          right:1
        })

      Text('操作步骤：点击星星改变评星，观察上方两个文本是否变化')
        .fontSize(12)
        .fontColor(Color.Gray)
        .width('80%')
        .textAlign(TextAlign.Center)
        .copyOption(CopyOptions.InApp)
        .margin({
          top:1,
          bottom:1,
          left:1,
          right:1
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}