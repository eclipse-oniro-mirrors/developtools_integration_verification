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
 * @id CLS_09_01_023_RUNTIME_ABSTRACT_CONSTRUCTOR_EXEC
 * @expect runtime
 * @section 9.1.1
 * @design 抽象类构造器在非抽象子类实例化时执行
 * @note 运行时用例：验证抽象类构造器逻辑
 */
abstract class AbsBase2 {
  val: int
  constructor(v: int) {
    this.val = v
  }
}
class Concrete2 extends AbsBase2 {
  constructor(v: int) {
    super(v)
  }
}

function main(): void {
  let c = new Concrete2(42)
  if (c.val != 42) {
    throw new Error("Concrete2.val should be 42")
  }
  console.log("Abstract constructor execution verified")
}

