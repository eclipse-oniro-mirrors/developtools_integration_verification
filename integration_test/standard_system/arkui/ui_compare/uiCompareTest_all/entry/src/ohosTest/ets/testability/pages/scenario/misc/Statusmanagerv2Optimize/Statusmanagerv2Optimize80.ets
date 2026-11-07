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

@Entry
@ComponentV2
struct ComplexStateExample {
  // @Local 装饰的复杂类型变量
  @Local  privateArray: string[] = ['A', 'B', 'C'];
  @Local privateSet: Set<string> = new Set(['X', 'Y']);
  @Local privateMap: Map<string, number> = new Map([['key1', 1], ['key2', 2]]);
  @Local privateDate: Date = new Date();

  // 刷新 @Local 变量的方法
  refreshAll() {
    this.privateArray.push('D'); // 直接修改数组
    this.privateSet.add('Z');
    this.privateMap.set('key3', 3);
  }

  build() {
    Column({ space: 10 }) {
      // 显示 @Local 变量
      Text(`Array: ${this.privateArray.join(',')}`)
      Text(`Set: ${Array.from(this.privateSet).join(',')}`)
      Text(`Map: ${
      Array.from(this.privateMap.entries())
        .map(entry => `${entry[0]}=${entry[1]}`) // 通过索引访问 key 和 value
        .join(',')
      }`)
      Text(`Date: ${this.privateDate.toLocaleString()}`)

      // 刷新按钮
      Button('Add to Array').onClick(() => this.refreshAll()).id('btn')

      // 显示 @Param 变量（假设由父组件传入）
      ChildComponent({ paramArray: this.privateArray, paramDate: this.privateDate })
    }
    .padding(20)
  }
}

// 子组件接收 @Param 变量
@ComponentV2
struct ChildComponent {
  @Param paramArray: string[] = [];
  @Param paramDate: Date = new Date();

  build() {
    Column() {
      Text(`Parent Array: ${this.paramArray.join(',')}`)
      Text(`Parent Date: ${this.paramDate.toLocaleString()}`)
    }
  }
}

export {}
