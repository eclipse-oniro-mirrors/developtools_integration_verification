/*
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
import Settings from '../../../../../test/model/Settings.ets';

@Entry
@Component
struct SegmentButtonInteraction0130 {
  @State iconOnlySelectedIndexes: number[] = [1];
  @State singleSelectCapsuleSelectedIndexes: number[] = [2];
  @State multiplySelectCapsuleSelectedIndexes: number[] = [0, 2];

  build() {
    Row() {
      Column() {
        Text('SegmentButton交互测试 - 横竖屏切换图标')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })


        // 纯图标单选胶囊类分段按钮
        Text('1. 纯图标单选胶囊类分段按钮（已选中：图标2）')
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
          selectedIndexes: this.iconOnlySelectedIndexes
        })
          .id('segmentButtonIconOnly')
          .width('100%')
          .margin({ bottom: 30 })

        // 单选胶囊类分段按钮（纯图标）
        Text('2. 单选胶囊类分段按钮（纯图标，已选中：单选3）')
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
          selectedIndexes: this.singleSelectCapsuleSelectedIndexes
        })
          .id('segmentButtonSingleCapsule')
          .width('100%')
          .margin({ bottom: 30 })

        // 多选胶囊类分段按钮（纯图标）
        Text('3. 多选胶囊类分段按钮（纯图标，已选中：多选1、多选3）')
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

        Text('• 初始状态：竖屏模式，各按钮已有预设的选中状态')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 切换到横屏模式，观察选中/未选中图标状态是否保持')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 再切换回竖屏模式，验证图标状态不变')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 纯图标、单选胶囊类、多选胶囊类的横竖屏切换效果一致')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 预期结果：横竖屏切换对选中/未选中图标不影响（页签、单选、多选效果一致）')
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
