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
/*
 * @id SEM_15_08_00_033_PASS_no_side_effect_between_check_and_use
 * @expect compile-pass
 * @section 15.8
 * @design | 鍓綔鐢?| Java 涔熶細鍥犺祴鍊煎奖鍝?flow fact銆?| Swift 鎹曡幏鍙彉鐘舵€佽鍒欎笉鍚屻€?|
 *    `SEM_15_08_027_PASS_no_side_effect_between_check_and_use` | `SEM_15_08_032_FAIL_closure_or_call_mutates_value` |
 * @note Generated one-to-one from test_design.
 */

function sem1508Pass024NoSideEffectBetweenCheckAndUse(): void {
  let value: int = 1
}



