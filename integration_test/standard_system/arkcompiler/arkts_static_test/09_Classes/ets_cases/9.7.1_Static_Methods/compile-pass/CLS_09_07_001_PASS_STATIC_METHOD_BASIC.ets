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
 * @id CLS_09_07_001_PASS_STATIC_METHOD_BASIC
 * @expect compile-pass
 * @section 9.7.1
 * @design 静态方法基本用法：static方法声明、static getter/setter、static final方法
 * @note 正向用例：合法的静态方法声明与调用
 */
class MathUtil001 {
  static add(a: int, b: int): int {
    return a + b
  }

  static get ZERO(): int {
    return 0
  }

  private static _counter: int = 0

  static set counter(v: int) {
    MathUtil001._counter = v
  }

  static get counter(): int {
    return MathUtil001._counter
  }
}

class StringUtil001 {
  static repeat(s: string, n: int): string {
    let result: string = ""
    for (let i: int = 0; i < n; i++) {
      result = result + s
    }
    return result
  }
}

function testStaticMethod(): void {
  let sum: int = MathUtil001.add(10, 20)
  let z: int = MathUtil001.ZERO
  MathUtil001.counter = 42
  let c: int = MathUtil001.counter
  let r: string = StringUtil001.repeat("ab", 3)
}
