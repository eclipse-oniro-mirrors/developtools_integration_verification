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

import { SegmentButton, SegmentButtonOptions } from '@kit.ArkUI';
@Entry
@Component
struct SegmentButton0020 {
  @State multiplySelectCapsuleSelectedIndexes: number[] = [];

  build() {
    Row() {
      Column() {
        Text('多选类胶囊分段按钮-无障碍')
          .fontSize(20)
          .margin({ bottom: 10 })

        SegmentButton({
          options: SegmentButtonOptions.capsule({
            buttons: [
              { 
                text: '666', 
                icon: $r('app.media.closeeye'), 
                selectedIcon: $r('app.media.openeye'),
                iconAccessibilityText: '未选中 666',
                selectedIconAccessibilityText: '选中 666'
              },
              { 
                text: '666', 
                icon: $r('app.media.closeeye'), 
                selectedIcon: $r('app.media.openeye'),
                iconAccessibilityText: '未选中 666',
                selectedIconAccessibilityText: '选中 666'
              },
              { 
                text: '666', 
                icon: $r('app.media.closeeye'), 
                selectedIcon: $r('app.media.openeye'),
                iconAccessibilityText: '未选中 666',
                selectedIconAccessibilityText: '选中 666'
              }
            ],
            multiply: true
          }),
          selectedIndexes: this.multiplySelectCapsuleSelectedIndexes
        })
          .id('segmentButton0020')
          .accessibilityLevel('yes')
          .accessibilityDescription('新手提醒 666')
      }
      .width('100%')
    }
    .height('100%')
  }
}






