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

class BasicDataSource implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  constructor(dataArray: string[]) {
    this.originDataArray = dataArray;
  }

  totalCount(): number {
    return this.originDataArray.length;
  }

  getData(index: number): string {
    return this.originDataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    });
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    });
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    });
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    });
  }
}

@Entry
@Component
struct ListCachedCountShow05 {
  private listData: string[] = [];
  private groupData: string[] = [];
  private dataSource: BasicDataSource = new BasicDataSource([]);
  private groupDataSource: BasicDataSource = new BasicDataSource([]);

  aboutToAppear() {
    // 设置5-6个item
    for (let i = 0; i < 5; i++) {
      this.listData.push(`Item ${i + 1}`);
    }
    for (let i = 0; i < 5; i++) {
      this.groupData.push(`Group Item ${i + 1}`);
    }
    this.dataSource = new BasicDataSource(this.listData);
    this.groupDataSource = new BasicDataSource(this.groupData);
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_INTERFACE_CACHEDCOUNT_SHOW_0050')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      List({ space: 10 }) {
        // List + LazyForEach + ListItem
        LazyForEach(this.dataSource, (item: string) => {
          ListItem() {
            Text(item)
              .width('100%')
              .height(100)
              .fontSize(16)
              .textAlign(TextAlign.Center)
              .backgroundColor(0xF5F5F5)
          }
        }, (item: string) => item)

        // List + LazyForEach + ListItemGroup + LazyForEach + ListItem
        ListItemGroup({ space: 10 }) {
          LazyForEach(this.groupDataSource, (item: string) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xE0E0E0)
            }
          }, (item: string) => item)
        }
      }
      .id('listCachedCountShow_05')
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

export {}
