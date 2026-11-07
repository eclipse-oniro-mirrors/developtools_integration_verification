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
struct SegmentButtonInterface2430 {
  @State tabOptions: SegmentButtonOptions = SegmentButtonOptions.tab({
    buttons: [
      { text: '按钮1' },
      { text: '按钮2' },
      { text: '按钮3' },
      { text: '按钮4' },
      { text: '按钮5' }
    ] as ItemRestriction<SegmentButtonTextItem>
  });
  @State tabSelectedIndexes: number[] = [0];
  @State spliceResult: string = '';
  @State currentButtons: string = '按钮1, 按钮2, 按钮3, 按钮4, 按钮5';
  @State buttonCount: number = 5;

  build() {
    Row() {
      Column() {
        Text('SegmentButton方法测试 - splice方法')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 15 })

        // 显示当前按钮数量
        Text(`当前按钮数量：${this.buttonCount}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 5 })

        // 显示当前按钮
        Text(`当前按钮：${this.currentButtons}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 10 })

        // 显示splice操作结果
        Text(`splice操作结果：${this.spliceResult}`)
          .fontSize(14)
          .fontColor('#009900')
          .margin({ bottom: 15 })

        // SegmentButton组件
        SegmentButton({
          options: this.tabOptions,
          selectedIndexes: this.tabSelectedIndexes
        })
          .id('segmentButton')
          .width('100%')
          .margin({ bottom: 20 })

        // splice删除按钮 - 从索引1删除2个
        Button('splice(1, 2) - 从索引1删除2个')
          .id('spliceDeleteButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            if (this.buttonCount > 2) {
              // 从索引1开始删除2个元素
              let removed = this.tabOptions.buttons.splice(1, 2);
              this.spliceResult = `删除了${removed.length}个元素`;
              this.updateCurrentButtons();
              console.info(`splice delete result: ${removed.length} elements removed`);
            } else {
              this.spliceResult = '按钮数量不足，无法删除';
            }
          })

        // splice插入按钮 - 在索引1插入2个新元素
        Button('splice(1, 0, 新A, 新B) - 在索引1插入')
          .id('spliceInsertButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            if (this.buttonCount < 5) {
              // 从索引1开始，删除0个元素，插入2个新元素
              let removed = this.tabOptions.buttons.splice(1, 0,
                new SegmentButtonItemOptions({ text: '新A' }),
                new SegmentButtonItemOptions({ text: '新B' })
              );
              this.spliceResult = `删除${removed.length}个，插入2个`;
              this.updateCurrentButtons();
              console.info(`splice insert result: ${removed.length} elements removed`);
            } else {
              this.spliceResult = '按钮数量已达上限(5个)';
            }
          })

        // splice替换按钮 - 替换索引0的元素
        Button('splice(0, 1, 替换) - 替换索引0')
          .id('spliceReplaceButton')
          .width('90%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            // 从索引0开始，删除1个元素，插入1个新元素
            let removed = this.tabOptions.buttons.splice(0, 1,
              new SegmentButtonItemOptions({ text: '替换' })
            );
            this.spliceResult = `替换了${removed.length}个元素`;
            this.updateCurrentButtons();
            console.info(`splice replace result: ${removed.length} elements removed`);
          })

        // 重置按钮
        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(40)
          .margin({ bottom: 15 })
          .onClick(() => {
            this.tabOptions = SegmentButtonOptions.tab({
              buttons: [
                { text: '按钮1' },
                { text: '按钮2' },
                { text: '按钮3' },
                { text: '按钮4' },
                { text: '按钮5' }
              ] as ItemRestriction<SegmentButtonTextItem>
            });
            this.spliceResult = '';
            this.currentButtons = '按钮1, 按钮2, 按钮3, 按钮4, 按钮5';
            this.buttonCount = 5;
            this.tabSelectedIndexes = [0];
          })

        // 测试说明
        Text('测试说明：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
          .width('100%')

        Text('• splice(start, deleteCount, ...items)')
          .fontSize(12)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• 删除从start位置开始的deleteCount个元素')
          .fontSize(12)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• 并在该位置插入items中的元素')
          .fontSize(12)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• 返回包含被删除元素的数组')
          .fontSize(12)
          .fontColor('#FF6600')
          .margin({ left: 10 })
          .width('100%')
      }
      .width('100%')
      .padding(16)
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
