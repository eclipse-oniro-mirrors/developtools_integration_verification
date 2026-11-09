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

import {
  SegmentButton,
  SegmentButtonOptions,
  SegmentButtonItemOptionsArray,
  SegmentButtonItemTuple,
  SegmentButtonItemOptions
} from '@kit.ArkUI';

@Entry
@Component
struct SegmentButtonInterface2460 {
  @State capsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '按钮1' }, { text: '按钮2' }, { text: '按钮3' }] as SegmentButtonItemTuple,
    multiply: false
  });
  @State capsuleSelectedIndexes: number[] = [0];
  @State createResult: string = '';
  @State createdItemInfo: string = '';
  @State buttonCount: number = 3;

  build() {
    Row() {
      Column() {
        Text('SegmentButton方法测试 - create方法')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 20 })

        // 显示当前按钮数量
        Text(`当前按钮数量：${this.buttonCount}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 10 })

        // 显示create操作结果
        Text(`create结果：${this.createResult}`)
          .fontSize(14)
          .fontColor('#009900')
          .margin({ bottom: 10 })

        // 显示创建的Item信息
        Text(`创建的Item：${this.createdItemInfo}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 20 })

        // SegmentButton组件
        SegmentButton({
          options: this.capsuleOptions,
          selectedIndexes: this.capsuleSelectedIndexes
        })
          .id('segmentButton')
          .width('100%')
          .margin({ bottom: 30 })

        // create方法 - 使用SegmentButtonItemOptionsArray.create创建新数组
        Button('create创建新数组(3个按钮)')
          .id('createTextButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            // 使用SegmentButtonItemOptionsArray.create静态方法创建新数组
            this.capsuleOptions.buttons =
              SegmentButtonItemOptionsArray.create([{ text: '新A' }, { text: '新B' }, { text: '新C' }]);
            this.createResult = 'create创建成功';
            this.createdItemInfo = '新A, 新B, 新C';
            this.buttonCount = this.capsuleOptions.buttons.length;
            console.info(`create array success`);
          })

        // create方法 - 创建5个按钮的数组
        Button('create创建新数组(5个按钮)')
          .id('createIconTextButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            // 使用SegmentButtonItemOptionsArray.create创建5个按钮的数组
            this.capsuleOptions.buttons =
              SegmentButtonItemOptionsArray.create([
                { text: 'A' }, { text: 'B' }, { text: 'C' }, { text: 'D' }, { text: 'E' }
              ]);
            this.createResult = 'create创建5个按钮成功';
            this.createdItemInfo = 'A, B, C, D, E';
            this.buttonCount = this.capsuleOptions.buttons.length;
            console.info(`create 5 buttons success`);
          })

        // create方法 - 创建2个按钮的数组（最小数量）
        Button('create创建新数组(2个按钮)')
          .id('createAccessibilityButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            // 使用SegmentButtonItemOptionsArray.create创建2个按钮的数组
            this.capsuleOptions.buttons =
              SegmentButtonItemOptionsArray.create([{ text: '最小1' }, { text: '最小2' }]);
            this.createResult = 'create创建2个按钮成功';
            this.createdItemInfo = '最小1, 最小2';
            this.buttonCount = this.capsuleOptions.buttons.length;
            // 调整选中索引
            if (this.capsuleSelectedIndexes[0] >= this.buttonCount) {
              this.capsuleSelectedIndexes = [0];
            }
            console.info(`create 2 buttons success`);
          })

        // 重置按钮
        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 20 })
          .onClick(() => {
            this.capsuleOptions = SegmentButtonOptions.capsule({
              buttons: [{ text: '按钮1' }, { text: '按钮2' }, { text: '按钮3' }] as SegmentButtonItemTuple,
              multiply: false
            });
            this.createResult = '';
            this.createdItemInfo = '';
            this.buttonCount = 3;
            this.capsuleSelectedIndexes = [0];
          })

        // 测试说明
        Text('测试说明：')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })
          .width('100%')

        Text('• SegmentButtonItemOptionsArray.create()')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 创建一个新的SegmentButtonItemOptionsArray')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 参数为SegmentButtonItemTuple类型')
          .fontSize(14)
          .margin({ left: 10, bottom: 5 })
          .width('100%')

        Text('• 可以一次性替换整个按钮数组')
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
