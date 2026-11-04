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
 * @id TYP_03_06_04_009_FAIL_BOOLEAN_NUMERIC
 * @expect compile-fail
 * @section 3.6.4
 * @design boolean ↔ 数值互转禁止
 * @note 反向用例：sec §3.6.4 boolean 与数值不可转
 */
function testBooleanNumericFail(): void {
  let b: boolean = true
  let i: int = b
  let d: double = b

  let n: int = 1
  let bl: boolean = n
}