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
struct ListCachedCountShow06 {
  private listData: string[] = [];
  private groupData: string[] = [];

  aboutToAppear() {
    // 设置5-6个item
    for (let i = 0; i < 5; i++) {
      this.listData.push(`Item ${i + 1}`);
    }
    for (let i = 0; i < 5; i++) {
      this.groupData.push(`Group Item ${i + 1}`);
    }
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0060')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      List({ space: 10 }) {
        // List + Repeat + ListItem
        Repeat<string>(this.listData)
          .each((ri: RepeatItem<string>) => {
            ListItem() {
              Text(ri.item)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF5F5F5)
            }
          })
          .key((item: string) => item)
          .virtualScroll({ totalCount: this.listData.length })

        // List + repeat + ListItemGroup + repeat + ListItem
        ListItemGroup({ space: 10 }) {
          Repeat<string>(this.groupData)
            .each((ri: RepeatItem<string>) => {
              ListItem() {
                Text(ri.item)
                  .width('100%')
                  .height(100)
                  .fontSize(16)
                  .textAlign(TextAlign.Center)
                  .backgroundColor(0xE0E0E0)
              }
            })
            .key((item: string) => item)
            .virtualScroll({ totalCount: this.groupData.length })
        }
      }
      .id('listCachedCountShow_06')
      .width('100%')
      .layoutWeight(1)
      .clip(false) // 设置clip属性为false
      .cachedCount(1, true) // cachedCount(1, true)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}

