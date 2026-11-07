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
struct UIComponentButtonTextPickerDefaultTextStyle0010 {
  @State name: string = 'UIComponentButtonTextPickerDefaultTextStyle0010';
  @State message: string = this.name;
  private select: number = 1;
  private fruits: string[] = ['AppleAppleAppleApple', 'OrangeOrangeOrangeOrange', 'BananaBananaBananaBanana', 'PeachPeachPeachPeach', 'PearPearPearPear'];

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      TextPicker({
        range: this.fruits,
        selected: this.select,
        value: this.fruits[this.select]
      })
        .disableTextStyleAnimation(true)
        .defaultTextStyle({
          color: Color.Green,
          font: {
            size: 38,
            weight: 700,
            style: FontStyle.Italic
          },
          minFontSize: 18,
          maxFontSize: 28,
          overflow: TextOverflow.Ellipsis
        })
        .margin(10)

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

}