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
 * @id EXP_07_28_03_008_PASS_SPEC_EXAMPLES
 * @expect compile-pass
 * @section 7.28.3
 * @design 验证规范中所有 spec 示例代码编译通过
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */
function foo(x: Object | null, y: Object | null | undefined): void {
  // spec 示例：x == y 比较
  let r1: boolean = x == y;
  let r2: boolean = x === y;
}

function main(): void {
  // spec 示例：直接比较 null 和 undefined
  let r3: boolean = null == undefined;
  let r4: boolean = null === undefined;

  // spec 示例：调用可空参数函数
  foo(null, undefined);
  foo(null, null);
}
