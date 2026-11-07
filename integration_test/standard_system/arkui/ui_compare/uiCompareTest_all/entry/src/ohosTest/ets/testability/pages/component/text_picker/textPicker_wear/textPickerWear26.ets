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

@Entry
@Component
struct TextPickerWear26 {
  @State selectedIndex: number[] = [3, 3];
  private multiOptions: string[][] = [
    ['选项1', '选项2', '选项3', '选项4', '选项5'],
    ['子选项1', '子选项2', '子选项3', '子选项4', '子选项5']
  ];
  private multipleColumnWidths: LengthMetrics[] = [
    LengthMetrics.percent(50),
    LengthMetrics.percent(50)
  ];

  build() {
    Column() {
      Text('多列TextPicker向上抛滑测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('当前选中: ' + this.multiOptions[0][this.selectedIndex[0]] + ' - ' + this.multiOptions[1][this.selectedIndex[1]])
        .fontSize(16)
        .margin({ bottom: 10 })

      TextPicker({
        range: this.multiOptions,
        selected: this.selectedIndex,
        columnWidths: this.multipleColumnWidths
      })
        .id('multi_text_picker')
        .disappearTextStyle({ color: Color.Gray, font: { size: 14, weight: FontWeight.Lighter } })
        .textStyle({ color: Color.Black, font: { size: 16, weight: FontWeight.Normal } })
        .selectedTextStyle({ color: Color.Blue, font: { size: 18, weight: FontWeight.Medium } })
        .defaultPickerItemHeight(50)
        .canLoop(false)
        .onChange((value: string | string[], index: number | number[]) => {
          this.selectedIndex = index as number[];
        })
        .onScrollStop((value: string | string[], index: number | number[]) => {
          console.info('TextPicker 多列:onScrollStop ' + JSON.stringify(value) + ', ' + 'index: ' + JSON.stringify(index));
        })
        .onEnterSelectedArea((value: string | string[], index: number | number[]) => {
          console.info('TextPicker 多列:onEnterSelectedArea ' + JSON.stringify(value) + ', ' + 'index: ' + JSON.stringify(index));
        })
        .width('90%')
        .height(200)
        .backgroundColor(Color.White)
        .borderRadius(10)
        .margin({ bottom: 20 })

      Text('测试说明: 向上抛滑观察选中项变化')
        .fontSize(14)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}