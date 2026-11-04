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
 * @id EXP_07_36_007_PASS_CONST_FROM_LET
 * @expect compile-pass
 * @section 7.36
 * @design 常量表达式引用 let 变量 — es2panda 不禁止
 * @note 正向用例：⚠️ SPEC 不一致：spec 要求常量表达式只能引用 const，但 es2panda 允许 let
 */
let x: int = 5
const BAD: int = x * 2
function testConstFromLet(): void {
  console.log(BAD.toString())
}
