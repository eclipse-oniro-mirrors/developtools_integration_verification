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
struct ListScrollSnapAlign03 {
  @State listData: string[] = ['Item 0', 'Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6', 'Item 7', 'Item 8', 'Item 9'];
  @State scrollSnapAlign: ScrollSnapAlign = ScrollSnapAlign.CENTER;
  @State statusMsg: string = '等待事件触发...';
  @State operationSequence: string[] = [];
  @State scrollIndex: number = 0;
  @State didScrollOffset: number = 0;

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_ALIGN_0310')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });
      Text('测试步骤：1、创建list组件 2、设置ScrollSnapAlign.CENTER')
        .fontSize(14)
        .margin({ bottom: 5 });
      Text('预期效果：视图中的中间项将在列表中心对齐')
        .fontSize(14)
        .margin({ bottom: 10 });

      Row() {
        Button('滑动测试')
          .id('swipeTestButton_03')
          .onClick(() => {
            this.addOperation('执行滑动测试');
          })
          .width(80)
          .height(40)
          .fontSize(12)
          .margin({ right: 5 });

        Button('重置位置')
          .id('resetButton_03')
          .onClick(() => {
            this.addOperation('重置列表位置');
          })
          .width(80)
          .height(40)
          .fontSize(12);
      }
      .margin({ bottom: 10 });

      List() {
        ForEach(this.listData, (item: string, index: number) => {
          ListItem() {
            Text(`${index}: ${item}`)
              .id(`listItem_03_${index}`)
              .fontSize(16)
              .padding(15)
              .width('100%')
              .backgroundColor(index % 2 === 0 ? '#FCE4EC' : '#E0F2F1')
              .borderRadius(8)
              .margin({ bottom: 5 })
              .onAppear(() => {
                this.addEvent(`Item ${index} onAppear: ${item}`);
              })
              .onDisAppear(() => {
                this.addEvent(`Item ${index} onDisAppear: ${item}`);
              });
          }
          .id(`listItemContainer_03_${index}`);
        }, (item: string, index: number) => `${index}_${item}`);
      }
      .id('scrollSnapList_03')
      .scrollSnapAlign(this.scrollSnapAlign)
      .height('24.59%')
      .width('100%')
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        this.didScrollOffset = scrollOffset;
        this.addEvent(`onDidScroll: offset=${scrollOffset}, state=${scrollState}`);
      })
      .onScrollIndex((firstIndex: number, lastIndex: number, centerIndex: number) => {
        this.scrollIndex = centerIndex;
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
      .height('8.2%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .borderRadius(4)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto);

      Text('操作序列：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 });
      Text(this.operationSequence.join(' → '))
        .fontSize(12)
        .width('100%')
        .height(60)
        .backgroundColor('#E8F4FD')
        .padding(5)
        .borderRadius(4);
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
    .padding(8)
    .justifyContent(FlexAlign.Start);
  }

  addEvent(event: string) {
    const timestamp = new Date().toLocaleTimeString();
    this.statusMsg = `[${timestamp}] ${event}\n${this.statusMsg}`;
  }

  addOperation(operation: string) {
    const timestamp = new Date().toLocaleTimeString();
    this.operationSequence.unshift(`[${timestamp}] ${operation}`);
    if (this.operationSequence.length > 10) {
      this.operationSequence = this.operationSequence.slice(0, 10);
    }
  }
}
