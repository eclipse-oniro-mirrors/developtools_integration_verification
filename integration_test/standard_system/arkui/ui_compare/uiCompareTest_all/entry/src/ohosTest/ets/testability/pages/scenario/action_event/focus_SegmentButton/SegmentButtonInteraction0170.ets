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
struct SegmentButtonInteraction0170 {
  @State tabSelectedIndexes: number[] = [0];
  @State singleSelectCapsuleSelectedIndexes: number[] = [0];

  build() {
    Row() {
      Column() {
        Text('SegmentButton交互测试 - 鼠标滑动按钮')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 页签类分段按钮
        Text('1. 页签类分段按钮（纯文本）')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        SegmentButton({
          options: SegmentButtonOptions.tab({
            buttons: [
              { text: 'Tab1' },
              { text: 'Tab2' },
              { text: 'Tab3' },
              { text: 'Tab4' }
            ]
          }),
          selectedIndexes: this.tabSelectedIndexes
        })
          .id('segmentButtonTab')
          .width('100%')
          .margin({ bottom: 30 })

        // 单选胶囊类分段按钮
        Text('2. 单选胶囊类分段按钮（纯文本）')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        SegmentButton({
          options: SegmentButtonOptions.capsule({
            buttons: [
              { text: '单选1' },
              { text: '单选2' },
              { text: '单选3' },
              { text: '单选4' }
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

        Text('• 使用鼠标在按钮上进行滑动操作')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 按住鼠标左键，从一个按钮滑动到另一个按钮')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 滑动过程中观察选中状态的跟随效果')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 松开鼠标后，观察最终选中的按钮')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 页签类和单选胶囊类的鼠标滑动效果一致')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 预期结果：鼠标滑动可以滑到选中的按钮处并选中')
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






