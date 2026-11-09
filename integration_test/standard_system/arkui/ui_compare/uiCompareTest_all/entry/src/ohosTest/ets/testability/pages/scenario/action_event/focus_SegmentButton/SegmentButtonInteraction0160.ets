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
struct SegmentButtonInteraction0160 {
  @State singleSelectCapsuleSelectedIndexes: number[] = [1];
  @State multiplySelectCapsuleSelectedIndexes: number[] = [0, 2];

  build() {
    Row() {
      Column() {
        Text('SegmentButton交互测试 - 横竖屏切换图标+文本')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })


        // 单选胶囊类分段按钮（图标+文本）
        Text('1. 单选胶囊类分段按钮（图标+文本，已选中：单选2）')
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
        Text('2. 多选胶囊类分段按钮（图标+文本，已选中：多选1、多选3）')
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

        Text('• 初始状态：竖屏模式，各按钮已有预设的选中状态')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 切换到横屏模式，观察选中/未选中图标+文本状态是否保持')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 再切换回竖屏模式，验证图标+文本状态不变')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 单选胶囊类、多选胶囊类的横竖屏切换效果一致')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 预期结果：横竖屏切换对选中/未选中图标+文本不影响（单选、多选效果一致）')
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
