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
struct UiComponentMediaTextPickerColumnWidths19 {
  @State selectedIndex: number = 0;
  private singleColumnRange: string[] = ['选项1', '选项2', '选项3', '选项4', '选项5'];
  private columnWidths: LengthMetrics[] = [
    LengthMetrics.vp(100)
  ];

  build() {
    Column() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0022')
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .fontStyle(FontStyle.Italic)
          .fontColor('#007DFF')
          .id('UiComponentMediaTextPickerColumnWidths19_01')
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

        Text('组件: TextPicker单列数据选择器')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.9)

        Text('数据类型: string[]单列')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#E84026')
          .fontWeight(FontWeight.Medium)
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('columnWidths长度: 1')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.9)

        Text('columnWidths: [LengthMetrics.vp(100)]')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.9)

        Text('TextPicker组件宽度: 50vp')
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

        Text('✓ 显示单列数据选择器')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ columnWidths设置不生效，单列宽度显示为TextPicker组件的宽度')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 单列宽度为50vp')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 数据可以正常滚动选择')
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
        Text('设置TextPicker组件的width属性为50vp,columnWidths为100vp 左侧设置了组件宽度(且小于columnWidths为100vp) 右侧未设置组件宽度')
          .fontSize(9)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .margin({ bottom: 5 })

        Row({ space: 10 }) {
          TextPicker({
            range: this.singleColumnRange,
            selected: this.selectedIndex,
            columnWidths: this.columnWidths
          })
            .id('UiComponentMediaTextPickerColumnWidths19')
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
            .selectedBackgroundStyle({
              color: '#E6F2FD',
            })
            .divider({
              strokeWidth: '2px',
              startMargin: 0,
              endMargin: 0,
              color: '#33000000'
            })
            .canLoop(true)
            .onChange((value: string | string[], index: number | number[]) => {
              this.selectedIndex = index as number;
              console.info('Picker item changed, value: ' + value + ', index: ' + index);
            })
            .onScrollStop((value: string | string[], index: number | number[]) => {
              console.info('Picker scroll stopped, value: ' + value + ', index: ' + index);
            })
            .onEnterSelectedArea((value: string | string[], index: number | number[]) => {
              console.info('Picker item enter selected area, value: ' + value + ', index: ' + index);
            })
            .width(50)
            .height(180)

          TextPicker({
            range: this.singleColumnRange,
            selected: this.selectedIndex,
            columnWidths: this.columnWidths
          })
            .id('UiComponentMediaTextPickerColumnWidths19_02')
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
            .selectedBackgroundStyle({
              color: '#E6F2FD',
            })
            .divider({
              strokeWidth: '2px',
              startMargin: 0,
              endMargin: 0,
              color: '#33000000'
            })
            .canLoop(true)
            .onChange((value: string | string[], index: number | number[]) => {
              this.selectedIndex = index as number;
              console.info('Picker item changed, value: ' + value + ', index: ' + index);
            })
            .onScrollStop((value: string | string[], index: number | number[]) => {
              console.info('Picker scroll stopped, value: ' + value + ', index: ' + index);
            })
            .onEnterSelectedArea((value: string | string[], index: number | number[]) => {
              console.info('Picker item enter selected area, value: ' + value + ', index: ' + index);
            })
            .height(180)
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)
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

