/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@ObservedV2
class DataModel200 {
  // 原始状态（需响应式更新）
  @Trace arrayData: string[] = ['A', 'B'];
  @Trace setData: Set<number> = new Set([1, 2]);
  @Trace mapData: Map<string, boolean> = new Map([['active', true]]);
  @Trace dateData: Date = new Date('2023-07-08');

  // 派生状态（@Computed 返回新对象）
  @Computed get computedArray(): string[] {
    return [...this.arrayData, 'COMPUTED']; // 返回新数组
  }

  @Computed get computedSet(): Set<number> {
    const newSet = new Set(this.setData)
    newSet.add(3)
    return newSet; // 返回新 Set
  }

  @Computed get computedMap(): Map<string, boolean> {
    const newMap = new Map(this.mapData);
    newMap.set('computed', false);
    return newMap; // 返回新 Map
  }

  @Computed get formattedDate(): Date {
    const newDate = new Date(this.dateData)
    newDate.setDate(1)
    return newDate; // 返回字符串（避免引用问题）
  }
}
@Entry
@ComponentV2
struct Index200 {
  data: DataModel200 = new DataModel200();

  refreshAll() {
    this.data.arrayData.push('C')
    this.data.setData.add(4)
    this.data.mapData.set('new',false)
    this.data.dateData.setDate(2)
  }

  build() {
    Column() {

      ForEach(this.data.computedArray, (item: string, index: number) => {
        Text(`${index} ${item}`)
          .fontSize(40)
      })
      ForEach(Array.from(this.data.computedSet.entries()), (item: [string, string]) => {
        Text(`${item[0]}`)
      })
      ForEach(Array.from(this.data.computedSet.entries()), (item: [string, number]) => {
        Text(`${item[0]}`)
        Text(`${item[1]}`)
      })
      Text(`Date: ${this.data.formattedDate.toLocaleString()}`)

      // 刷新按钮
      Button('refresh').onClick(() => this.refreshAll()).id('btn')
    }
  }
}