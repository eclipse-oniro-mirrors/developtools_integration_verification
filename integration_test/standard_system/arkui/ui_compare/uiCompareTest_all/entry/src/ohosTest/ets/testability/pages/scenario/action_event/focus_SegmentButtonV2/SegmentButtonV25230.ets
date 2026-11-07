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
struct SegmentButtonV25230 {
  @Local tabSelectedIndex: number = 0;
  @Local capsuleSelectedIndex: number = 0;
  @Local multiSelectedIndexes: number[] = [0];
  @Local clickInfo: string = '未操作';

  // symbol双重配置：同时设置icon和symbol
  @Local tabItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '手机', symbol: $r('sys.symbol.phone'), icon: $r('sys.media.ohos_ic_public_search_filled') },
    { text: '平板', symbol: $r('sys.symbol.pad'), icon: $r('sys.media.ohos_ic_public_scan') },
    { text: '穿戴', symbol: $r('sys.symbol.watch'), icon: $r('sys.media.ohos_ic_public_share') }
  ]);

  @Local capsuleItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '选项1', symbol: $r('sys.symbol.phone'), icon: $r('sys.media.ohos_ic_public_search_filled') },
    { text: '选项2', symbol: $r('sys.symbol.pad'), icon: $r('sys.media.ohos_ic_public_scan') },
    { text: '选项3', symbol: $r('sys.symbol.watch'), icon: $r('sys.media.ohos_ic_public_share') }
  ]);

  @Local multiItems: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: '多选1', symbol: $r('sys.symbol.phone'), icon: $r('sys.media.ohos_ic_public_search_filled') },
    { text: '多选2', symbol: $r('sys.symbol.pad'), icon: $r('sys.media.ohos_ic_public_scan') },
    { text: '多选3', symbol: $r('sys.symbol.watch'), icon: $r('sys.media.ohos_ic_public_share') }
  ]);

  build() {
    Column() {
      Text('SegmentButtonV2 - symbol双重配置测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('同时设置icon和symbol属性')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 10 })

      Text(`操作信息：${this.clickInfo}`)
        .id('clickInfoText')
        .fontSize(14)
        .fontColor('#009900')
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

      // 切换Tab按钮
      Row() {
        Button('Tab-0')
          .id('tab0Button')
          .width(70)
          .height(35)
          .onClick(() => {
            this.tabSelectedIndex = 0;
            this.clickInfo = 'Tab切换到第0个';
          })
        Button('Tab-1')
          .id('tab1Button')
          .width(70)
          .height(35)
          .margin({ left: 10 })
          .onClick(() => {
            this.tabSelectedIndex = 1;
            this.clickInfo = 'Tab切换到第1个';
          })
        Button('Tab-2')
          .id('tab2Button')
          .width(70)
          .height(35)
          .margin({ left: 10 })
          .onClick(() => {
            this.tabSelectedIndex = 2;
            this.clickInfo = 'Tab切换到第2个';
          })
      }
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

      // 切换Capsule按钮
      Row() {
        Button('Capsule-0')
          .id('capsule0Button')
          .width(85)
          .height(35)
          .onClick(() => {
            this.capsuleSelectedIndex = 0;
            this.clickInfo = 'Capsule切换到第0个';
          })
        Button('Capsule-1')
          .id('capsule1Button')
          .width(85)
          .height(35)
          .margin({ left: 10 })
          .onClick(() => {
            this.capsuleSelectedIndex = 1;
            this.clickInfo = 'Capsule切换到第1个';
          })
        Button('Capsule-2')
          .id('capsule2Button')
          .width(85)
          .height(35)
          .margin({ left: 10 })
          .onClick(() => {
            this.capsuleSelectedIndex = 2;
            this.clickInfo = 'Capsule切换到第2个';
          })
      }
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
        .margin({ bottom: 15 })

      // 切换Multi按钮
      Row() {
        Button('Multi-0')
          .id('multi0Button')
          .width(70)
          .height(35)
          .onClick(() => {
            let idx = this.multiSelectedIndexes.indexOf(0);
            if (idx >= 0) {
              this.multiSelectedIndexes.splice(idx, 1);
            } else {
              this.multiSelectedIndexes.push(0);
            }
            this.multiSelectedIndexes = [...this.multiSelectedIndexes];
            this.clickInfo = 'Multi切换第0个';
          })
        Button('Multi-1')
          .id('multi1Button')
          .width(70)
          .height(35)
          .margin({ left: 10 })
          .onClick(() => {
            let idx = this.multiSelectedIndexes.indexOf(1);
            if (idx >= 0) {
              this.multiSelectedIndexes.splice(idx, 1);
            } else {
              this.multiSelectedIndexes.push(1);
            }
            this.multiSelectedIndexes = [...this.multiSelectedIndexes];
            this.clickInfo = 'Multi切换第1个';
          })
        Button('Multi-2')
          .id('multi2Button')
          .width(70)
          .height(35)
          .margin({ left: 10 })
          .onClick(() => {
            let idx = this.multiSelectedIndexes.indexOf(2);
            if (idx >= 0) {
              this.multiSelectedIndexes.splice(idx, 1);
            } else {
              this.multiSelectedIndexes.push(2);
            }
            this.multiSelectedIndexes = [...this.multiSelectedIndexes];
            this.clickInfo = 'Multi切换第2个';
          })
      }
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




