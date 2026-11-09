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
struct SegmentButtonInterface2440 {
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
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('（替换个数与插入个数不一致）')
          .fontSize(14)
          .fontColor('#666666')
          .margin({ bottom: 15 })

        // 显示当前按钮数量和列表
        Text(`当前按钮数量：${this.buttonCount}`)
          .fontSize(14)
          .fontColor('#0066CC')
          .margin({ bottom: 5 })

        Text(`当前按钮：${this.currentButtons}`)
          .fontSize(12)
          .fontColor('#0066CC')
          .margin({ bottom: 10 })

        // 显示splice操作结果
        Text(`splice操作结果：${this.spliceResult}`)
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

        // 删除多个，插入少个 (删3插1)
        Button('splice(1, 3, 新A) - 删3插1')
          .id('spliceDelete3Insert1Button')
          .width('90%')
          .height(38)
          .margin({ bottom: 8 })
          .onClick(() => {
            // 从索引1开始删除3个元素，插入1个新元素
            let removed = this.tabOptions.buttons.splice(1, 3,
              new SegmentButtonItemOptions({ text: '新A' })
            );
            this.spliceResult = `删除${removed.length}个，插入1个`;
            this.updateCurrentButtons();
            console.info(`splice result: removed ${removed.length} elements`);
          })

        // 删除少个，插入多个 (删1插3) - 需要先确保不超过5个
        Button('splice(1, 1, 新B,新C,新D) - 删1插3')
          .id('spliceDelete1Insert3Button')
          .width('90%')
          .height(38)
          .margin({ bottom: 8 })
          .onClick(() => {
            if (this.buttonCount <= 3) {
              // 从索引1开始删除1个元素，插入3个新元素
              let removed = this.tabOptions.buttons.splice(1, 1,
                new SegmentButtonItemOptions({ text: '新B' }),
                new SegmentButtonItemOptions({ text: '新C' }),
                new SegmentButtonItemOptions({ text: '新D' })
              );
              this.spliceResult = `删除${removed.length}个，插入3个`;
              this.updateCurrentButtons();
              console.info(`splice result: removed ${removed.length} elements`);
            } else {
              this.spliceResult = '按钮数量过多，请先删除一些';
            }
          })

        // 删除0个，插入多个 (删0插2) - 纯插入
        Button('splice(2, 0, 插X,插Y) - 删0插2')
          .id('spliceDelete0Insert2Button')
          .width('90%')
          .height(38)
          .margin({ bottom: 8 })
          .onClick(() => {
            if (this.buttonCount <= 3) {
              // 从索引2开始删除0个元素，插入2个新元素
              let removed = this.tabOptions.buttons.splice(2, 0,
                new SegmentButtonItemOptions({ text: '插X' }),
                new SegmentButtonItemOptions({ text: '插Y' })
              );
              this.spliceResult = `删除${removed.length}个（空），插入2个`;
              this.updateCurrentButtons();
              console.info(`splice result: removed ${removed.length} elements`);
            } else {
              this.spliceResult = '按钮数量过多，请先删除一些';
            }
          })

        // 删除多个，插入0个 (删2插0) - 纯删除
        Button('splice(0, 2) - 删2插0')
          .id('spliceDelete2Insert0Button')
          .width('90%')
          .height(38)
          .margin({ bottom: 8 })
          .onClick(() => {
            if (this.buttonCount > 2) {
              // 从索引0开始删除2个元素，不插入
              let deleteCount = Math.min(2, this.buttonCount - 2);
              let removed = this.tabOptions.buttons.splice(0, deleteCount);
              this.spliceResult = `删除${removed.length}个，插入0个`;
              this.updateCurrentButtons();
              // 调整选中索引
              this.tabSelectedIndexes = [0];
              console.info(`splice result: removed ${removed.length} elements`);
            } else {
              this.spliceResult = '按钮数量不足，无法删除';
            }
          })

        // 重置按钮
        Button('重置')
          .id('resetButton')
          .width('80%')
          .height(38)
          .margin({ bottom: 10 })
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
        Text('测试说明：替换个数与插入个数不一致')
          .fontSize(13)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 5 })
          .width('100%')

        Text('• 删3插1：数组长度减少2')
          .fontSize(11)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• 删1插3：数组长度增加2')
          .fontSize(11)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• 删0插2：纯插入，数组长度增加2')
          .fontSize(11)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• 删2插0：纯删除，数组长度减少2')
          .fontSize(11)
          .margin({ left: 10, bottom: 3 })
          .width('100%')

        Text('• 预期：替换和插入个数不一致不影响插入')
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
