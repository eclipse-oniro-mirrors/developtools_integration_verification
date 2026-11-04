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
 * @id CON_06_03_01_001_PASS_INT_LONG_RELATIONAL
 * @expect compile-pass
 * @section 6.3.1
 * @design 关系运算符: int < long, int 隐式 widening 转换为 long 后比较
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testIntLongRelational(): void {
  let a: int = 1
  let b: long = 0
  let r1: boolean = a < b
  let r2: boolean = a > b
  let r3: boolean = b < a
  let r4: boolean = b > a
}
