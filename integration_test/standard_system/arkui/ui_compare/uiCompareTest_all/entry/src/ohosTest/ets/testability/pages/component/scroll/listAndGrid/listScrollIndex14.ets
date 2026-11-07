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
struct ListScrollIndex14 {
  @State listData: string[] = [];
  @State listDirection: Axis = Axis.Vertical;
  @State statusMsg: string = '等待事件触发...';
  scrollerForList: Scroller = new Scroller();

  aboutToAppear() {
    // 初始化列表数据
    for (let i = 0; i < 50; i++) {
      this.listData.push(`Item ${i}`);
    }
  }

  addEvent(event: string) {
    this.statusMsg = `${this.statusMsg}\n${event}`;
    console.info('TEST', event);
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LIST_SCROLLER_GETITEMINDEX_0060')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });
      Text('list_getItemIndex_listitem_动态改变布局方向')
        .fontSize(12)
        .margin({ bottom: 10 });

      Row({ space: 10 }) {
        Button(`切换方向 (当前: ${this.listDirection === Axis.Vertical ? 'Vertical' : 'Horizontal'})`)
          .id('switchDirectionButton_14')
          .onClick(() => {
            this.listDirection = this.listDirection === Axis.Vertical ? Axis.Horizontal : Axis.Vertical;
            this.addEvent(`切换布局方向为: ${this.listDirection === Axis.Vertical ? 'Vertical' : 'Horizontal'}`);
          })
          .fontSize(12)
      }
      .margin({ bottom: 10 });

      List({ space: 10, scroller: this.scrollerForList }) {
        ForEach(this.listData, (item: string, index: number) => {
          ListItem() {
            Text(`${index}: ${item}`)
              .id(`listItem_14_${index}`)
              .fontSize(16)
              .padding(10)
              .width(this.listDirection === Axis.Vertical ? '100%' : 200)
              .height(this.listDirection === Axis.Vertical ? undefined : '100%')
              .backgroundColor(index % 2 === 0 ? '#F0F0F0' : '#FFFFFF')
          }
          .id(`listItemContainer_14_${index}`)
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
        }, (item: string, index: number) => `${index}_${item}`);
      }
      .id('scrollIndexList_14')
      .listDirection(this.listDirection)
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
