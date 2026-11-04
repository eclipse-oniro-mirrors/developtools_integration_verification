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
 * @id SEM_15_02_00_003_PASS_CLASS_to_object
 * @expect compile-pass
 * @section 15.2
 * @design 规范 15.2.1：没有 extends 子句的类 S，S <: Object
 * @note 测试类到 Object 的子类型关系
 */

// 测试没有 extends 子句的类是 Object 的子类型
class NoExtendsClass {
  public value: number = 100
}

function testClassToObject(): void {
  let obj: Object = {}
  let instance: NoExtendsClass = new NoExtendsClass()
  
  // NoExtendsClass 是 Object 的子类型，可以赋值给 Object 类型变量
  obj = instance  // OK: NoExtendsClass <: Object
  
  console.log(obj)
}
