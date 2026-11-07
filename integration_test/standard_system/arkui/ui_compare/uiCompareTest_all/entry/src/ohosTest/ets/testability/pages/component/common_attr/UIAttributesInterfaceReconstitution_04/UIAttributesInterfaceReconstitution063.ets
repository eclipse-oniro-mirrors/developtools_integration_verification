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
struct UIAttributesInterfaceReconstitution063 {

  build() {
    Column() {
      Row() {
        Column() {
          Text('lightUpEffect值为undefined')
            .fontSize(20)
          Text('lightUpEffect')
            .border({ width: 1 })
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .lightUpEffect(undefined)
            .height('40%')
            .width('60%')
        }.height('60%').width('50%').justifyContent(FlexAlign.Center)
        Column() {
          Text('lightUpEffect值为正常值')
            .fontSize(20)
          Text('lightUpEffect')
            .border({ width: 1 })
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .lightUpEffect(0.7)
            .height('40%')
            .width('60%')
        }.height('60%').width('50%').justifyContent(FlexAlign.Center)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('90%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}