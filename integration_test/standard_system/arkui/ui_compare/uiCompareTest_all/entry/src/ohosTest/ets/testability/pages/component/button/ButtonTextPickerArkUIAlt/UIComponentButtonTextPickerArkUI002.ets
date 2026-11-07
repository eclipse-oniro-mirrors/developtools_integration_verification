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
struct UIComponentButtonTextPickerArkUI002 {
  private select: number = 3;
  private fruits: string[] = ['apple1', 'orange2', 'peach3', 'grape4', 'watermelon5', 'durian6', 'litchi7'];
  private caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_0090';

  build() {
    Column() {
      Column() {
        Text(`textStyle:{color: Color.Red,font: {size: '16fp',weight: FontWeight.Regular}`)
          .fontSize(20)
          .fontStyle(FontStyle.Normal)
          .fontWeight(FontWeight.Normal)
          .textAlign(TextAlign.Center)
          .margin(10)
      }.width('100%').height('10%').justifyContent(FlexAlign.Center).backgroundColor(0xfffaCC)
      Column() {
        TextPicker({
          range: this.fruits,
          selected: this.select,
          value: this.fruits[this.select]
        })
          .id('textpicker')
          .margin(20)
          .onChange((value: string | string[], index: number | number[]) => {
            console.info(this.caseName + 'Picker item changed, value: ' + value + ', index: ' + index);
          })
          .onScrollStop((value: string | string[], index: number | number[]) => {
            console.info(this.caseName + 'Picker scroll stopped, value: ' + value + ', index: ' + index);
          })
          .textStyle({ color: Color.Red, font: { size: '16fp', weight: FontWeight.Regular } })
          .selectedTextStyle({ color: Color.Blue, font: { size: 35, weight: FontWeight.Bolder } })
          .defaultPickerItemHeight(50)
          .canLoop(false)
      }.width('100%').height('70%')
    }
  }
}
