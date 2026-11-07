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
struct SegmentButtonInteraction0020 {
  @State tabSelectedIndexes: number[] = [0];
  @State singleSelectCapsuleSelectedIndexes: number[] = [0];

  build() {
    Row() {
      Column() {
        Text('SegmentButton交互测试 - 滑动选中按钮')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 页签类分段按钮
        Text('1. 页签类分段按钮')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        SegmentButton({
          options: SegmentButtonOptions.tab({
            buttons: [
              { text: '按钮1' },
              { text: '按钮2' },
              { text: '按钮3' },
              { text: '按钮4' }
            ]
          }),
          selectedIndexes: this.tabSelectedIndexes
        })
          .id('segmentButtonTab')
          .width('100%')
          .margin({ bottom: 30 })

        // 单选胶囊类分段按钮
        Text('2. 单选胶囊类分段按钮')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        SegmentButton({
          options: SegmentButtonOptions.capsule({
            buttons: [
              { text: '按钮1' },
              { text: '按钮2' },
              { text: '按钮3' },
              { text: '按钮4' }
            ],
            multiply: false
          }),
          selectedIndexes: this.singleSelectCapsuleSelectedIndexes
        })
          .id('segmentButtonSingleCapsule')
          .width('100%')
          .margin({ bottom: 30 })

        // 测试说明
        Text('测试说明：')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Text('• 在按钮上进行滑动操作，观察跟手滑动效果')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 页签类和单选胶囊类的滑动效果一致')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 滑动时会跟随手指移动到对应按钮位置')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 滑动过程中，手指滑过的按钮会实时响应并切换选中状态')
          .fontSize(14)
          .fontColor('#FF6600')
          .margin({ left: 10 })
          .width('100%')

        Text('注：多选模式不支持滑动选中功能')
          .fontSize(12)
          .fontColor('#999999')
          .margin({ top: 10, left: 10 })
          .width('100%')
      }
      .width('100%')
      .padding(16)
    }
    .height('100%')
  }
}






