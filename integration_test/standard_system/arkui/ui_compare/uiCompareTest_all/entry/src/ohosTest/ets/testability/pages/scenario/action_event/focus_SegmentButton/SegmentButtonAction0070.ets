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
struct SegmentButtonAction0070 {
  @State singleSelectCapsuleSelectedIndexes: number[] = [0];
  @State isTextMode: boolean = true;

  build() {
    Row() {
      Column() {
        Text('纯文本按钮动态切换图片按钮测试')
          .fontSize(20)
          .margin({ bottom: 10 })

        // 纯文本按钮（带textPadding）
        if (this.isTextMode) {
          SegmentButton({
            options: SegmentButtonOptions.capsule({
              buttons: [
                { text: '按钮1' },
                { text: '按钮2' },
                { text: '按钮3' }
              ],
              multiply: false,
              textPadding: { top: 20, bottom: 20, left: 10, right: 10 }
            }),
            selectedIndexes: this.singleSelectCapsuleSelectedIndexes
          })
            .id('segmentButtonAction0070')
            .width('100%')
        } else {
          // 图片按钮（不继承textPadding）
          SegmentButton({
            options: SegmentButtonOptions.capsule({
              buttons: [
                { icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') },
                { icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') },
                { icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') }
              ],
              multiply: false
            }),
            selectedIndexes: this.singleSelectCapsuleSelectedIndexes
          })
            .id('segmentButtonAction0070')
            .width('100%')
        }

        Button('切换按钮类型')
          .margin({ top: 20 })
          .onClick(() => {
            this.isTextMode = !this.isTextMode;
          })

        Text(this.isTextMode ? '当前：纯文本按钮（带textPadding）' : '当前：图片按钮（不继承textPadding）')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ top: 10 })

        Text('说明：纯文本按钮设置textPadding后动态切换图片按钮，图片按钮不会继承文本的textPadding')
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

