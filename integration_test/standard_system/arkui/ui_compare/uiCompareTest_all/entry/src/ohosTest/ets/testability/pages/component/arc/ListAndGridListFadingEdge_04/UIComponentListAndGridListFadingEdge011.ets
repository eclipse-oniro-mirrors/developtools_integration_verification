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
interface TimeTableInterface {
  title: string,
  projects: string[]
}

@Entry
@Component
struct UIComponentListAndGridListFadingEdge011 {
  @State message: string = 'Hello';
  private scrollerForList1: Scroller = new Scroller();
  private scrollerForList2: Scroller = new Scroller();
  private scrollerForList3: Scroller = new Scroller();
  private timeTable1: TimeTableInterface[] = [
    {
      title: '星期一',
      projects: ['语文', '数学', '英语']
    }
  ];
  private timeTable2: TimeTableInterface[] = [
    {
      title: '星期二',
      projects: ['物理', '化学', '生物']
    }
  ];
  private timeTable3: TimeTableInterface[] = [
    {
      title: '星期三',
      projects: ['历史', '地理', '政治']
    }
  ];
  private timeTable4: TimeTableInterface[] = [
    {
      title: '星期四',
      projects: ['美术', '音乐', '体育']
    }
  ];
  @State arr: number[] = [0, 1, 2, 3];
  @State timeTableArr: Array<TimeTableInterface[]> = [this.timeTable1, this.timeTable2, this.timeTable3, this.timeTable4];

  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(10)
  }

  @Builder
  itemFoot(num: number) {
    Text('共' + num + '节课')
      .fontSize(16)
      .backgroundColor(0xAABBCC)
      .width('100%')
      .padding(5)
  }

  build() {
    Row() {
      Column() {
        Column() {
          Button('滚动')
            .id('click')
            .stateEffect(true)
            .onClick(() => {
              this.scrollerForList1.fling(-500);
              this.scrollerForList3.scrollEdge(Edge.Bottom);
            })
        }
        .width('100%')
        .backgroundColor(0xbacd34)
        .height('10%')
        List({ space: 10, scroller: this.scrollerForList1 }) {
          ForEach(this.arr, (item: number) => {
            ForEach(this.timeTableArr[item], (item: TimeTableInterface) => {
              ListItemGroup({ header: this.itemHead(item.title), footer: this.itemFoot(item.projects.length) }) {
                ForEach(item.projects, (project: string) => {
                  ListItem() {
                    Text(project)
                      .width('100%')
                      .height(100)
                      .fontSize(20)
                      .textAlign(TextAlign.Center)
                      .backgroundColor(0xF9CF93)
                  }
                }, (item: string) => item)
              }
              .divider({ strokeWidth: 1, color: Color.Blue })
            })
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('20%')
                .textAlign(TextAlign.Center)
                .fontStyle(FontStyle.Normal)
            }.backgroundColor(0xEFB243)
          })
        }
        .fadingEdge(true)
        .scrollBarColor(Color.Gray)
        .enableScrollInteraction(true)
        .multiSelectable(false)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .backgroundColor(0xFAEEE0)
        .width('100%')
        .height('85%')
      }.width('33%').height('90%')
      Column() {
        Column() {
          Text(`顶部`)
            .fontSize(20)
            .width('100%')
            .height('10%')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Normal)
        }.backgroundColor(0xbacd34)
        List({ space:10, scroller: this.scrollerForList2 }) {
          ForEach(this.arr, (item: number) => {
            ForEach(this.timeTableArr[item], (item: TimeTableInterface) => {
              ListItemGroup({ header: this.itemHead(item.title), footer: this.itemFoot(item.projects.length) }) {
                ForEach(item.projects, (project: string) => {
                  ListItem() {
                    Text(project)
                      .width('100%')
                      .height(100)
                      .fontSize(20)
                      .textAlign(TextAlign.Center)
                      .backgroundColor(0xF9CF93)
                  }
                }, (item: string) => item)
              }
              .divider({ strokeWidth: 1, color: Color.Blue })
            })
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('20%')
                .textAlign(TextAlign.Center)
                .fontStyle(FontStyle.Normal)
            }.backgroundColor(0xEFB243)
          })
        }
        .fadingEdge(true)
        .scrollBarColor(Color.Gray)
        .enableScrollInteraction(true)
        .multiSelectable(false)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .backgroundColor(0xFAEEE0)
        .width('100%')
        .height('85%')
      }.width('33%').height('90%')
      Column() {
        Column() {
          Text(`底部`)
            .fontSize(20)
            .width('100%')
            .height('10%')
            .textAlign(TextAlign.Center)
            .fontStyle(FontStyle.Normal)
        }.backgroundColor(0xbacd34)
        List({ space:10, initialIndex: 3, scroller: this.scrollerForList3 }) {
          ForEach(this.arr, (item: number) => {
            ForEach(this.timeTableArr[item], (item: TimeTableInterface) => {
              ListItemGroup({ header: this.itemHead(item.title), footer: this.itemFoot(item.projects.length) }) {
                ForEach(item.projects, (project: string) => {
                  ListItem() {
                    Text(project)
                      .width('100%')
                      .height(100)
                      .fontSize(20)
                      .textAlign(TextAlign.Center)
                      .backgroundColor(0xF9CF93)
                  }
                }, (item: string) => item)
              }
              .divider({ strokeWidth: 1, color: Color.Blue })
            })
            ListItem() {
              Text('' + item)
                .width('100%')
                .height('20%')
                .textAlign(TextAlign.Center)
                .fontStyle(FontStyle.Normal)
            }.backgroundColor(0xEFB243)
          })
        }
        .fadingEdge(true)
        .scrollBarColor(Color.Gray)
        .enableScrollInteraction(true)
        .multiSelectable(false)
        .edgeEffect(EdgeEffect.Spring)
        .scrollBar(BarState.On)
        .scrollBarWidth(10)
        .backgroundColor(0xFAEEE0)
        .width('100%')
        .height('85%')
      }.width('33%').height('90%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
  }
}