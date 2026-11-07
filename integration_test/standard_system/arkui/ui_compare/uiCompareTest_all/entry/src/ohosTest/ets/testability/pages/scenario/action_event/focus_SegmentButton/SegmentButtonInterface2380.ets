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

import { SegmentButton, SegmentButtonOptions, SegmentButtonItemOptionsArray } from '@kit.ArkUI';

@Entry
@Component
struct SegmentButtonInterface2380 {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: '按钮1' },
      { text: '按钮2' },
      { text: '按钮3' }
    ]
  });
  @State tabSelectedIndexes: number[] = [0];
  @State pushResult: string = '';
  @State currentLength: number = 3;

  build() {
    Row() {
      Column() {
        Text('SegmentButton方法测试 - push方法')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 显示当前按钮数量
        Text(`当前按钮数量：${this.currentLength}`)
          .fontSize(16)
          .fontColor('#0066CC')
          .margin({ bottom: 10 })

        // 显示push操作结果
        Text(`push操作结果：${this.pushResult}`)
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

        // push按钮
        Button('push新按钮')
          .id('pushButton')
          .width('80%')
          .margin({ bottom: 10 })
          .onClick(() => {
            // 使用push方法在末尾添加新元素
            let newLength = this.tabOptions.buttons.push({ text: `按钮${this.currentLength + 1}` });
            this.currentLength = newLength;
            this.pushResult = `push成功，新长度：${newLength}`;
            console.info(`push result: new length = ${newLength}`);
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
                { text: '按钮3' }
              ]
            });
            this.currentLength = 3;
            this.pushResult = '';
            this.tabSelectedIndexes = [0];
          })

        // 测试说明
        Text('测试说明：')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Text('• 初始状态：3个按钮（按钮1、按钮2、按钮3）')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 点击"push新按钮"按钮，在末尾添加新按钮')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• push方法返回新的数组长度')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 可以多次点击，观察按钮数量增加')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 预期结果：每次push后，末尾添加新按钮，返回新长度')
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






