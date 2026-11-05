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
 * @id CLS_09_09_012_RUNTIME_INSTANCEOF_IN_CONSTRUCTOR
 * @expect runtime
 * @section 9.9.1
 * @design 构造器中字段完全初始化后instanceof检查结果正确 — spec: crash_this example
 * @note 运行时用例：验证构造器初始化完成后对象instanceof关系及字段值正确
 */
class Base012 {
  x: int = 0
  constructor() {
    this.x = 10
  }
}
class Derived012 extends Base012 {
  y: int = 0
  constructor() {
    super()
    this.y = 20
  }
}

function verify012(obj: Base012): void {
  if (obj instanceof Derived012) {
    let d: Derived012 = obj as Derived012
    if (d.y != 20) {
      throw new Error("Derived field y should be 20")
    }
  }
}

function main(): void {
  let d: Derived012 = new Derived012()
  if (!(d instanceof Base012)) {
    throw new Error("Derived012 should be instanceof Base012")
  }
  if (!(d instanceof Derived012)) {
    throw new Error("Derived012 should be instanceof Derived012")
  }
  if (d.x != 10) {
    throw new Error("Base field x should be 10, got " + d.x)
  }
  if (d.y != 20) {
    throw new Error("Derived field y should be 20, got " + d.y)
  }
  verify012(d)
  console.log("verified")
}
