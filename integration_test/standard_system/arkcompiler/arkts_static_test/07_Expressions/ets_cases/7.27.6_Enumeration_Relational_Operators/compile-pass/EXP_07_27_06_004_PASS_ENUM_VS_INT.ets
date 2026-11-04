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
 * @id EXP_07_27_06_004_PASS_ENUM_VS_INT
 * @expect compile-pass
 * @section 7.27.6
 * @design 枚举类型与 int 关系比较 — es2panda 接受
 * @note 正向用例：⚠️ SPEC 不一致：spec 要求不同枚举类型或 enum vs int 应报错，但 es2panda 编译通过
 */
enum Color { RED, GREEN, BLUE }
function testEnumVsInt(): void {
  let a: Color = Color.RED
  let b: int = 1
  let r: boolean = a < b
  console.log(r.toString())
}
