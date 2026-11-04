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
 * @id EXP_07_26_014_PASS_NULLISH_SHIFT
 * @expect compile-pass
 * @section 7.26
 * @design nullish 类型移位 — es2panda 未拒绝
 * @note 正向用例：SPEC 不一致：spec 要求数值类型或 bigint，但 es2panda 接受 int|null 作为移位操作数
 */
function testNullishShift(): void {
  let a: int | null = 8
  let r: int = a << 2
  console.log(r.toString())
}
