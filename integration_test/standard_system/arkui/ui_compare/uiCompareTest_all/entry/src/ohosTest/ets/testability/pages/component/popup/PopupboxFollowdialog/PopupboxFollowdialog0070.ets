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
struct PopupboxFollowdialog0070 {
  @State visible: boolean = false

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
      Button('Open PopoverDialog')
        .id('PopupboxFollowdialog0070_001')
        .onClick(() => {
          this.visible = true
        })

      Button('false')
        .id('PopupboxFollowdialog0070_002')
        .onClick(() => {
          this.visible = false
        })

      Button('true')
        .id('PopupboxFollowdialog0070_003')
        .onClick(() => {
          this.visible = true
        })

      Button('Target Button')
        .id('PopupboxFollowdialog0070_004')
        .bindPopup(this.visible, {
          builder: this.popoverContent,
          placement: Placement.Bottom
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
