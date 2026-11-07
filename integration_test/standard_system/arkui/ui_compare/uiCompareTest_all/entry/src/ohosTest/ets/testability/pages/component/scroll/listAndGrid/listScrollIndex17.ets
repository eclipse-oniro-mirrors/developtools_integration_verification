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
struct ListScrollIndex17 {
  @State listData: string[] = [];
  @State visibleItems: boolean[] = [];
  @State statusMsg: string = '等待事件触发...';
  scrollerForList: Scroller = new Scroller();

  aboutToAppear() {
    // 初始化列表数据
    for (let i = 0; i < 50; i++) {
      this.listData.push(`Item ${i}`);
      this.visibleItems.push(true);
    }
  }

  addEvent(event: string) {
    this.statusMsg = `${this.statusMsg}\n${event}`;
    console.info('TEST', event);
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0090')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });
      Text('list_getItemIndex_listitem_动态改变item的显隐性')
        .fontSize(12)
        .margin({ bottom: 10 });

      Row({ space: 10 }) {
        Button('切换显隐性')
          .id('switchVisibilityButton_17')
          .onClick(() => {
            // 切换第5个item的显隐性
            this.visibleItems[5] = !this.visibleItems[5];
            this.visibleItems = [...this.visibleItems];
            this.addEvent(`切换item 5的显隐性为: ${this.visibleItems[5]}`);
          })
          .fontSize(12)
      }
      .margin({ bottom: 10 });

      List({ space: 10, scroller: this.scrollerForList }) {
        ForEach(this.listData, (item: string, index: number) => {
          if (this.visibleItems[index]) {
            ListItem() {
              Text(`${index}: ${item}`)
                .id(`listItem_17_${index}`)
                .fontSize(16)
                .padding(10)
                .width('100%')
                .backgroundColor(index % 2 === 0 ? '#F0F0F0' : '#FFFFFF')
            }
            .id(`listItemContainer_17_${index}`)
            .onTouch((event: TouchEvent) => {
              if (event.type === TouchType.Down) {
                this.addEvent(`onTouch Down - item index: ${index}`);
              }
            })
            .gesture(
              TapGesture()
                .onAction(() => {
                  this.addEvent(`TapGesture - item index: ${index}`);
                })
            )
            .gesture(
              PanGesture()
                .onActionStart(() => {
                  this.addEvent(`PanGesture Start - item index: ${index}`);
                })
                .onActionUpdate(() => {
                  this.addEvent(`PanGesture Update - item index: ${index}`);
                })
                .onActionEnd(() => {
                  this.addEvent(`PanGesture End - item index: ${index}`);
                })
            );
          }
        }, (item: string, index: number) => `${index}_${item}`);
      }
      .id('scrollIndexList_17')
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
