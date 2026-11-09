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
struct ImageFocus01 {
  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        // png image
        Text('png image')
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('60%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)
        Image(('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png'))
          .width(110)
          .height(110)
          .margin(15)
          .focusable(true)

        // jpg image
        Text('jpg image')
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('60%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)
        Image(('http://' + 'images.openharmony.cn' + '/活动/开发者大会20250428/大会顶端banner图.jpg'))
          .width(110)
          .height(110)
          .margin(15)
          .focusable(true)

        // gif image
        Text('gif image')
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('60%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)
        Image(('https://' + 'www.runoob.com' + '/try/demo_source/smiley-2.gif'))
          .width(110)
          .height(110)
          .margin(15)
          .focusable(true)

        // svg image
        Text('svg image')
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('60%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)
        Image(('https://' + 'images.openharmony.cn' + '/活动/技术大会20240923/补充头像/默认男头像.svg'))
          .width(110)
          .height(110)
          .margin(15)
          .focusable(true)

      }.width('100%')
      .height('100%')
    }
    .height('100%')
    .width('90%')
  }
}
