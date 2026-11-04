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
 * @id EXP_07_28_02_008_PASS_STRICT_EQUALITY_FUNCTION
 * @expect compile-pass
 * @section 7.28.2
 * @design 验证 === 和 !== 作用于函数类型编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function foo(): void {}
function bar(): void {}

class A {
  method(): void {}
}

function main(): void {
  // 顶级函数 === !==
  let r1: boolean = foo === foo;
  let r2: boolean = foo !== bar;
  let r3: boolean = foo === bar;

  // 实例方法 === !==
  const a = new A();
  const obj2 = new A();
  let r4: boolean = a.method === a.method;
  let r5: boolean = a.method !== obj2.method;
}
