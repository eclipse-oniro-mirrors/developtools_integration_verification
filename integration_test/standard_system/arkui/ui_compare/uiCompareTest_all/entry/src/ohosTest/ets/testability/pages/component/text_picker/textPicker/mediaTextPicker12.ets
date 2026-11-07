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
import { TextPickerModifier } from '@kit.ArkUI';

class CustomModifier extends TextPickerModifier {
  applyNormalAttribute(instance: TextPickerAttribute): void {
    super.applyNormalAttribute?.(instance);
  }

  onChange1() {
    this.canLoop(true)
  }
}

@Entry
@Component
struct MediaTextPicker12 {
  private rangeArray1: string[] = [
    'apple',
    'apple',
    'apple',
    'apple'
  ];
  private rangeArray2: string[] = [
    'apple',
    'apple',
    'apple',
    'apple'
  ];
  private rangeArray3: string[] = [
    'apple',
    'apple',
    'apple',
    'apple'
  ];
  private multi: string[][] = [this.rangeArray1, this.rangeArray2, this.rangeArray3];
  @State customModifier: TextPickerModifier = new CustomModifier()
    .canLoop(false)
    .disappearTextStyle({ color: '#FF000000', font: { size: 18, weight: FontWeight.Lighter } })
    .selectedTextStyle({ color: '#FF0000FF', font: { size: 18, weight: FontWeight.Bold } })
    .textStyle({ color: '#FFFF0000', font: { size: 18, weight: FontWeight.Normal } })
    .defaultTextStyle({ minFontSize: 24, maxFontSize: 16, overflow: TextOverflow.Ellipsis })
    .selectedIndex(2)
    .defaultPickerItemHeight(40)
    .disableTextStyleAnimation(true)

  build() {
    Column() {
      Text('TextPicker Modifier\nMultiColumn\ndisableTextStyleAnimation = true\nminFontSize > maxFontSize')
        .height(80)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('80%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin(6)

      TextPicker({ range: this.multi })
        .attributeModifier(this.customModifier as CustomModifier)
        .onChange((value: string | string[], index: number | number[]) => {
          console.info('Picker item changed, value: ' + value + ', index: ' + index);
        })
        .onScrollStop((value: string | string[], index: number | number[]) => {
          console.info('Picker scroll stopped, value: ' + value + ', index: ' + index);
        })
        .onEnterSelectedArea((value: string | string[], index: number | number[]) => {
          console.info('Picker item enter selected area, value: ' + value + ', index: ' + index);
        })
        .selectedIndex([
          2,2,2
        ])
    }.width('100%')
  }
}