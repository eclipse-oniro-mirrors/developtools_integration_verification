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
struct SegmentButtonInterface2410 {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: '按钮1' },
      { text: '按钮2' },
      { text: '按钮3' },
      { text: '按钮4' },
      { text: '按钮5' }
    ]
  });
  @State tabSelectedIndexes: number[] = [0];
  @State shiftResult: string = '';
  @State currentLength: number = 5;

  build() {
    Row() {
      Column() {
        Text('SegmentButton方法测试 - shift方法')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 显示当前按钮数量
        Text(`当前按钮数量：${this.currentLength}`)
          .fontSize(16)
          .fontColor('#0066CC')
          .margin({ bottom: 10 })

        // 显示shift操作结果
        Text(`shift操作结果：${this.shiftResult}`)
          .fontSize(16)
          .fontColor('#009900')
          .margin({ bottom: 20 })

        // SegmentButton组件
        SegmentButton({
          options: this.tabOptions,
          selectedIndexes: this.tabSelectedIndexes
        })
          .id('segmentButton')
          .width('100%')
          .margin({ bottom: 30 })

        // shift按钮
        Button('shift删除开头按钮')
          .id('shiftButton')
          .width('80%')
          .margin({ bottom: 10 })
          .onClick(() => {
            if (this.currentLength > 2) {
              // 使用shift方法移除开头第一个元素
              let removedItem = this.tabOptions.buttons.shift();
              this.currentLength = this.tabOptions.buttons.length;
              if (removedItem) {
                this.shiftResult = `删除的元素：${JSON.stringify(removedItem)}`;
                console.info(`shift result: removed item = ${JSON.stringify(removedItem)}`);
              }
              // 调整选中索引
              if (this.tabSelectedIndexes[0] > 0) {
                this.tabSelectedIndexes = [this.tabSelectedIndexes[0] - 1];
              } else {
                this.tabSelectedIndexes = [0];
              }
            } else {
              this.shiftResult = '至少保留2个按钮';
            }
          })

        // 重置按钮
        Button('重置')
          .id('resetButton')
          .width('80%')
          .margin({ bottom: 20 })
          .onClick(() => {
            this.tabOptions = SegmentButtonOptions.tab({
              buttons: [
                { text: '按钮1' },
                { text: '按钮2' },
                { text: '按钮3' },
                { text: '按钮4' },
                { text: '按钮5' }
              ]
            });
            this.currentLength = 5;
            this.shiftResult = '';
            this.tabSelectedIndexes = [0];
          })

        // 测试说明
        Text('测试说明：')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Text('• 初始状态：5个按钮（按钮1-5）')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 点击"shift删除开头按钮"，移除开头第一个元素')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• shift方法返回被删除的元素')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 可以多次点击，观察按钮数量减少')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 预期结果：每次shift后，开头按钮被删除，返回被删除的元素')
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






