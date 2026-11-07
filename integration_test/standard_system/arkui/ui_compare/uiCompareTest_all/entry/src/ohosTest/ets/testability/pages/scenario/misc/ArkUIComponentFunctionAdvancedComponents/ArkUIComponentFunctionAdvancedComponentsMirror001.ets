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

import {
  SegmentButton,
  SegmentButtonItemTuple,
  SegmentButtonOptions,
} from '@kit.ArkUI';

@Entry
@Component
struct ArkUIComponentFunctionAdvancedComponentsMirror001 {
  @State iconTextCapsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { text: 'icon1', icon: $r('app.media.startIcon'), selectedIcon: $r('app.media.foreground') },
      { text: 'icon2', icon: $r('app.media.startIcon'), selectedIcon: $r('app.media.foreground') },
      { text: 'icon3', icon: $r('app.media.startIcon'), selectedIcon: $r('app.media.foreground') }
    ],
    multiply: true,
    imageSize: { width: 10, height: 10 },
    direction: undefined
  })
  @State multiplySelectIconTextCapsuleSelectedIndexes: number[] = [1]

  build() {
    Row() {
      Column() {
        Column({ space: 25 }) {
          SegmentButton({
            options: this.iconTextCapsuleOptions,
            selectedIndexes: $multiplySelectIconTextCapsuleSelectedIndexes
          })
        }.width('90%')
      }.width('100%')
    }.height('100%')
  }
}
