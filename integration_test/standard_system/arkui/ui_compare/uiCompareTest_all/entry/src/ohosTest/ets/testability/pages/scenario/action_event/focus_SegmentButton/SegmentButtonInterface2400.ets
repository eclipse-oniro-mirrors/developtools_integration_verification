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
struct SegmentButtonInterface2400 {
  // 页签类 - 必须有选中
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: 'Tab1' },
      { text: 'Tab2' },
      { text: 'Tab3' },
      { text: 'Tab4' }
    ]
  });
  @State tabSelectedIndexes: number[] = [2]; // 初始选中第3个（索引2）

  // 单选类 - 可以不选中
  @State singleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { text: '单选1' },
      { text: '单选2' },
      { text: '单选3' },
      { text: '单选4' }
    ],
    multiply: false
  });
  @State singleSelectedIndexes: number[] = [3]; // 初始选中第4个（索引3）

  // 多选类 - 可以不选中
  @State multiOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [
      { text: '多选1' },
      { text: '多选2' },
      { text: '多选3' },
      { text: '多选4' }
    ],
    multiply: true
  });
  @State multiSelectedIndexes: number[] = [2, 3]; // 初始选中第3、4个

  @State operationLog: string[] = [];

  build() {
    Row() {
      Column() {
        Text('SegmentButton方法测试 - pop方法节点删除场景')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        // 页签类
        Text('页签类（必须有选中）')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
          .width('100%')

        Text(`选中索引：${JSON.stringify(this.tabSelectedIndexes)}`)
          .fontSize(12)
          .fontColor('#666666')
          .margin({ bottom: 5 })
          .width('100%')

        SegmentButton({
          options: this.tabOptions,
          selectedIndexes: this.tabSelectedIndexes
        })
          .id('segmentButtonTab')
          .width('100%')
          .margin({ bottom: 10 })

        Button('pop删除Tab末尾')
          .id('popTabButton')
          .width('60%')
          .height(35)
          .fontSize(14)
          .margin({ bottom: 15 })
          .onClick(() => {
            if (this.tabOptions.buttons.length > 2) {
              let removed = this.tabOptions.buttons.pop();
              // 页签类必须有选中，如果删除的是选中项，会回到默认第一个
              if (this.tabSelectedIndexes[0] >= this.tabOptions.buttons.length) {
                this.tabSelectedIndexes = [0];
                this.operationLog.push('Tab pop: 删除选中项，回到第一个');
              } else {
                this.operationLog.push(`Tab pop: 删除 ${JSON.stringify(removed)}`);
              }
            }
          })

        // 单选类
        Text('单选类（可以不选中）')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
          .width('100%')

        Text(`选中索引：${JSON.stringify(this.singleSelectedIndexes)}`)
          .fontSize(12)
          .fontColor('#666666')
          .margin({ bottom: 5 })
          .width('100%')

        SegmentButton({
          options: this.singleOptions,
          selectedIndexes: this.singleSelectedIndexes
        })
          .id('segmentButtonSingle')
          .width('100%')
          .margin({ bottom: 10 })

        Button('pop删除单选末尾')
          .id('popSingleButton')
          .width('60%')
          .height(35)
          .fontSize(14)
          .margin({ bottom: 15 })
          .onClick(() => {
            if (this.singleOptions.buttons.length > 2) {
              let removed = this.singleOptions.buttons.pop();
              // 单选类可以不选中
              if (this.singleSelectedIndexes[0] >= this.singleOptions.buttons.length) {
                this.singleSelectedIndexes = [];
                this.operationLog.push('单选 pop: 删除选中项，变为无选中');
              } else {
                this.operationLog.push(`单选 pop: 删除 ${JSON.stringify(removed)}`);
              }
            }
          })

        // 多选类
        Text('多选类（可以不选中）')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
          .width('100%')

        Text(`选中索引：${JSON.stringify(this.multiSelectedIndexes)}`)
          .fontSize(12)
          .fontColor('#666666')
          .margin({ bottom: 5 })
          .width('100%')

        SegmentButton({
          options: this.multiOptions,
          selectedIndexes: this.multiSelectedIndexes
        })
          .id('segmentButtonMulti')
          .width('100%')
          .margin({ bottom: 10 })

        Button('pop删除多选末尾')
          .id('popMultiButton')
          .width('60%')
          .height(35)
          .fontSize(14)
          .margin({ bottom: 15 })
          .onClick(() => {
            if (this.multiOptions.buttons.length > 2) {
              let removed = this.multiOptions.buttons.pop();
              // 多选类可以不选中，过滤掉超出范围的索引
              this.multiSelectedIndexes = this.multiSelectedIndexes.filter(
                idx => idx < this.multiOptions.buttons.length
              );
              this.operationLog.push(`多选 pop: 删除 ${JSON.stringify(removed)}`);
            }
          })

        // 操作日志
        Text('操作日志：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
          .width('100%')

        Scroll() {
          Column() {
            ForEach(this.operationLog, (log: string, index: number) => {
              Text(`${index + 1}. ${log}`)
                .fontSize(12)
                .fontColor('#333333')
                .width('100%')
            })
          }
          .width('100%')
        }
        .width('100%')
        .height('6.56%')
        .backgroundColor('#F5F5F5')
        .borderRadius(5)
      }
      .width('100%')
      .padding(16)
    }
    .height('100%')
  }
}






