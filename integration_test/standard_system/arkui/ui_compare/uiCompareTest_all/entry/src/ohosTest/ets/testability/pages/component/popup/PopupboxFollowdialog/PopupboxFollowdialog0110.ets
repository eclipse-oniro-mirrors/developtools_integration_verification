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
struct PopupboxFollowdialog0110 {
  @State visible: boolean = false
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
    Column({ space: 10 }) {
      Row({ space: 5 }) {
        Button('Left')
          .id('PopupboxFollowdialog0110_001')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.Left
          })
        Button('Right')
          .id('PopupboxFollowdialog0110_002')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.Right
          })
        Button('Top')
          .id('PopupboxFollowdialog0110_003')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.Top
          })
        Button('Bottom')
          .id('PopupboxFollowdialog0110_004')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.Bottom
          })
      }

      Row({ space: 5 }) {
        Button('TopLeft')
          .id('PopupboxFollowdialog0110_005')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.TopLeft
          })
        Button('TopRight')
          .id('PopupboxFollowdialog0110_006')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.TopRight
          })
        Button('BottomLeft')
          .id('PopupboxFollowdialog0110_007')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.BottomLeft
          })
        Button('BottomRight')
          .id('PopupboxFollowdialog0110_008')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.BottomRight
          })
      }

      Row({ space: 5 }) {
        Button('LeftTop')
          .id('PopupboxFollowdialog0110_009')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.LeftTop
          })
        Button('LeftBottom')
          .id('PopupboxFollowdialog0110_010')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.LeftBottom
          })
        Button('RightTop')
          .id('PopupboxFollowdialog0110_011')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.RightTop
          })
        Button('RightBottom')
          .id('PopupboxFollowdialog0110_012')
          .fontSize(12)
          .onClick(() => {
            this.placement = Placement.RightBottom
          })
      }

      Button('Click me')
        .id('PopupboxFollowdialog0110_013')
        .onClick(() => {
          this.visible = !this.visible
        })
        .bindPopup(this.visible, {
          builder: this.popoverContent,
          placement: this.placement
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
