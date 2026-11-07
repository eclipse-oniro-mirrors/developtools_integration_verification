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

@Component
struct JustifyContentFlex {
  justifyContent : number = 0;

  build() {
    Flex({ justifyContent: this.justifyContent }) {
      Text('1')
        .width('20%')
        .height(50)
        .backgroundColor(0xF5DEB3)
        .textAlign(TextAlign.Center)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .borderRadius(8)
        .margin(2)
        .id('text1')
      Text('2')
        .width('20%')
        .height(50)
        .backgroundColor(0xD2B48C)
        .textAlign(TextAlign.Center)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .borderRadius(8)
        .margin(2)
        .id('text2')
      Text('3')
        .width('20%')
        .height(50)
        .backgroundColor(0xF5DEB3)
        .textAlign(TextAlign.Center)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .borderRadius(8)
        .margin(2)
        .id('text3')
    }
    .width('90%')
    .padding(10)
    .backgroundColor(0xAFEEEE)
    .borderRadius(12)
    .border({ width: 1, color: Color.Gray, style: BorderStyle.Solid })
    .opacity(1.0)
    .visibility(Visibility.Visible)
    .id('justifyContentFlex')
  }
}

@Entry
@Component
struct PreviewContainer0030 {
  @State containerOpacity: number = 1.0;

  build() {
    Column() {
      // 添加标题
      Row() {
        Text('Flex布局示例')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor(0x333333)
          .id('title')
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 10, bottom: 10 })
      .backgroundColor(0xF0F0F0)
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
      .id('headerRow')

      Column({ space: 5 }) {
        Text('justifyContent:Start')
          .fontSize(14)
          .fontColor(0x666666)
          .width('90%')
          .fontWeight(FontWeight.Medium)
          .margin({ top: 8 })
          .id('startLabel')
        JustifyContentFlex({ justifyContent: FlexAlign.Start })
          .opacity(this.containerOpacity)
          .id('startFlex')

        Text('justifyContent:Center')
          .fontSize(14)
          .fontColor(0x666666)
          .width('90%')
          .fontWeight(FontWeight.Medium)
          .margin({ top: 8 })
          .id('centerLabel')
        JustifyContentFlex({ justifyContent: FlexAlign.Center })
          .opacity(this.containerOpacity)
          .id('centerFlex')

        Text('justifyContent:End')
          .fontSize(14)
          .fontColor(0x666666)
          .width('90%')
          .fontWeight(FontWeight.Medium)
          .margin({ top: 8 })
          .id('endLabel')
        JustifyContentFlex({ justifyContent: FlexAlign.End })
          .opacity(this.containerOpacity)
          .id('endFlex')

        Text('justifyContent:SpaceBetween')
          .fontSize(14)
          .fontColor(0x666666)
          .width('90%')
          .fontWeight(FontWeight.Medium)
          .margin({ top: 8 })
          .id('spaceBetweenLabel')
        JustifyContentFlex({ justifyContent: FlexAlign.SpaceBetween })
          .opacity(this.containerOpacity)
          .id('spaceBetweenFlex')

        Text('justifyContent:SpaceAround')
          .fontSize(14)
          .fontColor(0x666666)
          .width('90%')
          .fontWeight(FontWeight.Medium)
          .margin({ top: 8 })
          .id('spaceAroundLabel')
        JustifyContentFlex({ justifyContent: FlexAlign.SpaceAround })
          .opacity(this.containerOpacity)
          .id('spaceAroundFlex')

        Text('justifyContent:SpaceEvenly')
          .fontSize(14)
          .fontColor(0x666666)
          .width('90%')
          .fontWeight(FontWeight.Medium)
          .margin({ top: 8 })
          .id('spaceEvenlyLabel')
        JustifyContentFlex({ justifyContent: FlexAlign.SpaceEvenly })
          .opacity(this.containerOpacity)
          .id('spaceEvenlyFlex')

        // 添加透明度控制滑块
        Row() {
          Text('透明度控制:')
            .fontSize(12)
            .fontColor(0x666666)
            .margin({ right: 10 })
          Slider({
            value: this.containerOpacity * 100,
            min: 0,
            max: 100,
            step: 10,
            style: SliderStyle.OutSet
          })
            .width(200)
            .blockColor(0x007DFF)
            .trackColor(0xE0E0E0)
            .selectedColor(0x007DFF)
            .onChange((value: number) => {
              this.containerOpacity = value / 100;
            })
            .id('opacitySlider')
        }
        .width('90%')
        .margin({ top: 16, bottom: 8 })
        .justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)
        .id('opacityControl')

      }
      .width('100%')
      .margin({ top: 5 })
      .padding({ left: 16, right: 16, bottom: 16 })
      .backgroundColor(Color.White)
      .borderRadius(16)
      .shadow({ radius: 8, color: 0x20000000, offsetX: 0, offsetY: 2 })
      .id('mainColumn')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF5F5F5)
    .padding({ top: 20 })
    .id('rootColumn')
  }
}
