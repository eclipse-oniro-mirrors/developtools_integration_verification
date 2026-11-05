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
 * @id CLS_09_08_018_PASS_STATIC_ACCESSOR
 * @expect compile-pass
 * @section 9.8
 * @design 静态 getter/setter 声明
 * @note 正向用例：static accessor 通过类名访问，不需要创建实例
 */
class Config {
  private static _mode: int = 0
  static get mode(): int { return Config._mode }
  static set mode(m: int) { Config._mode = m }
  static get isActive(): boolean { return Config._mode > 0 }
}

class Counter {
  private static _count: int = 0
  static get count(): int { return Counter._count }
  static set count(c: int) { Counter._count = c }
  static get next(): int {
    Counter._count = Counter._count + 1
    return Counter._count
  }
}

function testStaticAccessor(): void {
  Config.mode = 2
  let m: int = Config.mode
  let active: boolean = Config.isActive
  Counter.count = 0
  let c: int = Counter.count
  let n: int = Counter.next
  let n2: int = Counter.next
}
