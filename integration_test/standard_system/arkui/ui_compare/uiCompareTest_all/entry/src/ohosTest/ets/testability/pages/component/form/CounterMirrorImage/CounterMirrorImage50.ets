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
struct CounterMirrorImage50 {
  @State counterEnabled: boolean = true;

  build() {
    Column() {
      Badge({
        value: '',
        style: { badgeSize: 6, badgeColor: '#FA2A2D' },
        position:BadgePosition.Right
      }) {
        Image('/common/public_icon_off.svg')
          .width(24)
          .height(24)
      }
      .width(24)
      .height(24)
      .margin({ bottom: 4 })
      .direction(Direction.Ltr)
      Badge({
        count: 1,
        position: BadgePosition.Right,
        style: { badgeSize: 16, badgeColor: '#FA2A2D' }
      }) {
        Text('你好，世界')
          .width(177)
          .height(21)
          .textAlign(TextAlign.Start)
          .fontColor('#182431')
          .fontWeight(500)
          .fontSize(16)
          .opacity(0.9)
      }.width(240).height(21).margin({ left: 15, right: 11 }).direction(Direction.Auto)
      Badge({
        count: 1,
        position: BadgePosition.Right,
        style: { badgeSize: 16, badgeColor: '#FA2A2D' }
      }) {
        Text('你好，世界')
          .width(177)
          .height(21)
          .textAlign(TextAlign.Start)
          .fontColor('#182431')
          .fontWeight(500)
          .fontSize(16)
          .opacity(0.9)
      }.width(240).height(21).margin({ left: 15, right: 11 }).direction(Direction.Rtl)
    }
  }
}
