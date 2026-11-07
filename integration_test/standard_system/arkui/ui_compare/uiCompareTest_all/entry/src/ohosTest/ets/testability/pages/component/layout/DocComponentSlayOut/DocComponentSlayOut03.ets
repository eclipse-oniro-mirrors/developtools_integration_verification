/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct DocComponentSlayOut03 {
  build() {
    Column({ space: 20 }) {
      Text() {
        Span('这是继承了Text样式的Span文本')
      }
      .fontSize(18)
      .backgroundColor(0xAFEEEE)
      .textAlign(TextAlign.Center)
      .fontColor(Color.Yellow)
      .fontWeight(FontWeight.Bolder)
      .border({ width: 1, color: 0xEEEEEE })
      .padding(10)
      .margin(10)

      Text() {
        Span('普通文本（继承父组件样式）')
        Span(' 红色粗体文本（覆盖继承）')
          .fontColor(0xFF0000)
          .fontWeight(FontWeight.Bold)
        Span(' 斜体文本（覆盖继承）')
          .fontStyle(FontStyle.Italic)
          .fontSize(20)
      }
      .fontSize(16)
      .fontColor(0x666666)
      .border({ width: 1, color: 0xEEEEEE })
      .padding(10)
      .margin(10)
      .fontWeight(FontWeight.Normal)
    }
    .width('90%')
    .margin({ top: 30 })
  }
}