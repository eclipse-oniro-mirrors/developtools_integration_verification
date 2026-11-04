/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
/**
 * @id EXP2_17_05_008_PASS_OVERLOAD
 * @expect compile-pass
 * @section 17.5
 * @design $_get 重载：使用抽象类声明多个 $_get 签名，子类实现。验证索引方法重载语法
 * @note 正向用例：验证 $_get 可以有不同的参数类型（int 和 string），通过类层次实现
 *       ⚠️ SPEC 不一致：spec 要求索引参数为 string 或 number，但当前实现要求 int
 *       ⚠️ ArkTS 不支持 TypeScript 风格的方法重载签名语法
 */
abstract class AbstractOverloaded {
  abstract $_get(index: int): string
  abstract $_set(index: int, value: string): void
}

class MultiIndex extends AbstractOverloaded {
  private numItems: string[] = ['a', 'b', 'c']
  private strItems: Object = {}

  $_get(index: int): string {
    return this.numItems[index]
  }

  $_set(index: int, value: string): void {
    this.numItems[index] = value
  }
}

class StringIndexStore {
  $_get(key: string): string {
    return 'value_' + key
  }

  $_set(key: string, value: string): void {
    // store
  }
}

function testOverload(): void {
  let numIdx: MultiIndex = new MultiIndex()
  let v1: string = numIdx[0]
  numIdx[1] = 'updated'

  let strIdx: StringIndexStore = new StringIndexStore()
  let v2: string = strIdx['name']
  strIdx['key'] = 'val'
}
