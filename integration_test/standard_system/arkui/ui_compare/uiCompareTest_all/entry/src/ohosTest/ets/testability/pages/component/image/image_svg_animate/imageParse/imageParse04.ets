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
struct ImageParse04 {
  @State info: string = 'loading~~';

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {

        Text('svg with feColorMatrix')
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('60%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        Text(this.info)
          .height(30)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width(200)
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(6)

        Image($r('app.media.imageLabel11'))
          .width(110)
          .height(110)
          .margin(20)
          .padding(5)
          .backgroundColor(Color.White)
          .onComplete((event) => {
            if (event) {
              this.info = 'loading success'
            }
          })

      }
    }.height('100%')
    .width('100%')
    .padding({ right: 10, top: 10 })
  }
}
