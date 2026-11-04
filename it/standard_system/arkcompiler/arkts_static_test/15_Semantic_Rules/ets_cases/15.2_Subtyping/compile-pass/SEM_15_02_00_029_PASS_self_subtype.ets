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
/*
 * @id SEM_15_02_00_029_PASS_self_subtype
 * @expect compile-pass
 * @section 15.2
 * @design 规范 15.2：类型 S 是自身的子类型
 * @note 测试类型自身的子类型关系：A 类型实例可赋值给 A 类型变量
 */

// 测试类型自身的子类型关系
class A {
  public x: int = 0
}

function testSelfSubtype(): void {
  let a1: A = new A()
  let a2: A = a1  // OK: A <: A，自身赋值

  console.log(`${a2.x}`)
}
