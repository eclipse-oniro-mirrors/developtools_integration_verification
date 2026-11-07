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
struct UIAttributesInterfaceReconstitution082 {

  build() {
    Column() {
      Row() {
        Column() {
          Column() {
            Text('sweepGradient值为undefined')
              .fontWeight(FontWeight.Bold)
              .fontSize(20)
          }
          .margin(20)
          Text()
            .width('80%')
            .height('60%')
            .textAlign(TextAlign.Center)
            .sweepGradient(undefined)
            .borderWidth(1)
            .margin(20)
        }.height('80%').width('50%').justifyContent(FlexAlign.Center)
        Column() {
          Column() {
            Text('sweepGradient值为正常值')
              .fontWeight(FontWeight.Bold)
              .fontSize(20)
          }
          .margin(20)
          Text()
            .width('80%')
            .height('60%')
            .textAlign(TextAlign.Center)
            .sweepGradient({
              center: [50, 50],
              start: 0,
              end: 359,
              colors: [[0xAFEEEE, 0.0], [0xDCDCDC, 0.5], [0x39a2db, 1.0]]
            })
            .borderWidth(1)
            .margin(20)
        }.height('80%').width('50%').justifyContent(FlexAlign.Center)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('90%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}