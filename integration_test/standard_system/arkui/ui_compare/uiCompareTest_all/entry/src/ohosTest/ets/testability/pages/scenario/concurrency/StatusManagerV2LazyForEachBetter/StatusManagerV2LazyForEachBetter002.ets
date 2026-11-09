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

class MyDataSource1 implements IDataSource {
  private dataArray: string[] = [];
  private listener: DataChangeListener | undefined;

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
  }

  public reloadListener(): void {
    this.listener?.onDataReloaded();
  }

  public registerDataChangeListener(listener: DataChangeListener): void {
    this.listener = listener;
  }

  public unregisterDataChangeListener(listener: DataChangeListener): void {
    this.listener = undefined;
  }
}

@Entry
@Component
struct StatusManagerV2LazyForEachBetter002 {
  private data: MyDataSource1 = new MyDataSource1();

  aboutToAppear() {
    for (let i = 1; i < 1000; i++) {
      this.data.pushData(i + '');
    }
  }

  build() {
    Column() {
      Text('有复用组件')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .margin(10)
        .height('10%')
      List() {
        LazyForEach(this.data, (item: string) => {
          ListItem() {
            CardView({ item: item })
          }
        }, (item: string) => item)
      }
      .cachedCount(4)
      .height('75%')
    }
  }
}

@Reusable
@Component
export struct CardView {
  @State item: string = '';

  aboutToReuse(params: Record<string, Object>): void {
    this.item = params.item as string;
  }

  build() {
    Column() {
      Text(this.item)
        .fontSize(30)
    }
    .borderWidth(1)
    .height('8.2%')
    .width('55.56%')
  }
}
