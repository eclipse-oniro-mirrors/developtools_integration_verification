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
struct UIAttributesInterfaceReconstitution058 {
  build() {
    Column() {
      Row() {
        Column() {
          Column() {
            Text('useShadowBatching值为undefined')
              .fontWeight(FontWeight.Bold)
              .fontSize(20)
          }
          .backgroundColor(0xFFE4C4)
          .margin(20)
          Column() {
            Text()
              .fontWeight(FontWeight.Bold)
              .fontSize(20)
              .fontColor(Color.White)
          }
          .justifyContent(FlexAlign.Center)
          .width('60%')
          .height('30%')
          .borderRadius(10)
          .backgroundColor(0xf56c6c)
          .shadow({
            radius: 300,
            color: Color.Yellow,
            offsetX: 0,
            offsetY: 0
          })
          Column() {
            Text()
              .fontWeight(FontWeight.Bold)
              .fontSize(20)
              .fontColor(Color.White)
          }
          .justifyContent(FlexAlign.Center)
          .width('60%')
          .height('30%')
          .backgroundColor(0x67C23A)
          .borderRadius(10)
          .translate({ y: -50 })
          .shadow({
            radius: 220,
            color: Color.Blue,
            offsetX: 0,
            offsetY: 0
          })
        }.height('80%').width('50%').justifyContent(FlexAlign.Center).useShadowBatching(undefined)
        Column() {
          Column() {
            Text('useShadowBatching值为正常值true')
              .fontWeight(FontWeight.Bold)
              .fontSize(20)
          }
          .backgroundColor(0xFFE4C4)
          .margin(20)
          Column() {
            Text()
              .fontWeight(FontWeight.Bold)
              .fontSize(20)
              .fontColor(Color.White)
          }
          .justifyContent(FlexAlign.Center)
          .width('60%')
          .height('30%')
          .borderRadius(10)
          .backgroundColor(0xf56c6c)
          .shadow({
            radius: 300,
            color: Color.Yellow,
            offsetX: 0,
            offsetY: 0
          })

          Column() {
            Text()
              .fontWeight(FontWeight.Bold)
              .fontSize(20)
              .fontColor(Color.White)
          }
          .justifyContent(FlexAlign.Center)
          .width('60%')
          .height('30%')
          .backgroundColor(0x67C23A)
          .borderRadius(10)
          .translate({ y: -50 })
          .shadow({
            radius: 220,
            color: Color.Blue,
            offsetX: 0,
            offsetY: 0
          })
        }.height('80%').width('50%').justifyContent(FlexAlign.Center).useShadowBatching(true)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('90%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}