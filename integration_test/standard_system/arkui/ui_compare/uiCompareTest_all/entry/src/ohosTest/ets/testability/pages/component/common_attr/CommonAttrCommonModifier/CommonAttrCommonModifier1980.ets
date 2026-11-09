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

@Entry
@Component
struct CommonAttrCommonModifier1980 {
  @State currentIndex: number = 0

  build() {
    RelativeContainer() {
      Text('Row1')
        .fontSize(14)
        .width(80)
        .height(40)
        .backgroundColor(Color.Gray)
        .textAlign(TextAlign.Center)
        .id('row1')
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })

      Text('Row2')
        .fontSize(14)
        .width(80)
        .height(40)
        .backgroundColor(Color.Blue)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .id('row2')
        .alignRules({
          top: { anchor: 'row1', align: VerticalAlign.Bottom },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })

      Text('Row3')
        .fontSize(14)
        .width(80)
        .height(40)
        .backgroundColor(Color.Green)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .id('row3')
        .alignRules({
          top: { anchor: 'row2', align: VerticalAlign.Bottom },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })

      Text('Row4')
        .fontSize(14)
        .width(80)
        .height(40)
        .backgroundColor(Color.Orange)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .id('row4')
        .alignRules({
          top: { anchor: 'row3', align: VerticalAlign.Bottom },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })

      Text('Test Component')
        .fontSize(14)
        .backgroundColor(Color.Red)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .alignRules({
          top: { anchor: 'row3', align: VerticalAlign.Bottom },
          center: { anchor: 'row4', align: VerticalAlign.Center },
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
          left: { anchor: 'row3', align: HorizontalAlign.Start },
          middle: { anchor: 'row3', align: HorizontalAlign.Center },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })
        .id('alignrules_component_commonmodifier_1980')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

