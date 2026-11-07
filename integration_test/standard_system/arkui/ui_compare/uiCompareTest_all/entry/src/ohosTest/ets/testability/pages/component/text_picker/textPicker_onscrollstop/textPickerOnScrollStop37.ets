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
struct TextPickerOnScrollStop37 {
  @State selectedIndex: number = 2;
  @State private statusMsg: string = '等待onScrollStop事件触发...';
  private range: string[] = ['选项1', '选项2', '选项3', '选项4', '选项5', '选项6', '选项7', '选项8', '选项9', '选项10'];
  private singleColumnWidths: LengthMetrics[] = [
    LengthMetrics.percent(100)
  ];

  build() {
    Column() {
      Text('单列TextPicker非循环模式向上跟手滑停止测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      TextPicker({ range: this.range, selected: this.selectedIndex, value: this.range[this.selectedIndex], columnWidths: this.singleColumnWidths })
        .id('onscrollstop_picker_37')
        .disappearTextStyle({ color: Color.Gray, font: { size: 15, weight: FontWeight.Lighter } })
        .textStyle({ color: Color.Black, font: { size: 18, weight: FontWeight.Normal } })
        .selectedTextStyle({ color: Color.Blue, font: { size: 20, weight: FontWeight.Bold } })
        .defaultPickerItemHeight(50)
        .canLoop(false) // 非循环模式
        .onChange((value: string | string[], index: number | number[]) => {
          this.selectedIndex = index as number;
          console.info('TextPicker onChange: ' + value + ', index: ' + index);
        })
        .onScrollStop((value: string | string[], index: number | number[]) => {
          console.info('TextPicker onScrollStop: ' + value + ', index: ' + index);
        })
        .width('80%')
        .height(200)
        .backgroundColor(Color.White)
        .borderRadius(10)
        .margin({ bottom: 20 })
      
      Text('测试说明: 单列TextPicker非循环模式，向上跟手滑停止触发onScrollStop事件')
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

