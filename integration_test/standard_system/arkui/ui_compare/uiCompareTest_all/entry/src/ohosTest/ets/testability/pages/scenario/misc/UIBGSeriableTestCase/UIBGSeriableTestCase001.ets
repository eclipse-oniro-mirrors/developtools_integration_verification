/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

interface GroupData {
  group: number;
  items: string[];
}

@Entry
@Component
struct ScrollToGroupExample1 {
  // 列表数据源（分组）
  @State listData: GroupData[] = [
    { group: 1, items: ['Group1-Item1', 'Group1-Item2', 'Group1-Item3'] },
    { group: 2, items: ['Group2-Item1', 'Group2-Item2'] },
    { group: 3, items: ['Group3-Item1', 'Group3-Item2', 'Group3-Item3', 'Group3-Item4'] }
  ]

  // 控制器
  private scroller: ListScroller = new ListScroller()

  // 目标定位参数
  @State targetGroup: number = 1
  @State targetIndex: number = 0

  build() {
    Column() {
      // 控制面板
      Row({ space: 8 }) {
        Button('跳转到\nGroup1')
          .id('Group1')
          .onClick(() => this.jumpToGroup(1))
        Button('跳转到\nGroup2')
          .id('Group2')
          .onClick(() => this.jumpToGroup(2))
        Button('跳转到\nGroup3')
          .id('Group3')
          .onClick(() => this.jumpToGroup(3))
      }
      .padding(12)

      // 分组列表
      List({ space: 10, scroller: this.scroller }) {
        ForEach(this.listData, (item: GroupData)  => {
          ListItem() {
            Column() {
              // 分组标题
              Text(`Group ${item.group}`)
                .fontSize(20)
                .padding(10)
                .backgroundColor('#F0F0F0')

              // 分组内容项
              ForEach(item.items, (subItem: string) => {
                ListItem() {
                  Text(subItem)
                    .fontSize(18)
                    .padding(20)
                    .backgroundColor(Color.White)
                    .width('100%')
                }
              })
            }
          }
        })
      }
      .width('100%')
      .height('80%')
      .divider({ strokeWidth: 1, color: '#DDD' })
    }
    .padding(20)
  }

  // 跳转逻辑
  private jumpToGroup(targetGroup: number) {
    this.scroller.scrollToItemInGroup(targetGroup, targetGroup, true, ScrollAlign.START)
  }
}