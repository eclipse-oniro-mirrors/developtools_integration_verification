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
 * @id EXP_07_14_004_PASS_NON_NULLISH_NO_EFFECT
 * @expect compile-pass
 * @section 7.14
 * @design 验证非 nullish 类型上链式操作符无作用：类型不受影响（仍是 T 而非 T|undefined）
 * @note 正向用例：s1?.[0] 其中 s1 为 string（非 nullish），结果类型为 string 而非 string|undefined
 */
function main(): void {
  let s1: string = 'hello';
  let a: string = s1?.[0];
}
