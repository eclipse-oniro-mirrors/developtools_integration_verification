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
 * @id CLS_09_09_005_RUNTIME_CONSTRUCTOR_EXEC_ORDER
 * @expect runtime
 * @section 9.9.1
 * @design 构造器执行顺序验证：父类字段→父类构造器→子类字段→子类构造器
 * @note 运行时用例：验证继承链构造顺序
 */
let execLog: string = ""

class GrandParent {
  gpField: string = "gp"
  constructor() { execLog = execLog + "G" }
}
class Parent extends GrandParent {
  pField: string = "p"
  constructor() { super(); execLog = execLog + "P" }
}
class Child extends Parent {
  cField: string = "c"
  constructor() { super(); execLog = execLog + "C" }
}

function main(): void {
  let c: Child = new Child()
  if (execLog != "GPC") { throw new Error("Expected GPC order, got " + execLog) }
  console.log("verified")
}
