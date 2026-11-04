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
 * @id EXP_07_28_02_007_PASS_DIFF_METHOD_NAME
 * @expect compile-pass
 * @section 7.28.2
 * @design 验证同一实例上不同方法的引用比较编译通过（即使运行时为 false）
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
class A {
  method(): void {}
  foo(): void {}
}

function main(): void {
  const a = new A();
  let r: boolean = a.method == a.foo;
  let r2: boolean = a.method != a.foo;
}
