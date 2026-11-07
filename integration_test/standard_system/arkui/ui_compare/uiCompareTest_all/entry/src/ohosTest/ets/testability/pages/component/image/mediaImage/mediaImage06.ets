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
struct MediaImage06 {
  @State fillColor:Color = Color.Blue
  
  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
        Image($r('app.media.imageLabel11'))
          .borderWidth(2)
          .width(110)
          .height(110)
          .focusable(true)
          .fillColor(this.fillColor)
          .margin(15)

        Image($r('app.media.imageLabel11'))
          .borderWidth(2)
          .width(110)
          .height(110)
          .focusable(true)
          .fillColor(this.fillColor)
          .margin(15)

        Image($r('app.media.imageLabel11'))
          .borderWidth(2)
          .width(110)
          .height(110)
          .focusable(true)
          .fillColor(this.fillColor)
          .margin(15)

        Button('change fillColor')
          .id('changeFillColor')
          .height(40)
          .fontSize(15)
          .fontColor(Color.Black)
          .width('70%')
          .border({ width: 1 })
          .fontWeight(300)
          .margin(10)
          .onClick(() => { 
            this.fillColor = Color.Pink
          })
          .margin({ top: 10, left: 20 })
      }
    }.height('70%')
    .width('100%')
    .padding({ right: 10, top: 10 })
  }
}
