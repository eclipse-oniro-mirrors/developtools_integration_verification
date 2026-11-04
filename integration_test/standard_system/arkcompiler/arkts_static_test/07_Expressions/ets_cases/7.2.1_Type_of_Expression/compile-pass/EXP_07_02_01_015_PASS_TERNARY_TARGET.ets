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
 * @id EXP_07_02_01_015_PASS_TERNARY_TARGET
 * @expect compile-pass
 * @section 7.2.1
 * @design 三目表达式类型推断，两个分支类型一致或在 target type 下可兼容
 * @note 正向用例：验证三目表达式类型推断
 */
function testTernaryTarget(): void {
  let cond: boolean = true
  let a: int = cond ? 10 : 20
  let b: string = cond ? 'yes' : 'no'
}
