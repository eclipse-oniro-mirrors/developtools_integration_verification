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
 * @id CLS_09_09_011_RUNTIME_FIELD_INIT_ORDER
 * @expect runtime
 * @section 9.9.1
 * @design 继承链中字段初始化与构造器执行顺序：父类字段→父类构造器→子类字段→子类构造器
 * @note 运行时用例：验证三级继承链中字段初始化器与构造器体的交错执行顺序
 */
let execLog011: string = ""

function mark011(tag: string): int {
  execLog011 = execLog011 + tag
  return 0
}

class GrandParent011 {
  gpField: int = mark011("Gf")
  constructor() { mark011("Gc") }
}
class Parent011 extends GrandParent011 {
  pField: int = mark011("Pf")
  constructor() { super(); mark011("Pc") }
}
class Child011 extends Parent011 {
  cField: int = mark011("Cf")
  constructor() { super(); mark011("Cc") }
}

function main(): void {
  let c: Child011 = new Child011()
  if (execLog011 != "GfGcPfPcCfCc") {
    throw new Error("Expected GfGcPfPcCfCc order, got " + execLog011)
  }
  console.log("verified")
}
