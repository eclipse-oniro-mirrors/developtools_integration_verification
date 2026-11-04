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
 * @id LEX_02_08_011_PASS_TERNARY_OP
 * @expect compile-pass
 * @section 2.8
 * @design 三元条件运算符 ? :
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testTernaryOp(): void {
  let cond: boolean = true
  let r1: number = cond ? 1 : 2
  let r2: string = cond ? "yes" : "no"
  let nested: number = cond ? (1 + 1) : (2 * 2)
  let r3: number = (1 > 0) ? 100 : -100
}
