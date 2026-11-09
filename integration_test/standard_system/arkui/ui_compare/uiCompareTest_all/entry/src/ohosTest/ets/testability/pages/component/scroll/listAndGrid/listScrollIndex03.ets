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
struct ListScrollIndex03 {
  @State listData: string[] = [];
  @State firstGroupIndex: number = -1;
  @State lastGroupIndex: number = -1;
  @State centerGroupIndex: number = -1;
  @State statusMsg: string = '等待事件触发...';

  aboutToAppear() {
    // 初始化列表数据，每个组包含5个item
    for (let i = 0; i < 20; i++) {
      this.listData.push(`Group ${i}`);
    }
  }

  addEvent(event: string) {
    this.statusMsg = `${this.statusMsg}\n${event}`;
    console.info('TEST', event);
  }

  @Builder
  groupHeader(title: string) {
    Text(title)
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .fontColor(Color.White)
      .backgroundColor('#4A90E2')
      .width('100%')
      .padding(10)
      .textAlign(TextAlign.Center);
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LIST_0050')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });
      Text('横向滑动列表将会返回显示界面中第一个GroupListItem和最后一个GroupListItem的索引号')
        .fontSize(12)
        .margin({ bottom: 10 });

      Text(`当前可见Group索引: first=${this.firstGroupIndex}, last=${this.lastGroupIndex}, center=${this.centerGroupIndex}`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 5 });

      List() {
        ForEach(this.listData, (groupTitle: string, groupIndex: number) => {
          ListItemGroup({ header: this.groupHeader(groupTitle) }) {
            ForEach(Array.from<number, number>({ length: 5 }, (_: number, i: number): number => i), (itemIndex: number) => {
              ListItem() {
                Text(`Group ${groupIndex} - Item ${itemIndex}`)
                  .id(`listItem_03_${groupIndex}_${itemIndex}`)
                  .fontSize(16)
                  .padding(10)
                  .width('100%')
                  .backgroundColor(itemIndex % 2 === 0 ? '#F0F0F0' : '#FFFFFF')
              }
              .id(`listItemContainer_03_${groupIndex}_${itemIndex}`);
            }, (item: number) => `${groupIndex}_${item}`);
          }
          .id(`listItemGroup_03_${groupIndex}`);
        }, (item: string, index: number) => `${index}_${item}`);
      }
      .id('scrollIndexList_03')
      .listDirection(Axis.Vertical)
      .height('32.79%')
      .width('100%')
      .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
        this.firstGroupIndex = firstIndex;
        this.lastGroupIndex = lastIndex;
        this.centerGroupIndex = centerIndex;
        this.addEvent(`onScrollIndex: first=${firstIndex}, last=${lastIndex}, center=${centerIndex}`);
      });

      Divider()
        .margin({ top: 10, bottom: 10 });

      Text('事件日志：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });
      Scroll() {
        Text(this.statusMsg)
          .fontSize(12)
          .width('100%')
          .textAlign(TextAlign.Start)
          .fontColor('#333333');
      }
      .width('100%')
      .height('12.3%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .borderRadius(4)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto);
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xF5F5F5)
  }
}

