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
struct DialogSpecificationsUi0080 {
  @State count1: number = 0;
  @State count2: number = 0;

  build() {
    Flex({ alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap }) {
      Column() {
        // 圆形Button不设置宽高，使用默认高度
        Row() {
          Text('Circle+label(默认)')
            .fontSize(9)
            .fontColor(0xCCCCCC)
          Text(`${this.count1}`)
            .fontSize(9)
            .fontColor(0xCCCCCC)
          Button('label')
            .type(ButtonType.Circle)
            .backgroundColor(0x317aff)
            .id('DialogSpecificationsUi0080_001')
            .onClick(() => {
              this.count1++;
            })
            .labelStyle({
              overflow: TextOverflow.Clip,
              maxLines: 1,
              minFontSize: 12,
              maxFontSize: 28,
              font: {
                size: 20,
                weight: FontWeight.Bolder,
                family: 'cursive',
                style: FontStyle.Italic
              }
            })
        }
        .margin({ top: 10 })

        // 圆角Button使用label，直径为默认高度
        Row() {
          Text('圆角+label(默认)')
            .fontSize(9)
            .fontColor(0xCCCCCC)
          Text(`${this.count2}`)
            .fontSize(9)
            .fontColor(0xCCCCCC)
          Button('overflowText')
            .type(ButtonType.Normal)
            .borderRadius(50)
            .margin({ left: 20 })
            .backgroundColor(0xF55A42)
            .id('DialogSpecificationsUi0080_002')
            .onClick(() => {
              this.count2++;
            })
            .labelStyle({
              overflow: TextOverflow.Clip,
              maxLines: 1,
              minFontSize: 12,
              maxFontSize: 88,
              font: {
                size: 20,
                weight: FontWeight.Bolder,
                family: 'cursive',
                style: FontStyle.Italic
              }
            })
        }
        .margin({ top: 10 })
      }
      .width('100%')
      .padding(20)
    }
  }
}


