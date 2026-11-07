/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentMediaTextPickerColumnWidths06 {
  @State selectedIndex: number[] = [0, 0, 0];
  @State currentWidthType: number = 0;
  private multiColumnRange: string[][] = [
    ['选项1-1', '选项1-2', '选项1-3', '选项1-4', '选项1-5'],
    ['选项2-1', '选项2-2', '选项2-3', '选项2-4', '选项2-5'],
    ['选项3-1', '选项3-2', '选项3-3', '选项3-4', '选项3-5']
  ];
  private mixedWidths1: LengthMetrics[] = [
    LengthMetrics.vp(100),
    LengthMetrics.px(120),
    LengthMetrics.percent(30)
  ];
  private mixedWidths2: LengthMetrics[] = [
    LengthMetrics.percent(110),
    LengthMetrics.vp(1500),
    LengthMetrics.px(1000)
  ];

  build() {
    Column() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0041')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .fontColor('#007DFF')
          .letterSpacing(0.3)
          .textAlign(TextAlign.Center)
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text('Level 3 测试用例')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#99182431')
          .letterSpacing(0.2)
          .textAlign(TextAlign.Center)
          .margin({ top: 2 })
          .opacity(0.8)
      }
      .width('100%')
      .padding({ top: 5, bottom: 5, left: 8, right: 8 })
      .backgroundColor('#E6F2FD')
      .borderRadius(4)
      .margin({ top: 4, bottom: 3 })
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center)
      .shadow({
        radius: 1,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 1
      })

      Column({ space: 3 }) {
        Text('测试配置')
          .fontSize(10)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Medium)
          .fontColor('#E65100')
          .letterSpacing(0.3)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 1 })

        Text('组件: TextPicker多列数据选择器')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.9)

        Text('数据类型: string[][]多列非联动')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#E84026')
          .fontWeight(FontWeight.Medium)
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('columnWidths: vp、px、percent混合设置')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.9)

        Text('单位类型: vp、px、percent混合')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.9)

        Text('测试类型: 布局测试')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.85)
      }
      .width('90%')
      .padding({ top: 6, bottom: 6, left: 8, right: 8 })
      .backgroundColor('#FFF5F0')
      .borderRadius(4)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 4, bottom: 3 })
      .border({
        width: 1,
        color: '#FFE0B2',
        style: BorderStyle.Solid
      })
      .shadow({
        radius: 2,
        color: '#0D000000',
        offsetX: 0,
        offsetY: 1
      })

      Column({ space: 3 }) {
        Text('预期效果')
          .fontSize(10)
          .fontWeight(FontWeight.Medium)
          .fontColor('#2E7D32')
          .letterSpacing(0.3)
          .alignSelf(ItemAlign.Start)
          .margin({ bottom: 2 })

        Text('✓ TextPicker组件可以正常显示')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 显示3列数据选择器')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 按照每列设定的宽度值显示（混合单位）')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 如各列总和超过单列默认宽度乘以n列，则各列等宽均匀分布')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 各列数据可以正常滚动选择')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)
      }
      .width('90%')
      .padding({ top: 6, bottom: 6, left: 8, right: 8 })
      .backgroundColor('#E8F5E9')
      .borderRadius(4)
      .alignItems(HorizontalAlign.Start)
      .margin({ top: 6, bottom: 4 })
      .border({
        width: 1,
        color: '#C8E6C9',
        style: BorderStyle.Solid
      })
      .shadow({
        radius: 2,
        color: '#0D000000',
        offsetX: 0,
        offsetY: 1
      })

      Divider()
        .strokeWidth(1)
        .color('#0A182431')
        .margin({ top: 3, bottom: 3 })
        .vertical(false)
        .lineCap(LineCapStyle.Round)

      Column({ space: 3 }) {
        Button('切换每列宽度为混合单位')
          .fontSize(10)
          .fontColor(Color.White)
          .backgroundColor('#007DFF')
          .width(200)
          .height(35)
          .borderRadius(6)
          .id('UiComponentMediaTextPickerColumnWidths06_01')
          .type(ButtonType.Normal)
          .stateEffect(true)
          .enabled(true)
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            this.currentWidthType = (this.currentWidthType + 1) % 2;
            console.info('切换混合宽度类型: ' + this.currentWidthType);
          })
          .margin({ top: 5, bottom: 5 })

        TextPicker({
          range: this.multiColumnRange,
          selected: this.selectedIndex,
          columnWidths: this.currentWidthType === 0 ? this.mixedWidths1 : this.mixedWidths2
        })
          .id('UiComponentMediaTextPickerColumnWidths06')
          .defaultPickerItemHeight(48)
          .selectedTextStyle({
            color: '#ff007dff',
            font: {
              size: '18fp',
              weight: FontWeight.Medium
            }
          })
          .textStyle({
            color: '#ff182431',
            font: {
              size: '14fp',
              weight: FontWeight.Regular
            }
          })
          .disappearTextStyle({
            color: '#ff182431',
            font: {
              size: '12fp',
              weight: FontWeight.Regular
            }
          })
          .divider({
            strokeWidth: '2px',
            startMargin: 0,
            endMargin: 0,
            color: '#33000000'
          })
          .selectedBackgroundStyle({
            color: '#E6F2FD',
          })
          .canLoop(true)
          .onChange((value: string | string[], index: number | number[]) => {
            console.info('Picker item changed, value: ' + value + ', index: ' + index);
          })
          .onScrollStop((value: string | string[], index: number | number[]) => {
            console.info('Picker scroll stopped, value: ' + value + ', index: ' + index);
          })
          .onEnterSelectedArea((value: string | string[], index: number | number[]) => {
            console.info('Picker item enter selected area, value: ' + value + ', index: ' + index);
          })
          .width('95%')
          .height(180)
          .margin({ top: 5, bottom: 10 })
      }
      .width('100%')
      .layoutWeight(1)
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center)
      .padding({ top: 6, bottom: 6 })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 6, right: 6, top: 3, bottom: 3 })
    .backgroundColor('#F5F5F5')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Start)
  }
}

