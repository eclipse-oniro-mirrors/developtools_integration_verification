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

import { TabSegmentButtonV2, CapsuleSegmentButtonV2, MultiCapsuleSegmentButtonV2, SegmentButtonV2Items, SegmentButtonV2Item, promptAction } from '@kit.ArkUI';


@Entry
@ComponentV2
struct SegmentButtonV25210 {
  @Local tabSelectedIndex: number = 0;
  @Local capsuleSelectedIndex: number = 0;
  @Local multiSelectedIndexes: number[] = [0];
  @Local itemCount: number = 3;

  // 动态items数组
  @Local tabItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '页签1' },
    { text: '页签2' },
    { text: '页签3' }
  ]);

  @Local capsuleItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '选项1' },
    { text: '选项2' },
    { text: '选项3' }
  ]);

  @Local multiItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '多选1' },
    { text: '多选2' },
    { text: '多选3' }
  ]);

  @Local clickInfo: string = '未操作';

  // push操作
  pushItem() {
    this.itemCount++;
    let newTabItem: SegmentButtonV2Item = new SegmentButtonV2Item({ text: `页签${this.itemCount}` });
    let newCapsuleItem: SegmentButtonV2Item = new SegmentButtonV2Item({ text: `选项${this.itemCount}` });
    let newMultiItem: SegmentButtonV2Item = new SegmentButtonV2Item({ text: `多选${this.itemCount}` });
    this.tabItems.push(newTabItem);
    this.capsuleItems.push(newCapsuleItem);
    this.multiItems.push(newMultiItem);
    this.clickInfo = `Push: 添加第${this.itemCount}个item`;
    promptAction.showToast({ message: `Push成功，当前${this.itemCount}个item`, duration: 2000 });
  }

  // pop操作
  popItem() {
    if (this.itemCount > 2) {
      this.tabItems.pop();
      this.capsuleItems.pop();
      this.multiItems.pop();
      this.itemCount--;
      // 调整选中索引
      if (this.tabSelectedIndex >= this.itemCount) {
        this.tabSelectedIndex = this.itemCount - 1;
      }
      if (this.capsuleSelectedIndex >= this.itemCount) {
        this.capsuleSelectedIndex = this.itemCount - 1;
      }
      this.multiSelectedIndexes = this.multiSelectedIndexes.filter(i => i < this.itemCount);
      this.clickInfo = `Pop: 移除最后一个item，剩余${this.itemCount}个`;
      promptAction.showToast({ message: `Pop成功，当前${this.itemCount}个item`, duration: 2000 });
    } else {
      promptAction.showToast({ message: '至少保留2个item', duration: 2000 });
    }
  }

  // splice操作
  spliceItem() {
    if (this.itemCount > 2) {
      const removeIndex = Math.floor(this.itemCount / 2);
      this.tabItems.splice(removeIndex, 1);
      this.capsuleItems.splice(removeIndex, 1);
      this.multiItems.splice(removeIndex, 1);
      this.itemCount--;
      // 调整选中索引
      if (this.tabSelectedIndex >= this.itemCount) {
        this.tabSelectedIndex = this.itemCount - 1;
      }
      if (this.capsuleSelectedIndex >= this.itemCount) {
        this.capsuleSelectedIndex = this.itemCount - 1;
      }
      this.multiSelectedIndexes = this.multiSelectedIndexes.filter(i => i < this.itemCount);
      this.clickInfo = `Splice: 移除第${removeIndex + 1}个item，剩余${this.itemCount}个`;
      promptAction.showToast({ message: `Splice成功，当前${this.itemCount}个item`, duration: 2000 });
    } else {
      promptAction.showToast({ message: '至少保留2个item', duration: 2000 });
    }
  }

  build() {
    Column() {
      Text('SegmentButtonV2 - 改变items数组长度测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text(`当前item数量：${this.itemCount}`)
        .id('itemCountText')
        .fontSize(14)
        .fontColor('#0066CC')
        .margin({ bottom: 5 })

      Text(`操作信息：${this.clickInfo}`)
        .id('clickInfoText')
        .fontSize(14)
        .fontColor('#009900')
        .margin({ bottom: 15 })

      // 操作按钮
      Row() {
        Button('Push')
          .id('pushButton')
          .width(80)
          .height(35)
          .onClick(() => this.pushItem())

        Button('Pop')
          .id('popButton')
          .width(80)
          .height(35)
          .margin({ left: 10 })
          .onClick(() => this.popItem())

        Button('Splice')
          .id('spliceButton')
          .width(80)
          .height(35)
          .margin({ left: 10 })
          .onClick(() => this.spliceItem())
      }
      .margin({ bottom: 20 })

      // TabSegmentButtonV2
      Text('TabSegmentButtonV2 页签型')
        .fontSize(14)
        .margin({ bottom: 5 })
        .width('100%')

      TabSegmentButtonV2({
        items: this.tabItems,
        selectedIndex: this.tabSelectedIndex,
        onItemClicked: (index: number) => {
          this.tabSelectedIndex = index;
          this.clickInfo = `Tab点击: 第${index}个`;
          promptAction.showToast({ message: `Tab第${index}个被点击`, duration: 1500 });
        }
      })
        .id('tabSegmentButton')
        .width('100%')
        .margin({ bottom: 15 })

      // CapsuleSegmentButtonV2
      Text('CapsuleSegmentButtonV2 胶囊型单选')
        .fontSize(14)
        .margin({ bottom: 5 })
        .width('100%')

      CapsuleSegmentButtonV2({
        items: this.capsuleItems,
        selectedIndex: this.capsuleSelectedIndex,
        onItemClicked: (index: number) => {
          this.capsuleSelectedIndex = index;
          this.clickInfo = `Capsule点击: 第${index}个`;
          promptAction.showToast({ message: `Capsule第${index}个被点击`, duration: 1500 });
        }
      })
        .id('capsuleSegmentButton')
        .width('100%')
        .margin({ bottom: 15 })

      // MultiCapsuleSegmentButtonV2
      Text('MultiCapsuleSegmentButtonV2 胶囊型多选')
        .fontSize(14)
        .margin({ bottom: 5 })
        .width('100%')

      MultiCapsuleSegmentButtonV2({
        items: this.multiItems,
        selectedIndexes: this.multiSelectedIndexes,
        onItemClicked: (index: number) => {
          let idx = this.multiSelectedIndexes.indexOf(index);
          if (idx >= 0) {
            this.multiSelectedIndexes.splice(idx, 1);
          } else {
            this.multiSelectedIndexes.push(index);
          }
          this.multiSelectedIndexes = [...this.multiSelectedIndexes];
          this.clickInfo = `Multi点击: 第${index}个`;
          promptAction.showToast({ message: `Multi第${index}个被点击`, duration: 1500 });
        }
      })
        .id('multiSegmentButton')
        .width('100%')
        .margin({ bottom: 20 })

      Text('预期：三种SegmentButton类型功能正常')
        .fontSize(14)
        .fontColor('#FF6600')
        .fontWeight(FontWeight.Bold)
        .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(16)
  }
}
