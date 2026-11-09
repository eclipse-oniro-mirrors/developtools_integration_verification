/*
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

class BasicDataSourceUIComponentListAndGridListMouse0090 implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): number {
    return this.originDataArray.length;
  }

  public getData(index: number): string {
    return this.originDataArray[index];
  }

  // 该方法为框架侧调用，为LazyForEach组件向其数据源处添加listener监听
  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  // 该方法为框架侧调用，为对应的LazyForEach组件在数据源处去除listener监听
  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  // 通知LazyForEach组件需要重载所有子组件
  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    });
  }

  // 通知LazyForEach组件需要在index对应索引处添加子组件
  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
      // 写法2：listener.onDatasetChange([{type: DataOperationType.ADD, index: index}]);
    });
  }

  // 通知LazyForEach组件在index对应索引处数据有变化，需要重建该子组件
  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
      // 写法2：listener.onDatasetChange([{type: DataOperationType.CHANGE, index: index}]);
    });
  }

  // 通知LazyForEach组件需要在index对应索引处删除该子组件
  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
      // 写法2：listener.onDatasetChange([{type: DataOperationType.DELETE, index: index}]);
    });
  }

  // 通知LazyForEach组件将from索引和to索引处的子组件进行交换
  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
      // 写法2：listener.onDatasetChange(
      //         [{type: DataOperationType.EXCHANGE, index: {start: from, end: to}}]);
    });
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    });
  }
}


class MyDataSourceUIComponentListAndGridListMouse0090 extends BasicDataSourceUIComponentListAndGridListMouse0090 {
  private dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }

  public deleteData(index: number): void {
    this.dataArray.splice(index, 1);
    this.notifyDataDelete(index);
  }
}


@Entry
@Component
struct UIComponentListAndGridListMouse0090 {
  @State name: string = 'UIComponentListAndGridListMouse0090';
  @State message: string = this.name + ' message:';
  @State numbers: number[] = [];
  @State text: string = 'drag';
  @State listDirection: Axis = Axis.Vertical;
  @State itemWidth: Length = 100;
  @State itemHeight: Length = 50;
  @State listWidth: Length = 400;
  @State listHeight: Length = 300;
  @State spaceValue: number | string = 10;
  @State edgeEffectValue: EdgeEffect = EdgeEffect.Spring;
  @State chainAnimationValue: boolean = true;
  @State minSpaceValue: Length = 10;
  @State maxSpaceValue: Length = 20;
  @State conductivityValue: number = 0.5;
  @State intensityValue: number = 0.5;
  @State chainEdgeEffectValue: ChainEdgeEffect = ChainEdgeEffect.DEFAULT;
  @State stiffnessValue: number = 228;
  @State dampingValue: number = 30;
  @State listSelectableValue: boolean = true;
  @State itemSelectableValue: boolean = true;
  listScroller: ListScroller = new ListScroller();
  private data: MyDataSourceUIComponentListAndGridListMouse0090 = new MyDataSourceUIComponentListAndGridListMouse0090();

  @Builder pixelMapBuilder() {
    Column() {
      Text(this.text)
        .width(40)
        .height(80)
        .backgroundColor(Color.White)
        .borderRadius(15)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .margin({
          top: 10
        })
    }
  }

  changeIndex(index1: number, index2: number) {
    let temp: number;
    temp = this.numbers[index1];
    this.numbers[index1] = this.numbers[index2];
    this.numbers[index2] = temp;
  }

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.numbers.push(i);
      this.data.pushData(`Hello ${i}`);
    }
  }

  build() {
    Column() {
      Text(this.name)
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Medium)
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Center)
        .width('90%')
        .height(50)
        .border({ width: 1 })
        .lineHeight(20)
        .maxLines(2)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })

      Button('删除末尾元素')
        .id(this.name + '_01')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 14,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .onClick(() => {
          this.numbers.pop();
          this.data.deleteData(this.data.totalCount() - 1);
        })

      Button('增加末尾元素')
        .id(this.name + '_02')
        .borderRadius(20)
        .backgroundColor(0x317aff)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 1,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 14,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .onClick(() => {
          this.numbers.push(this.numbers.length);
          this.data.pushData(`Hello ${this.data.totalCount()}`);
        })

      List({
        initialIndex: 0,
        space: this.spaceValue,
        scroller: this.listScroller
      }) {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            Text(item)
              .width('100%')
              .height('100%')
              .backgroundColor(Color.White)
              .borderRadius(15)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .margin({
                top: 10
              })
          }
          .selectable(this.itemSelectableValue)
          .id(this.name + '_03_' + item.toString())
          .width(this.itemWidth)
          .height(this.itemHeight)
          .onSelect((isSelected: boolean) => {
            if (isSelected) {
              this.message += `\n item ${item} selected`;
            } else {
              this.message += `\n item ${item} unselected`;
            }
          })
        }, (item: string) => item)
      }
      .alignListItem(ListItemAlign.Start)
      .id(this.name + '_03')
      .backToTop(true)
      .friction(0.6)
      .backgroundColor(Color.Grey)
      .width(this.listWidth)
      .height(this.listHeight)
      .enableScrollInteraction(true)
      .multiSelectable(false)
      .edgeEffect(this.edgeEffectValue)
      .chainAnimation(this.chainAnimationValue)
      .scrollBar(BarState.On)
      .scrollBarColor(Color.Red)
      .scrollBarWidth(4)
      .listDirection(this.listDirection)
      .chainAnimationOptions({
        minSpace: this.minSpaceValue,
        maxSpace: this.maxSpaceValue,
        conductivity: this.conductivityValue,
        intensity: this.intensityValue,
        edgeEffect: this.chainEdgeEffectValue,
        stiffness: this.stiffnessValue,
        damping: this.dampingValue
      })
      .margin({
        top: 10,
        bottom: 10,
        left: 5,
        right: 5
      })
      .onItemMove((from: number, to: number) =>{
        console.info('LazyForEach-List onItemMove');
        this.message += `\n LazyForEach-List onItemMove, from: ${from.toString()}, to: ${to.toString()}`;
        return true;
      })
      .onItemDragStart((event: ItemDragInfo, itemIndex: number) => {
        console.info('LazyForEach-List onItemDragStart');
        this.message += `\n LazyForEach-List onItemDragStart, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}`;
        this.text = this.numbers[itemIndex].toString();
        return this.pixelMapBuilder();
      })
      .onItemDragEnter((event: ItemDragInfo) => {
        console.info('LazyForEach-List onItemDragEnter');
        this.message += `\n LazyForEach-List onItemDragEnter, event: ${JSON.stringify(event)}`;
      })
      .onItemDragLeave((event: ItemDragInfo, itemIndex: number) => {
        console.info('LazyForEach-List onItemDragLeave');
        this.message += `\n LazyForEach-List onItemDragLeave, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}`;
      })
      .onItemDragMove((event: ItemDragInfo, itemIndex: number, insertIndex: number) => {
        console.info('LazyForEach-List onItemDragMove');
        this.message += `\n LazyForEach-List onItemDragMove, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}, insertIndex: ${insertIndex.toString()}`;
      })
      .onItemDrop((event: ItemDragInfo, itemIndex: number, insertIndex: number, isSuccess: boolean) => {
        console.info('LazyForEach-List onItemDrop');
        if (!isSuccess || insertIndex >= this.numbers.length) {
          return;
        }
        this.changeIndex(itemIndex, insertIndex);
        this.message += `\n LazyForEach-List onItemDrop, event: ${JSON.stringify(event)}, itemIndex: ${itemIndex.toString()}, insertIndex: ${insertIndex.toString()}, isSuccess: ${isSuccess}`;
      })
      .onScrollVisibleContentChange((start: VisibleListContentInfo, end: VisibleListContentInfo) => {
        console.info('LazyForEach-List onScrollVisibleContentChange');
        this.message += `\n LazyForEach-List onScrollVisibleContentChange, start: ${JSON.stringify(start)}, end: ${JSON.stringify(end)}`;
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('LazyForEach-List onScrollFrameBegin');
        this.message += `\n LazyForEach-List onScrollFrameBegin, offset: ${offset}, state: ${state}`;
        return { offsetRemain: offset };
      })
      .onScrollIndex((first: number, last: number) => {
        console.info('LazyForEach-List onScrollIndex');
        console.info(first.toString());
        console.info(last.toString());
        this.message += `\n LazyForEach-List onScrollIndex, first: ${first.toString()}, last: ${last.toString()}`;
      })
      .onWillScroll((scrollOffset: number, scrollState: ScrollState, scrollSource: ScrollSource) => {
        console.info('LazyForEach-List onWillScroll');
        this.message += `\n LazyForEach-List onWillScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}, scrollSource: ${scrollSource.toString()}`;
      })
      .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
        console.info('LazyForEach-List onDidScroll');
        console.info(scrollOffset.toString());
        console.info(scrollState.toString());
        this.message += `\n LazyForEach-List onDidScroll, scrollOffset: ${scrollOffset.toString()}, scrollState: ${scrollState.toString()}`;
      })
      .onScrollFrameBegin((offset: number, state: ScrollState) => {
        console.info('LazyForEach-List onScrollFrameBegin');
        this.message += `\n LazyForEach-List onScrollFrameBegin, offset: ${offset}, state: ${state}`;
        return { offsetRemain: offset };
      })
      .onScrollStart(() => {
        console.info('LazyForEach-List onScrollStart');
        this.message += `\n LazyForEach-List onScrollStart`;
      })
      .onScrollStop(() => {
        console.info('LazyForEach-List onScrollStop');
        this.message += `\n LazyForEach-List onScrollStop`;
      })
      .onReachStart(() => {
        console.info('LazyForEach-List onReachStart');
        this.message += `\n LazyForEach-List onReachStart`;
      })
      .onReachEnd(() => {
        console.info('LazyForEach-List onReachEnd');
        this.message += `\n LazyForEach-List onReachEnd`;
      })

      Scroll() {
        Text(this.message)
          .fontSize(10)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Medium)
          .textAlign(TextAlign.Center)
          .margin({
            left: 6,
            right: 6,
            top: 10,
            bottom: 10
          })
      }
      .id(this.name + '_04')
      .friction(0.6)
      .backgroundColor(Color.Yellow)
      .edgeEffect(EdgeEffect.Spring)
      .width('90%')
      .height('16.39%')
      .margin(10)

    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Green)
    .width('100%')
    .height('100%')

  }

}
