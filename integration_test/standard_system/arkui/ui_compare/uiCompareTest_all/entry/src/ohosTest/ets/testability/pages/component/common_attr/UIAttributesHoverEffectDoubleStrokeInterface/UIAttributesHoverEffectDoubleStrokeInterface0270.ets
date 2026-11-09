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
struct UIAttributesHoverEffectDoubleStrokeInterface0270 {
  @State name: string = 'UIAttributesHoverEffectDoubleStrokeInterface0270';
  @State message: string = this.name;


  build() {
    Column() {
      Text(this.message)
        .textAlign(TextAlign.Center)
        .fontSize(20)
        .margin(10)

      Flex({
        justifyContent: FlexAlign.SpaceAround,
        alignItems: ItemAlign.Center
      }) {
        Text('DASHED')
          .backgroundColor(Color.Pink)
          .outlineStyle(OutlineStyle.DASHED)
          .outlineWidth(5)
          .outlineColor(0xAFEEEE)
          .outlineRadius(10)
          .width(120)
          .height(120)
          .textAlign(TextAlign.Center)
          .fontSize(16)
        Text('DOTTED')
          .backgroundColor(Color.Pink)
          .outline({
            width: 5,
            color: 0x317AF7,
            radius: 10,
            style: OutlineStyle.DOTTED
          })
          .width(120)
          .height(120)
          .textAlign(TextAlign.Center)
          .fontSize(16)
      }
      .width('100%')
      .height('12.3%')

      Text('.outline')
        .backgroundColor(Color.Pink)
        .fontSize(50)
        .width(300)
        .height(300)
        .outline({
          width: {
            left: 3,
            right: 6,
            top: 10,
            bottom: 15
          },
          color: {
            start: '#e3bbbb',
            end: Color.Blue,
            top: Color.Red,
            bottom: Color.Green
          },
          radius: {
            topLeft: 10,
            topRight: 20,
            bottomLeft: 40,
            bottomRight: 80
          },
          style: {
            left: OutlineStyle.DOTTED,
            right: OutlineStyle.DOTTED,
            top: OutlineStyle.DASHED,
            bottom: OutlineStyle.DASHED
          }
        })
        .textAlign(TextAlign.Center)
    }
  }

}