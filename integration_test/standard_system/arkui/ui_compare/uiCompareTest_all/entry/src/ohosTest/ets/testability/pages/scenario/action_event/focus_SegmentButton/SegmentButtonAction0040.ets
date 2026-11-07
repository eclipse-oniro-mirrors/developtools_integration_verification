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
struct SegmentButtonAction0040 {
  @State singleSelectCapsuleSelectedIndexes: number[] = [0];

  build() {
    Row() {
      Column() {
        Text('单选类胶囊文本+图片文本超长测试')
          .fontSize(20)
          .margin({ bottom: 10 })

        SegmentButton({
          options: SegmentButtonOptions.capsule({
            buttons: [
              { 
                text: '这是一个非常非常非常非常非常非常非常长的文本内容，用于测试文本超长时的显示效果',
                icon: $r('app.media.closeeye'),
                selectedIcon: $r('app.media.openeye')
              },
              { 
                text: '超长文本测试超长文本测试超长文本测试超长文本测试超长文本测试',
                icon: $r('app.media.closeeye'),
                selectedIcon: $r('app.media.openeye')
              },
              { 
                text: '按钮3',
                icon: $r('app.media.closeeye'),
                selectedIcon: $r('app.media.openeye')
              }
            ],
            multiply: false
          }),
          selectedIndexes: this.singleSelectCapsuleSelectedIndexes
        })
          .id('segmentButtonAction0040')
          .width('100%')

        Text('说明：单选类文字+图片超长时，文字会逐级缩小（最小到9），如果继续超长，显示…')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ top: 20 })
          .width('100%')
      }
      .width('100%')
      .padding(16)
    }
    .height('100%')
  }
}






