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

class BasicDataSource2 implements IDataSource {
  private listeners: DataChangeListener[] = [];
  private originDataArray: string[] = [];

  public totalCount(): number {
    return 0;
  }

  public getData(index: number): string {
    return this.originDataArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      console.info('add listener');
      this.listeners.push(listener);
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener);
    if (pos >= 0) {
      console.info('remove listener');
      this.listeners.splice(pos, 1);
    }
  }

  notifyDataReload(): void {
    this.listeners.forEach(listener => {
      listener.onDataReloaded();
    })
  }

  notifyDataAdd(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataAdd(index);
    })
  }

  notifyDataChange(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataChange(index);
    })
  }

  notifyDataDelete(index: number): void {
    this.listeners.forEach(listener => {
      listener.onDataDelete(index);
    })
  }

  notifyDataMove(from: number, to: number): void {
    this.listeners.forEach(listener => {
      listener.onDataMove(from, to);
    })
  }

  notifyDatasetChange(operations: DataOperation[]): void {
    this.listeners.forEach(listener => {
      listener.onDatasetChange(operations);
    })
  }
}

class MyDataSource2 extends BasicDataSource2 {
  private dataArray: string[] = [];

  public totalCount(): number {
    return this.dataArray.length;
  }

  public getData(index: number): string {
    return this.dataArray[index];
  }

  public addData(index: number, data: string): void {
    this.dataArray.splice(index, 0, data);
    this.notifyDataAdd(index);
  }

  public pushData(data: string): void {
    this.dataArray.push(data);
    this.notifyDataAdd(this.dataArray.length - 1);
  }
}

@Entry
@ComponentV2
struct StatusManagerV2LazyForEachBetter004 {
  private data: MyDataSource2 = new MyDataSource2();

  aboutToAppear() {
    for (let i = 0; i < 100; i++) {
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
        LazyForEach(this.data, (item: string, index: number) => {
          ListItem() {
            Column() {
              ChildComponent({ data: item })
            }
          }
        })
      }.cachedCount(5)
      .height('75%')
    }
  }
}

@ReusableV2
@ComponentV2
struct ChildComponent {
  @Param @Require data: string;
  aboutToAppear(): void {
    console.log('ChildComponent aboutToAppear', this.data);
  }
  aboutToDisappear(): void {
    console.log('ChildComponent aboutToDisappear', this.data);
  }
  aboutToReuse(): void {
    console.log('ChildComponent aboutToReuse', this.data);
  }
  aboutToRecycle(): void {
    console.log('ChildComponent aboutToRecycle', this.data);
  }
  build() {
    Row() {
      Column() {
        Text(this.data)
          .fontSize(30)
      }
      .borderWidth(1)
      .height('8.2%')
      .width('55.56%')
    }
  }
}

export {}
