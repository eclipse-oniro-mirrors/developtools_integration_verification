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
struct SegmentButtonInterface2420 {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: '按钮1' },
      { text: '按钮2' },
      { text: '按钮3' }
    ]
  });
  @State tabSelectedIndexes: number[] = [0];
  @State unshiftResult: string = '';
  @State currentLength: number = 3;
  @State addCount: number = 0;

  build() {
    Row() {
      Column() {
        Text('SegmentButton方法测试 - unshift方法')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 显示当前按钮数量
        Text(`当前按钮数量：${this.currentLength}`)
          .fontSize(16)
          .fontColor('#0066CC')
          .margin({ bottom: 10 })

        // 显示unshift操作结果
        Text(`unshift操作结果：${this.unshiftResult}`)
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

        // unshift按钮
        Button('unshift添加开头按钮')
          .id('unshiftButton')
          .width('80%')
          .margin({ bottom: 10 })
          .onClick(() => {
            this.addCount++;
            // 使用unshift方法在开头添加新元素
            let newLength = this.tabOptions.buttons.unshift({ text: `新按钮${this.addCount}` });
            this.currentLength = this.tabOptions.buttons.length;
            this.unshiftResult = `新长度：${newLength}`;
            console.info(`unshift result: new length = ${newLength}`);
            // 调整选中索引（因为在开头添加了元素）
            this.tabSelectedIndexes = [this.tabSelectedIndexes[0] + 1];
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
            this.unshiftResult = '';
            this.tabSelectedIndexes = [0];
            this.addCount = 0;
          })

        // 测试说明
        Text('测试说明：')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Text('• 初始状态：3个按钮（按钮1-3）')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 点击"unshift添加开头按钮"，在开头添加新元素')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• unshift方法返回新的数组长度')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 可以多次点击，观察按钮数量增加')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 预期结果：每次unshift后，新按钮添加到开头，返回新长度')
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






