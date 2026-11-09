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
interface TimeTable2 {
  title: string;
  projects: string[];
}

@Entry
@Component
struct UIComponentScrollScrollAccessible026 {
  @State message: string = 'Hello'
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  @State scrollOffSet: number = 0;
  private timeTable: TimeTable2[] = [
    {
      title: '星期一',
      projects: ['语文', '数学', '英语']
    },
    {
      title: '星期二',
      projects: ['物理', '化学', '生物']
    },
    {
      title: '星期三',
      projects: ['历史', '地理', '政治']
    },
    {
      title: '星期四',
      projects: ['美术', '音乐', '体育']
    }
  ]

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
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
        .key('UIComponentScrollScrollAccessible026_001')
      Stack({ alignContent: Alignment.TopStart }) {
        List({ space: 20 }) {
          ForEach(this.timeTable, (item: TimeTable2) => {
            ListItemGroup({ header: this.itemHead(item.title), footer: this.itemFoot(item.projects.length) }) {
              ForEach(item.projects, (project: string) => {
                ListItem() {
                  Text(project)
                    .width('100%')
                    .height(100)
                    .fontSize(20)
                    .textAlign(TextAlign.Center)
                    .backgroundColor(0xFFFFFF)
                }
              }, (item: string) => item)
            }
            .divider({ strokeWidth: 1, color: Color.Blue }) // 每行之间的分界线
          })
        }
        .width('90%')
        .sticky(StickyStyle.Header | StickyStyle.Footer)
        .scrollBar(BarState.On)
        .onDidScroll((scrollOffset: number, scrollState: ScrollState) => {
          console.info(`onScroll scrollState = ScrollState` + scrollState + `, scrollOffset = ` + scrollOffset);
          this.scrollOffSet += scrollOffset;
        })

      }
      .backgroundColor(0xDCDCDC)
      .width('100%')
      .height('85%')
      Row() {
        Text('scrollOffSet: ' + this.scrollOffSet)
          .fontColor(Color.Black)
          .fontSize(20)
      }
      .backgroundColor(0xDCDCDC)
    }
  }
}

export {}
