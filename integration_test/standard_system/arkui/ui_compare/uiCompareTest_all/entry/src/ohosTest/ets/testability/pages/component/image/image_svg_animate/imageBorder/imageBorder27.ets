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
struct ImageBorder27 {
  @State info:string = 'loading~~';

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Text(this.info)
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width(170)
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(6)

        Image(('https://' + 'foruda.gitee.com' + '/images/1753255402677959741/499f5538_10080759.png'))
          .width(150)
          .borderRadius(20)
          .margin(15)
          .borderImage({
            source: {
              angle: 90,
              direction: GradientDirection.Left,
              colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
            },
            slice: { end: LengthMetrics.vp(30) },
            width: 30,
          })
          .onComplete((event) => {
            if (event) {
              console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
              console.log('onComplete:event.contentWidth ' + event.contentWidth)
              console.log('onComplete:event.contentHeight ' + event.contentHeight)
              console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
              console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
              this.info = 'loading success'
            }
          })
      }
    }
    .height('100%')
    .width('90%')
  }
}
