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

import { TabSegmentButtonV2, CapsuleSegmentButtonV2, MultiCapsuleSegmentButtonV2, SegmentButtonV2Items, promptAction } from '@kit.ArkUI';


@Entry
@ComponentV2
struct SegmentButtonV25220 {
  @Local tabSelectedIndex: number = 0;
  @Local capsuleSelectedIndex: number = 0;
  @Local multiSelectedIndexes: number[] = [0];
  @Local currentSet: number = 1;

  // 第一套items
  @Local tabItems1: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '页签A' },
    { text: '页签B' },
    { text: '页签C' }
  ]);
  @Local capsuleItems1: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '选项A' },
    { text: '选项B' },
    { text: '选项C' }
  ]);
  @Local multiItems1: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '多选A' },
    { text: '多选B' },
    { text: '多选C' }
  ]);

  // 第二套items
  @Local tabItems2: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '页签1' },
    { text: '页签2' },
    { text: '页签3' },
    { text: '页签4' }
  ]);
  @Local capsuleItems2: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '选项1' },
    { text: '选项2' },
    { text: '选项3' },
    { text: '选项4' }
  ]);
  @Local multiItems2: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '多选1' },
    { text: '多选2' },
    { text: '多选3' },
    { text: '多选4' }
  ]);

  // 当前使用的items
  @Local tabItems: SegmentButtonV2Items = this.tabItems1;
  @Local capsuleItems: SegmentButtonV2Items = this.capsuleItems1;
  @Local multiItems: SegmentButtonV2Items = this.multiItems1;

  @Local clickInfo: string = '未操作';

  // 切换到第一套
  switchToSet1() {
    this.currentSet = 1;
    this.tabItems = this.tabItems1;
    this.capsuleItems = this.capsuleItems1;
    this.multiItems = this.multiItems1;
    this.tabSelectedIndex = 0;
    this.capsuleSelectedIndex = 0;
    this.multiSelectedIndexes = [0];
    this.clickInfo = '切换到第一套items (A/B/C)';
    promptAction.showToast({ message: '切换到第一套items', duration: 2000 });
  }

  // 切换到第二套
  switchToSet2() {
    this.currentSet = 2;
    this.tabItems = this.tabItems2;
    this.capsuleItems = this.capsuleItems2;
    this.multiItems = this.multiItems2;
    this.tabSelectedIndex = 0;
    this.capsuleSelectedIndex = 0;
    this.multiSelectedIndexes = [0];
    this.clickInfo = '切换到第二套items (1/2/3/4)';
    promptAction.showToast({ message: '切换到第二套items', duration: 2000 });
  }

  build() {
    Column() {
      Text('SegmentButtonV2 - 更换items数组测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text(`当前使用：第${this.currentSet}套items`)
        .id('currentSetText')
        .fontSize(14)
        .fontColor('#0066CC')
        .margin({ bottom: 5 })

      Text(`操作信息：${this.clickInfo}`)
        .id('clickInfoText')
        .fontSize(14)
        .fontColor('#009900')
        .margin({ bottom: 15 })

      // 切换按钮
      Row() {
        Button('+ 第一套')
          .id('set1Button')
          .width(100)
          .height(35)
          .backgroundColor(this.currentSet === 1 ? '#007DFF' : '#CCCCCC')
          .onClick(() => this.switchToSet1())

        Button('- 第二套')
          .id('set2Button')
          .width(100)
          .height(35)
          .margin({ left: 20 })
          .backgroundColor(this.currentSet === 2 ? '#007DFF' : '#CCCCCC')
          .onClick(() => this.switchToSet2())
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




