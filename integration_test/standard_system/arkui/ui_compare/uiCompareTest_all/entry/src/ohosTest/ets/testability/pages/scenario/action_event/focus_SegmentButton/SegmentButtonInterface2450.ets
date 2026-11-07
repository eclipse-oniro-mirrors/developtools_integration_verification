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
  SegmentButtonTextItem,
  SegmentButtonItemOptions,
  ItemRestriction
} from '@kit.ArkUI';

@Entry
@Component
struct SegmentButtonInterface2450 {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: '按钮1' },
      { text: '按钮2' },
      { text: '按钮3' }
    ] as ItemRestriction<SegmentButtonTextItem>
  });
  @State tabSelectedIndexes: number[] = [0];
  @State operationResult: string = '';
  @State currentButtons: string = '按钮1, 按钮2, 按钮3';
  @State buttonCount: number = 3;

  build() {
    Row() {
      Column() {
        Text('SegmentButton方法测试 - 边界测试')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('（按钮数量限制：2-5个）')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 15 })

        // 显示当前按钮数量
        Text(`当前按钮数量：${this.buttonCount}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 5 })

        Text(`当前按钮：${this.currentButtons}`)
          .fontSize(12)
          .fontColor('#0066CC')
          .margin({ bottom: 10 })

        // 显示操作结果
        Text(`操作结果：${this.operationResult}`)
          .fontSize(12)
          .fontColor('#009900')
          .margin({ bottom: 15 })

        // SegmentButton组件
        SegmentButton({
          options: this.tabOptions,
          selectedIndexes: this.tabSelectedIndexes
        })
          .id('segmentButton')
          .width('100%')
          .margin({ bottom: 15 })

        // push按钮 - 添加到末尾
        Button('push添加（测试超过5个）')
          .id('pushButton')
          .width('90%')
          .height(36)
          .margin({ bottom: 8 })
          .onClick(() => {
            let beforeCount = this.buttonCount;
            let newLength = this.tabOptions.buttons.push({ text: `新${this.buttonCount + 1}` });
            this.updateCurrentButtons();
            if (this.buttonCount > beforeCount) {
              this.operationResult = `push成功，新长度：${newLength}`;
            } else {
              this.operationResult = `push无效，已达上限5个`;
            }
          })

        // unshift按钮 - 添加到开头
        Button('unshift添加（测试超过5个）')
          .id('unshiftButton')
          .width('90%')
          .height(36)
          .margin({ bottom: 8 })
          .onClick(() => {
            let beforeCount = this.buttonCount;
            let newLength = this.tabOptions.buttons.unshift({ text: `头${this.buttonCount + 1}` });
            this.updateCurrentButtons();
            if (this.buttonCount > beforeCount) {
              this.operationResult = `unshift成功，新长度：${newLength}`;
              // 调整选中索引
              this.tabSelectedIndexes = [this.tabSelectedIndexes[0] + 1];
            } else {
              this.operationResult = `unshift无效，已达上限5个`;
            }
          })

        // pop按钮 - 从末尾删除
        Button('pop删除（测试少于2个）')
          .id('popButton')
          .width('90%')
          .height(36)
          .margin({ bottom: 8 })
          .onClick(() => {
            let beforeCount = this.buttonCount;
            let removed = this.tabOptions.buttons.pop();
            this.updateCurrentButtons();
            if (this.buttonCount < beforeCount) {
              this.operationResult = `pop成功，删除了1个`;
            } else {
              this.operationResult = `pop无效，已达下限2个`;
            }
          })

        // shift按钮 - 从开头删除
        Button('shift删除（测试少于2个）')
          .id('shiftButton')
          .width('90%')
          .height(36)
          .margin({ bottom: 8 })
          .onClick(() => {
            let beforeCount = this.buttonCount;
            let removed = this.tabOptions.buttons.shift();
            this.updateCurrentButtons();
            if (this.buttonCount < beforeCount) {
              this.operationResult = `shift成功，删除了1个`;
              // 调整选中索引
              if (this.tabSelectedIndexes[0] > 0) {
                this.tabSelectedIndexes = [this.tabSelectedIndexes[0] - 1];
              }
            } else {
              this.operationResult = `shift无效，已达下限2个`;
            }
          })

        // splice按钮 - 插入超过限制
        Button('splice插入3个（测试超过5个）')
          .id('spliceInsertButton')
          .width('90%')
          .height(36)
          .margin({ bottom: 8 })
          .onClick(() => {
            let beforeCount = this.buttonCount;
            this.tabOptions.buttons.splice(1, 0,
              new SegmentButtonItemOptions({ text: 'S1' }),
              new SegmentButtonItemOptions({ text: 'S2' }),
              new SegmentButtonItemOptions({ text: 'S3' })
            );
            this.updateCurrentButtons();
            if (this.buttonCount > beforeCount) {
              this.operationResult = `splice插入成功，当前${this.buttonCount}个`;
            } else {
              this.operationResult = `splice插入无效，超过5个限制`;
            }
          })

        // 重置按钮
        Button('重置为3个')
          .id('resetButton')
          .width('80%')
          .height(36)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.tabOptions = SegmentButtonOptions.tab({
              buttons: [
                { text: '按钮1' },
                { text: '按钮2' },
                { text: '按钮3' }
              ] as ItemRestriction<SegmentButtonTextItem>
            });
            this.operationResult = '';
            this.currentButtons = '按钮1, 按钮2, 按钮3';
            this.buttonCount = 3;
            this.tabSelectedIndexes = [0];
          })

        // 测试说明
        Text('测试说明：按钮数量限制2-5个')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
          .width('100%')

        Text('• push/unshift：超过5个时无效')
          .fontSize(11)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• pop/shift：少于2个时无效')
          .fontSize(11)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• splice：超过限制时无效')
          .fontSize(11)
          .fontColor('#FF6600')
          .margin({ left: 10 })
          .width('100%')
      }
      .width('100%')
      .padding(12)
    }
    .height('100%')
  }

  updateCurrentButtons(): void {
    let buttons: string[] = [];
    for (let i = 0; i < this.tabOptions.buttons.length; i++) {
      let btn = this.tabOptions.buttons[i] as SegmentButtonTextItem;
      buttons.push(btn.text as string);
    }
    this.currentButtons = buttons.join(', ');
    this.buttonCount = this.tabOptions.buttons.length;
  }
}






