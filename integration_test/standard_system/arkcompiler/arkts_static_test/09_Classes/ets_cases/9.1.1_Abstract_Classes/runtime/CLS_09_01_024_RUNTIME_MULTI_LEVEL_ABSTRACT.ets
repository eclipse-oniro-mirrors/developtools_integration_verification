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
 * @id CLS_09_01_024_RUNTIME_MULTI_LEVEL_ABSTRACT
 * @expect runtime
 * @section 9.1.1
 * @design 多层抽象继承链运行时验证
 * @note 运行时用例：验证多层抽象→非抽象实例化
 */
abstract class AbsLevel1 {
  abstract method1(): string
}
abstract class AbsLevel2 extends AbsLevel1 {
  method1(): string {
    return "level2"
  }
  abstract method2(): string
}
class ConcreteLevel3 extends AbsLevel2 {
  method2(): string {
    return "level3"
  }
}

function main(): void {
  let obj = new ConcreteLevel3()
  if (obj.method1() != "level2") {
    throw new Error("method1 should be 'level2'")
  }
  if (obj.method2() != "level3") {
    throw new Error("method2 should be 'level3'")
  }
  console.log("Multi-level abstract verified")
}

