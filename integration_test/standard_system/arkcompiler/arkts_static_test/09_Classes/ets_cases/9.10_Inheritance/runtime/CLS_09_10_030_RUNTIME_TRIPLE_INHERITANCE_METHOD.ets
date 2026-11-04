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
 * @id CLS_09_10_030_RUNTIME_TRIPLE_INHERITANCE_METHOD
 * @expect runtime
 * @section 9.10
 * @design 三层继承方法调用链运行时验证
 * @note 运行时用例
 */
class A30 { a(): string { return "A" } }
class B30 extends A30 { b(): string { return this.a() + "B" } }
class C30 extends B30 { c(): string { return this.b() + "C" } }
function main(): void {
  let obj: C30 = new C30()
  if (obj.c() != "ABC") { throw new Error("Expected ABC, got " + obj.c()) }
  console.log("verified")
}
