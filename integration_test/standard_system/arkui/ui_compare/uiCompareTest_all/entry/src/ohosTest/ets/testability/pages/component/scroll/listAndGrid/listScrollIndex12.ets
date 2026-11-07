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
struct ListScrollIndex12 {
  @State listData: string[] = [];
  @State statusMsg: string = '等待事件触发...';
  @State firstIndex: number = -1;
  @State lastIndex: number = -1;
  scrollerForList: Scroller = new Scroller();

  aboutToAppear() {
    // 初始化列表数据，每个组包含5个item
    for (let i = 0; i < 10; i++) {
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
      Text('用例编号：SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0040')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });
      Text('list_getVisibleListContentInfo_listitemgroup+listitem_增删item')
        .fontSize(12)
        .margin({ bottom: 10 });

      Row({ space: 10 }) {
        Button('删除item')
          .id('deleteItemButton_12')
          .onClick(() => {
            if (this.listData.length > 0) {
              this.listData.pop();
              this.listData = [...this.listData];
              this.addEvent('删除item');
            }
          })
          .fontSize(12)
      }
      .margin({ bottom: 10 });

      List({ space: 10, scroller: this.scrollerForList }) {
        ForEach(this.listData, (groupTitle: string, groupIndex: number) => {
          ListItemGroup({ header: this.groupHeader(groupTitle) }) {
            ForEach(Array.from<number, number>({ length: 5 }, (_: number, i: number): number => i), (itemIndex: number) => {
              ListItem() {
                Text(`Group ${groupIndex} - Item ${itemIndex}`)
                  .id(`listItem_12_${groupIndex}_${itemIndex}`)
                  .fontSize(16)
                  .padding(10)
                  .width('100%')
                  .backgroundColor(itemIndex % 2 === 0 ? '#F0F0F0' : '#FFFFFF')
              }
              .id(`listItemContainer_12_${groupIndex}_${itemIndex}`)
              .onTouch((event: TouchEvent) => {
                if (event.type === TouchType.Down) {
                  this.addEvent(`onTouch Down - group: ${groupIndex}, item: ${itemIndex}`);
                }
              })
              .gesture(
                TapGesture()
                  .onAction(() => {
                    this.addEvent(`TapGesture - group: ${groupIndex}, item: ${itemIndex}`);
                  })
              )
              .gesture(
                PanGesture()
                  .onActionStart(() => {
                    this.addEvent(`PanGesture Start - group: ${groupIndex}, item: ${itemIndex}`);
                  })
                  .onActionUpdate(() => {
                    this.addEvent(`PanGesture Update - group: ${groupIndex}, item: ${itemIndex}`);
                  })
                  .onActionEnd(() => {
                    this.addEvent(`PanGesture End - group: ${groupIndex}, item: ${itemIndex}`);
                  })
              );
            }, (item: number) => `${groupIndex}_${item}`);
          }
          .id(`listItemGroup_12_${groupIndex}`);
        }, (item: string, index: number) => `${index}_${item}`);
      }
      .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
        this.firstIndex = firstIndex;
        this.lastIndex = lastIndex;
        this.addEvent(`onScrollIndex: first=${firstIndex}, last=${lastIndex}, center=${centerIndex}`);
      })
      .id('scrollIndexList_12')
      .listDirection(Axis.Vertical)
      .height('32.79%')
      .width('100%');

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
