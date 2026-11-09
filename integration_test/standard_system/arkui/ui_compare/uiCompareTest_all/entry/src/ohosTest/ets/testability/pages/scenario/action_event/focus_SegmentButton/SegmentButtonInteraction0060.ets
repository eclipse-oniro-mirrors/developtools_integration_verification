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
struct SegmentButtonInteraction0060 {
  @State tabSelectedIndexes: number[] = [0];
  @State singleSelectCapsuleSelectedIndexes: number[] = [0];
  @State multiplySelectCapsuleSelectedIndexes: number[] = [];

  build() {
    Row() {
      Column() {
        Text('SegmentButton交互测试 - 点击未选中按钮')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 页签类分段按钮
        Text('1. 页签类分段按钮')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Text('当前选中：' + (this.tabSelectedIndexes.length > 0 ? `按钮${this.tabSelectedIndexes[0] + 1}` : '无'))
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 5 })
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
        Text('2. 单选胶囊类分段按钮')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Text('当前选中：' + (this.singleSelectCapsuleSelectedIndexes.length > 0 ? `单选${this.singleSelectCapsuleSelectedIndexes[0] + 1}` : '无'))
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 5 })
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

        // 多选胶囊类分段按钮
        Text('3. 多选胶囊类分段按钮')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Text('当前选中：' + (this.multiplySelectCapsuleSelectedIndexes.length > 0 ? 
          this.multiplySelectCapsuleSelectedIndexes.map(i => `多选${i + 1}`).join('、') : '无'))
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 5 })
          .width('100%')

        SegmentButton({
          options: SegmentButtonOptions.capsule({
            buttons: [
              { text: '多选1' },
              { text: '多选2' },
              { text: '多选3' },
              { text: '多选4' }
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

        Text('• 点击未选中的按钮，观察选中动效')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 页签类、单选胶囊类：点击未选中按钮，该按钮变为选中状态，原选中按钮取消选中')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 多选胶囊类：点击未选中按钮，该按钮变为选中状态，其他已选中按钮保持选中')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 选中动效：按钮状态切换时有平滑的过渡动画')
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

