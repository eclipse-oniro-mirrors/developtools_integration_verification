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
 * @id EXP_07_33_001_PASS_TRUE_COMPILE_TIME_TYPE
 * @expect compile-pass
 * @section 7.33
 * @design 验证编译时条件为 true 时，三元表达式类型为 whenTrue 分支的类型：true ? "5" : 6 → string 类型
 * @note 正向用例：编译时 true 条件，整个表达式类型为 whenTrue 分支类型
 */
class A {}
class B extends A {}

function main(): void {
  // true ? "5" : 6 → 类型为 string（compile-time true 选择 whenTrue 分支的类型）
  let a: string = true ? '5' : 6;

  // true ? 42 : 99 → 类型为 int
  let b: int = true ? 42 : 99;

  // true ? new A() : new B() → 类型为 A
  let c: A = true ? new A() : new B();

  // true ? new B() : new A() → 类型为 A（父类）
  let d: A = true ? new B() : new A();
}
