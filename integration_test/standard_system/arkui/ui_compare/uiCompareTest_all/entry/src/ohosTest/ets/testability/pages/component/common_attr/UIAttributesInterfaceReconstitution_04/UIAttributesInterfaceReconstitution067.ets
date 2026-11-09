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
struct UIAttributesInterfaceReconstitution067 {
  build() {
    Column() {
      Row() {
        Column() {
          Text('useEffect值为undefined')
            .fontSize(20)
          Stack() {
            Image('/closeeye.png')
              .autoResize(true)
            EffectComponent() {
              Column() {}
              .width('80%')
              .height('80%')
              .useEffect(undefined)
            }.backgroundBlurStyle(BlurStyle.Thin)
          }
        }.height('60%').width('50%').justifyContent(FlexAlign.Center).backgroundColor(0xFFE4C4)
        Column() {
          Text('useEffect值为正常值true')
            .fontSize(20)
          Stack() {
            Image('/closeeye.png')
              .autoResize(true)
            EffectComponent() {
              Column() {}
              .width('80%')
              .height('80%')
              .useEffect(true)
            }.backgroundBlurStyle(BlurStyle.Thin)
          }
        }.height('60%').width('50%').justifyContent(FlexAlign.Center).backgroundColor(0xFFE4C4)
      }
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .height('90%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}