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
 * @id EXP_07_02_04_004_PASS_MIXED_CALL_TYPES
 * @expect compile-pass
 * @section 7.2.4
 * @design 三种调用类型（函数/方法/构造函数）的参数编译全部通过，测试参数求值顺序规则的适用范围覆盖
 * @note 正向用例：综合验证三种调用类型参数从左到右编译通过
 */
function fnArg(x: int): int {
  return x
}

class Helper {
  getValue(v: int): int {
    return v
  }
}

class Data {
  public a: int
  public b: int

  constructor(a: int, b: int) {
    this.a = a
    this.b = b
  }

  sum(x: int, y: int): int {
    return this.a + this.b + x + y
  }
}

// 函数调用
function process(a: int, b: int, c: int): int {
  return a + b + c
}

let r1: int = process(fnArg(1), fnArg(2), fnArg(3))

// 方法调用
let h: Helper = new Helper()
let r2: int = h.getValue(fnArg(42))

// 构造函数调用
let d: Data = new Data(fnArg(100), fnArg(200))
let r3: int = d.sum(fnArg(5), fnArg(10))
