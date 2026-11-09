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

import { LengthMetrics } from '@kit.ArkUI';

class Bottom {
  public bottom: number = 50;
}

let bott: Bottom = new Bottom();

@Entry
@Component
struct MediaTextPicker10 {
  private select: number = 1;
  private apfruits: string[] = [
    'apple11111',
    'apple11111',
    'apple11111',
    'apple11111'
  ];
  @State widthNum: number = 90;
  @State minFontSize: Length = 14;
  @State maxFontSize: Length = 28;
  @State fontSize: Length = 28;
  @State singleColumnWidths: LengthMetrics[] = [
    LengthMetrics.vp(this.widthNum)
  ];
  @State message:string = 'before swipe';

  build() {
    Column() {
      Text('set attrs: \ndisappearTextStyle\ntextStyle、selectedTextStyle\nwithout defaultTextStyle')
        .height(80)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('80%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin(6)

      Text(this.message)
        .height(30)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('80%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin(6)

      TextPicker({ range: this.apfruits, selected: this.select, columnWidths: [LengthMetrics.vp(this.widthNum)] })
        .id('MediaTextPicker10')
        .onChange((value: string | string[], index: number | number[]) => {
          console.info('Picker item changed, value: ' + value + ', index: ' + index);
        })
        .onScrollStop((value: string | string[], index: number | number[]) => {
          console.info('Picker scroll stopped, value: ' + value + ', index: ' + index);
          this.message = 'after swipe';
        })
        .margin(bott)
        .onEnterSelectedArea((value: string | string[], index: number | number[]) => {
          console.info('Picker item enter selected area, value: ' + value + ', index: ' + index);
        })
        .disableTextStyleAnimation(false)
        .disappearTextStyle({ color: Color.Red, font: { size: 15, weight: FontWeight.Lighter } })
        .textStyle({ color: Color.Black, font: { size: 20, weight: FontWeight.Normal } })
        .selectedTextStyle({ color: Color.Blue, font: { size: 30, weight: FontWeight.Bolder } })
        .margin({ top: '10%' })
    }.width('100%')
  }
}
