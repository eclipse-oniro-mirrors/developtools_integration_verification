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
 * @id EXP_07_36_006_PASS_CONST_DECREMENT
 * @expect compile-pass
 * @section 7.36
 * @design 常量表达式使用 -- — es2panda 未禁止
 * @note 正向用例：⚠️ SPEC 不一致：spec §7.36 不允许 -- 在常量表达式中，但 es2panda 编译通过
 */
let count: int = 5
const BAD: int = count--
function testConstDecrement(): void {
  console.log(BAD.toString())
}
