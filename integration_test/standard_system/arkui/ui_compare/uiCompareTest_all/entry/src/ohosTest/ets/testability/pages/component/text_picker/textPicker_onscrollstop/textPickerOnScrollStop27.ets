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
struct TextPickerOnScrollStop27 {
  @State selectedIndex: number = 2;
  @State private statusMsg: string = '等待onScrollStop事件触发...';
  private range1: string[] = ['选项1', '选项2', '选项3', '选项4', '选项5'];
  private range2: string[] = ['选项A', '选项B', '选项C', '选项D', '选项E'];
  private range3: string[] = ['选项X', '选项Y', '选项Z', '选项W', '选项V'];
  private multiRange: string[][] = [this.range1, this.range2, this.range3];
  private multipleColumnWidths: LengthMetrics[] = [
    LengthMetrics.percent(33),
    LengthMetrics.percent(33),
    LengthMetrics.percent(34)
  ];

  build() {
    Column() {
      Text('多列TextPicker循环模式鼠标向上滚轮滑动测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      TextPicker({ range: this.multiRange, columnWidths: this.multipleColumnWidths })
        .id('onscrollstop_picker_27')
        .disappearTextStyle({ color: Color.Gray, font: { size: 15, weight: FontWeight.Lighter } })
        .textStyle({ color: Color.Black, font: { size: 18, weight: FontWeight.Normal } })
        .selectedTextStyle({ color: Color.Blue, font: { size: 20, weight: FontWeight.Bold } })
        .defaultPickerItemHeight(50)
        .canLoop(true) // 循环模式
        .onChange((value: string | string[], index: number | number[]) => {
          console.info('TextPicker onChange: ' + JSON.stringify(value) + ', index: ' + JSON.stringify(index));
        })
        .onScrollStop((value: string | string[], index: number | number[]) => {
          console.info('TextPicker onScrollStop: ' + JSON.stringify(value) + ', index: ' + JSON.stringify(index));
        })
        .width('90%')
        .height(200)
        .backgroundColor(Color.White)
        .borderRadius(10)
        .margin({ bottom: 20 })
      
      Text('测试说明: 多列TextPicker循环模式，鼠标向上滚轮滑动触发onScrollStop事件')
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

