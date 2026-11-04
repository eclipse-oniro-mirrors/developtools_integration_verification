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
 * @id TYP_03_06_01_014_FAIL_BIGINT_ASSIGN_NUMERIC
 * @expect compile-fail
 * @section 3.6.1
 * @design 数值类型变量不能接受 bigint 字面量
 * @note 反向用例：bigint 不能赋值给数值类型变量
 */
function testBigintAssignNumericFail(): void {
  let i: int = 100n
  let n: number = 200n
  let l: long = 300n
  let d: double = 400n
}