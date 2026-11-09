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
struct SegmentButtonInteraction0110 {
  @State tabSelectedIndexes: number[] = [0];
  @State singleSelectCapsuleSelectedIndexes: number[] = [0];
  @State multiplySelectCapsuleSelectedIndexes: number[] = [];

  build() {
    Row() {
      Column() {
        Text('SegmentButton交互测试 - 点击图标')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 单选胶囊类分段按钮（纯图标）
        Text('1. 单选胶囊类分段按钮（纯图标）')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        SegmentButton({
          options: SegmentButtonOptions.capsule({
            buttons: [
              { icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') },
              { icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') },
              { icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') },
              { icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') }
            ],
            multiply: false
          }),
          selectedIndexes: this.tabSelectedIndexes
        })
          .id('segmentButtonIconOnly')
          .width('100%')
          .margin({ bottom: 30 })

        // 单选胶囊类分段按钮（图标+文本）
        Text('2. 单选胶囊类分段按钮（图标+文本）')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        SegmentButton({
          options: SegmentButtonOptions.capsule({
            buttons: [
              { text: '单选1', icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') },
              { text: '单选2', icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') },
              { text: '单选3', icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') },
              { text: '单选4', icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') }
            ],
            multiply: false
          }),
          selectedIndexes: this.singleSelectCapsuleSelectedIndexes
        })
          .id('segmentButtonSingleCapsule')
          .width('100%')
          .margin({ bottom: 30 })

        // 多选胶囊类分段按钮（图标+文本）
        Text('3. 多选胶囊类分段按钮（图标+文本）')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        SegmentButton({
          options: SegmentButtonOptions.capsule({
            buttons: [
              { text: '多选1', icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') },
              { text: '多选2', icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') },
              { text: '多选3', icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') },
              { text: '多选4', icon: $r('app.media.closeeye'), selectedIcon: $r('app.media.openeye') }
            ],
            multiply: true
          }),
          selectedIndexes: this.multiplySelectCapsuleSelectedIndexes
        })
          .id('segmentButtonMultiplyCapsule')
          .width('100%')
          .margin({ bottom: 30 })

        // 测试说明
        Text('测试说明：')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Text('• 点击各个按钮的图标区域')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 观察点击图标是否能选中按钮')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 纯图标单选类：点击图标，对应按钮选中')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 图标+文本单选类：点击图标，新按钮选中，原按钮取消')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 图标+文本多选类：点击图标，切换该按钮的选中状态')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 预期结果：点击图标能正常选中按钮，单选、多选效果一致')
          .fontSize(14)
          .fontColor('#FF6600')
          .margin({ left: 10 })
          .width('100%')
      }
      .width('100%')
      .padding(16)
    }
    .height('100%')
  }
}

