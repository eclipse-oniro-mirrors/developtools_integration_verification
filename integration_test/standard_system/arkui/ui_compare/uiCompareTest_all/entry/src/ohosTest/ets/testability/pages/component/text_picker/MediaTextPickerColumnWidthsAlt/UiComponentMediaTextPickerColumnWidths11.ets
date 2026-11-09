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
struct UiComponentMediaTextPickerColumnWidths11 {
  @State selectedIndex: number[] = [0, 0, 0];
  @State currentWidthType: number = 0;
  private cascade: TextCascadePickerRangeContent[] = [
    {
      text: '辽宁省',
      children: [
        { text: '沈阳市', children: [{ text: '沈河区' }, { text: '和平区' }, { text: '浑南区' }] },
        { text: '大连市', children: [{ text: '中山区' }, { text: '金州区' }, { text: '长海县' }] }
      ]
    },
    {
      text: '吉林省',
      children: [
        { text: '长春市', children: [{ text: '南关区' }, { text: '宽城区' }, { text: '朝阳区' }] },
        { text: '四平市', children: [{ text: '铁西区' }, { text: '铁东区' }, { text: '梨树县' }] }
      ]
    },
    {
      text: '黑龙江省',
      children: [
        { text: '哈尔滨市', children: [{ text: '道里区' }, { text: '道外区' }, { text: '南岗区' }] },
        { text: '牡丹江市', children: [{ text: '东安区' }, { text: '西安区' }, { text: '爱民区' }] }
      ]
    }
  ];
  private pxWidths1: LengthMetrics[] = [
    LengthMetrics.px(80),
    LengthMetrics.px(120),
    LengthMetrics.px(100)
  ];
  private pxWidths2: LengthMetrics[] = [
    LengthMetrics.px(150),
    LengthMetrics.px(150),
    LengthMetrics.px(150)
  ];

  build() {
    Column() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_MEDIA_TEXTPICKER_COLUMNWIDTHS_0056')
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

        Text('数据类型: TextCascadePickerRangeContent[]多列联动')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#E84026')
          .fontWeight(FontWeight.Medium)
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('columnWidths: 多列全是px，不同值')
          .fontSize(9)
          .fontStyle(FontStyle.Italic)
          .fontColor('#66182431')
          .letterSpacing(0.1)
          .lineHeight(12)
          .alignSelf(ItemAlign.Start)
          .opacity(0.9)

        Text('单位类型: px (物理像素)')
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

        Text('✓ 显示3列联动数据选择器')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 按照每列设定的px宽度值显示')
          .fontSize(9)
          .fontColor('#388E3C')
          .letterSpacing(0.1)
          .lineHeight(13)
          .alignSelf(ItemAlign.Start)
          .opacity(0.95)

        Text('✓ 各列数据可以正常滚动选择，支持联动')
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
        Button('切换每列宽度为多列全部px')
          .fontSize(10)
          .fontColor(Color.White)
          .id('UiComponentMediaTextPickerColumnWidths11_01')
          .backgroundColor('#007DFF')
          .width(200)
          .height(35)
          .borderRadius(6)
          .type(ButtonType.Normal)
          .stateEffect(true)
          .enabled(true)
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            this.currentWidthType = (this.currentWidthType + 1) % 2;
            console.info('切换px宽度类型: ' + this.currentWidthType);
          })
          .margin({ top: 5, bottom: 5 })

        TextPicker({
          range: this.cascade,
          selected: this.selectedIndex,
          columnWidths: this.currentWidthType === 0 ? this.pxWidths1 : this.pxWidths2
        })
          .id('UiComponentMediaTextPickerColumnWidths11')
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
            this.selectedIndex = index as number[];
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

