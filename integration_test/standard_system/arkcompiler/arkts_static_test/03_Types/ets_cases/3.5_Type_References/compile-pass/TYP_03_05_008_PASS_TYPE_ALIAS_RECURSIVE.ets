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
 * @id TYP_03_05_008_PASS_TYPE_ALIAS_RECURSIVE
 * @expect compile-pass
 * @section 3.5
 * @design type alias 链式引用，递归替换
 * @note 正向用例：A → B → C 链式替换
 */
type ChainA = ChainB
type ChainB = ChainC
type ChainC = number

function testAliasRecursiveReplacement(): void {
  let a: ChainA = 1.0     // 实际是 number
  let b: ChainB = 2.0     // 实际是 number
  let c: ChainC = 3.0     // 实际是 number

  // 三者完全互换
  a = b
  b = c
  c = a + b   // 算术运算用 number
}