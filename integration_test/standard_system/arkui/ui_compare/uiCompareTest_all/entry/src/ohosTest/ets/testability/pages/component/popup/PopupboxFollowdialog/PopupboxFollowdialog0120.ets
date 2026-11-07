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
struct PopupboxFollowdialog0120 {
  @State visible: boolean = false
  @State testIndex: number = 0
  @State popoverWidth: number = 150
  @State popoverHeight: number = 50
  @State popoverBgColor: Color = Color.Gray

  @Builder
  popoverContent() {
    Column() {
      Text('Popover Content')
        .fontSize(16)
        .fontColor(Color.White)
    }
    .width(this.popoverWidth)
    .height(this.popoverHeight)
    .backgroundColor(this.popoverBgColor)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column({ space: 20 }) {
      Button('Open PopoverDialog')
        .id('PopupboxFollowdialog0120_001')
        .onClick(() => {
          this.visible = true
        })

      Button('test++')
        .id('PopupboxFollowdialog0120_002')
        .onClick(() => {
          this.testIndex++
          if (this.testIndex % 3 === 0) {
            this.popoverWidth = 150
            this.popoverHeight = 50
            this.popoverBgColor = Color.Gray
          } else if (this.testIndex % 3 === 1) {
            this.popoverWidth = 200
            this.popoverHeight = 80
            this.popoverBgColor = Color.Blue
          } else {
            this.popoverWidth = 180
            this.popoverHeight = 60
            this.popoverBgColor = Color.Green
          }
        })

      Button('Click me')
        .id('PopupboxFollowdialog0120_003')
        .onClick(() => {
          this.visible = !this.visible
        })
        .bindPopup(this.visible, {
          builder: this.popoverContent,
          placement: Placement.Bottom
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
