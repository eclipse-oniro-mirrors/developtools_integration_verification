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
struct UIComponentButtonTextPickerArkUI044 {
  @State text: string = 'TTTTT';
  @State index: number = 2;
  @State space: number = 8;
  @State arrowPosition: ArrowPosition = ArrowPosition.END;
  private caseName: string = 'SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_ARKUI_1010';

  build() {
    Column() {
      Column() {
        Text(`optionFontColor：undefined`)
          .fontSize(20)
          .fontStyle(FontStyle.Normal)
          .fontWeight(FontWeight.Normal)
          .textAlign(TextAlign.Center)
          .margin(10)
      }.width('100%').height('10%').justifyContent(FlexAlign.Center).backgroundColor(0xfffaCC)
      Column() {
        Select([{ value: 'aaa' }, { value: 'bbb' },
          { value: 'ccc' }, { value: 'ddd' }])
          .id('select')
          .optionFontColor(undefined)
          .selected(this.index)
          .value(this.text)
          .font({ size: 16, weight: 500 })
          .fontColor('#182431')
          .selectedOptionFont({ size: 16, weight: 400 })
          .optionFont({ size: 16, weight: 400 })
          .space(this.space)
          .optionWidth(200)
          .arrowPosition(this.arrowPosition)
          .optionHeight(300)
          .onSelect((index: number, text?: string | undefined) => {
            console.info(this.caseName + 'Select:' + index);
            this.index = index;
            if (text) {
              this.text = text;
            }
          })
      }
    }.width('100%')
  }
}
