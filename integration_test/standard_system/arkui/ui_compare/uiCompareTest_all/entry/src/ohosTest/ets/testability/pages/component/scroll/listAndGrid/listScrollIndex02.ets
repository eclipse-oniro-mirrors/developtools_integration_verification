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
struct ListScrollIndex02 {
  @State listData: string[] = [];
  @State firstIndex: number = -1;
  @State lastIndex: number = -1;
  @State centerIndex: number = -1;
  @State statusMsg: string = '等待事件触发...';

  aboutToAppear() {
    // 初始化列表数据
    for (let i = 0; i < 100; i++) {
      this.listData.push(`Item ${i}`);
    }
  }

  addEvent(event: string) {
    this.statusMsg = `${this.statusMsg}\n${event}`;
    console.info('TEST', event);
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LIST_0020')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });
      Text('纵向时滑动列表将会返回显示界面中第一个ListItem和最后一个ListItem的索引号')
        .fontSize(12)
        .margin({ bottom: 10 });

      Text(`当前可见索引: first=${this.firstIndex}, last=${this.lastIndex}, center=${this.centerIndex}`)
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 5 });

      List() {
        ForEach(this.listData, (item: string, index: number) => {
          ListItem() {
            Text(`${index}: ${item}`)
              .id(`listItem_02_${index}`)
              .fontSize(16)
              .padding(10)
              .height('100%')
              .backgroundColor(index % 2 === 0 ? '#F0F0F0' : '#FFFFFF')
          }
          .id(`listItemContainer_02_${index}`)
          .width('27.78%')
          .height('100%');
        }, (item: string, index: number) => `${index}_${item}`);
      }
      .id('scrollIndexList_02')
      .listDirection(Axis.Horizontal)
      .height('32.79%')
      .width('100%')
      .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
        this.firstIndex = firstIndex;
        this.lastIndex = lastIndex;
        this.centerIndex = centerIndex;
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

