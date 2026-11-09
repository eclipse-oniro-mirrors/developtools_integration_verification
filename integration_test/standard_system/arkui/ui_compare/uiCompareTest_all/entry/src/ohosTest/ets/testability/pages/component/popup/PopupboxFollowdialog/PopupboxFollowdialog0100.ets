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
struct PopupboxFollowdialog0100 {
  @State visible: boolean = false
  @State arrowPointPosition: ArrowPointPosition = ArrowPointPosition.CENTER
  @State placement: Placement = Placement.Bottom

  @Builder
  popoverContent() {
    Column() {
      Text('Popover Content')
        .fontSize(16)
        .fontColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column({ space: 20 }) {
      Row({ space: 10 }) {
        Button('Center')
          .id('PopupboxFollowdialog0100_001')
          .onClick(() => {
            this.arrowPointPosition = ArrowPointPosition.CENTER
          })
        Button('END')
          .id('PopupboxFollowdialog0100_002')
          .onClick(() => {
            this.placement = Placement.Right
          })
        Button('START')
          .id('PopupboxFollowdialog0100_003')
          .onClick(() => {
            this.placement = Placement.Left
          })
      }

      Button('Click me')
        .id('PopupboxFollowdialog0100_004')
        .onClick(() => {
          this.visible = !this.visible
        })
        .bindPopup(this.visible, {
          builder: this.popoverContent,
          placement: this.placement,
          arrowPointPosition: this.arrowPointPosition
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
