/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct ListScrollToItemInGroup12 {
  private listScroller: ListScroller = new ListScroller();
  private groupData: string[] = [];
  private itemData: string[][] = [];

  aboutToAppear() {
    // 创建3个组，每组5个item
    for (let i = 0; i < 3; i++) {
      this.groupData.push(`Group ${i}`);
      let items: string[] = [];
      for (let j = 0; j < 5; j++) {
        items.push(`Item ${j}`);
      }
      this.itemData.push(items);
    }
  }

  @Builder
  groupHeader(title: string) {
    Text(title)
      .fontSize(16)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .height(50)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xAABBCC)
      .padding(10)
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LISTITEMGROUP_SCROLLTOINDEX_0120')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      Button('scrollToItemInGroup(1,2,ScrollAlign.START)')
        .id('scrollToItemInGroupButton_12')
        .onClick(() => {
          // 跳转到第1个组的第2个item，首部对齐
          this.listScroller.scrollToItemInGroup(1, 2, false, ScrollAlign.START);
        })
        .margin({ bottom: 10 });

      List({ space: 10, scroller: this.listScroller }) {
        ForEach(this.groupData, (groupTitle: string, groupIndex: number) => {
          ListItemGroup({ header: this.groupHeader(groupTitle) }) {
            ForEach(this.itemData[groupIndex], (item: string, itemIndex: number) => {
              ListItem() {
                Text(`Group ${groupIndex} - ${item}`)
                  .width('100%')
                  .height(80)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xF5F5F5)
              }
              .id(`listItem_12_${groupIndex}_${itemIndex}`)
            }, (item: string) => item)
          }
          .id(`listItemGroup_12_${groupIndex}`)
        }, (groupTitle: string) => groupTitle)
      }
      .id('listScrollToItemInGroup_12')
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}
