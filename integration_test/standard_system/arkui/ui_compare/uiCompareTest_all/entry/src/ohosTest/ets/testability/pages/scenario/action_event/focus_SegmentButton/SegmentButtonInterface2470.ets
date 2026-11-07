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
struct SegmentButtonInterface2470 {
  @State capsuleOptions: SegmentButtonOptions = SegmentButtonOptions.capsule({
    buttons: [{ text: '按钮1' }, { text: '按钮2' }, { text: '按钮3' }] as SegmentButtonItemTuple,
    multiply: false
  });
  @State capsuleSelectedIndexes: number[] = [1]; // 初始选中第2个按钮（索引1）
  @State operationLog: string[] = [];
  @State currentSelectedIndex: string = '1';

  build() {
    Row() {
      Column() {
        Text('SegmentButton方法测试 - create方法')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('（原数组按钮是否选中）')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 15 })

        // 显示当前选中索引
        Text(`当前选中索引：${this.currentSelectedIndex}`)
          .fontSize(16)
          .fontColor('#0066CC')
          .margin({ bottom: 15 })

        // SegmentButton组件
        SegmentButton({
          options: this.capsuleOptions,
          selectedIndexes: this.capsuleSelectedIndexes
        })
          .id('segmentButton')
          .width('100%')
          .margin({ bottom: 20 })

        // 选中按钮1
        Button('选中按钮1（索引0）')
          .id('selectButton1')
          .width('90%')
          .height(38)
          .margin({ bottom: 8 })
          .onClick(() => {
            this.capsuleSelectedIndexes = [0];
            this.currentSelectedIndex = '0';
            this.operationLog.push('选中按钮1（索引0）');
          })

        // 选中按钮2
        Button('选中按钮2（索引1）')
          .id('selectButton2')
          .width('90%')
          .height(38)
          .margin({ bottom: 8 })
          .onClick(() => {
            this.capsuleSelectedIndexes = [1];
            this.currentSelectedIndex = '1';
            this.operationLog.push('选中按钮2（索引1）');
          })

        // 选中按钮3
        Button('选中按钮3（索引2）')
          .id('selectButton3')
          .width('90%')
          .height(38)
          .margin({ bottom: 8 })
          .onClick(() => {
            this.capsuleSelectedIndexes = [2];
            this.currentSelectedIndex = '2';
            this.operationLog.push('选中按钮3（索引2）');
          })

        // create并重新创建整个数组
        Button('create新数组（观察选中状态）')
          .id('createNewArrayButton')
          .width('90%')
          .height(38)
          .margin({ bottom: 8 })
          .onClick(() => {
            // 记录当前选中索引
            let beforeIndex = this.capsuleSelectedIndexes[0];
            this.operationLog.push(`创建前选中索引：${beforeIndex}`);

            // 使用SegmentButtonItemOptionsArray.create重建数组
            this.capsuleOptions.buttons =
              SegmentButtonItemOptionsArray.create([
                { text: '新按钮A' }, { text: '新按钮B' }, { text: '新按钮C' }, { text: '新按钮D' }
              ]);

            // 检查选中状态 - 原数组按钮不会被选中
            this.operationLog.push(`创建后选中索引：${this.capsuleSelectedIndexes[0]}`);
            this.currentSelectedIndex = `${this.capsuleSelectedIndexes[0]}`;
            this.operationLog.push('预期：原数组按钮不会被选中');
          })

        // create并添加新Item
        Button('push新Item（观察选中状态）')
          .id('createAndPushButton')
          .width('90%')
          .height(38)
          .margin({ bottom: 8 })
          .onClick(() => {
            if (this.capsuleOptions.buttons.length < 5) {
              // 记录当前选中索引
              let beforeIndex = this.capsuleSelectedIndexes[0];
              this.operationLog.push(`push前选中索引：${beforeIndex}`);

              // 使用push方法添加新Item
              this.capsuleOptions.buttons.push({ text: '新增' });

              // 检查选中状态
              this.operationLog.push(`push后选中索引：${this.capsuleSelectedIndexes[0]}`);
              this.currentSelectedIndex = `${this.capsuleSelectedIndexes[0]}`;
            } else {
              this.operationLog.push('已达到5个按钮上限');
            }
          })

        // 重置按钮
        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(38)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.capsuleOptions = SegmentButtonOptions.capsule({
              buttons: [{ text: '按钮1' }, { text: '按钮2' }, { text: '按钮3' }] as SegmentButtonItemTuple,
              multiply: false
            });
            this.capsuleSelectedIndexes = [1];
            this.currentSelectedIndex = '1';
            this.operationLog = [];
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
        .height('8.2%')
        .backgroundColor('#F5F5F5')
        .borderRadius(5)
      }
      .width('100%')
      .padding(12)
    }
    .height('100%')
  }
}
