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
class Product {
  @Trace privateArray: string[] = ['A', 'B', 'C'];
  @Trace privateSet: Set<string> = new Set(['X', 'Y']);
  @Trace privateMap: Map<string, number> = new Map([['key1', 1], ['key2', 2]]);
  @Trace privateDate: Date = new Date('2021-08-08')
}

@Entry
@ComponentV2
struct IndexOp40 {
  product: Product = new Product();

  // 刷新 @Local 变量的方法
  refreshAll() {
    this.product.privateArray.push('D'); // 直接修改数组
    this.product.privateSet.add('Z');
    this.product.privateMap.set('key3', 3);
    this.product.privateDate = new Date('2023-07-08');
  }

  build() {
    Column() {
      ForEach(this.product.privateArray, (item: string, index: number) => {
        Text(`${index} ${item}`)
          .fontSize(40)
      })
      ForEach(Array.from(this.product.privateSet.entries()), (item: [string, string]) => {
        Text(`${item[0]}`)
      })
      ForEach(Array.from(this.product.privateMap.entries()), (item: [string, number]) => {
        Text(`${item[0]}`)
        Text(`${item[1]}`)
      })
      Text(`Date: ${this.product.privateDate.toLocaleString()}`)

      // 刷新按钮
      Button('Add to Array').onClick(() => this.refreshAll()).id('btn')
    }
  }
}