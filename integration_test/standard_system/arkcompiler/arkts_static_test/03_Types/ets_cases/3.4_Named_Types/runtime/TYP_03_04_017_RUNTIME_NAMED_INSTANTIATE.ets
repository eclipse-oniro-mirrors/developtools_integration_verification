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
 * @id TYP_03_04_017_RUNTIME_NAMED_INSTANTIATE
 * @expect runtime
 * @section 3.4
 * @design 命名类型实例化与方法调用运行时行为
 * @note 运行时用例：class/interface/enum/alias 实例化和方法分发
 */
class RtClass {
  field: int
  constructor(v: int) { this.field = v }
  method(): int { return this.field * 2 }
}

interface RtInterface {
  process(): string
}

class RtImpl implements RtInterface {
  process(): string { return "ok" }
}

enum RtEnum {
  A,
  B
}

type RtAlias = int | string

function main(): void {
  // class 实例化
  let c: RtClass = new RtClass(5)
  if (c.method() != 10) {
    throw new Error("class method failed")
  }

  // interface 多态
  let i: RtInterface = new RtImpl()
  if (i.process() != "ok") {
    throw new Error("interface dispatch failed")
  }

  // enum 实例化
  let e: RtEnum = RtEnum.A
  if (e != RtEnum.A) {
    throw new Error("enum value failed")
  }

  // alias 等价于底层
  let a: RtAlias = 42
  if (a != 42) {
    throw new Error("alias int failed")
  }
  a = "hello"
  if (a != "hello") {
    throw new Error("alias string failed")
  }

  console.log("Named type instantiate verified")
}