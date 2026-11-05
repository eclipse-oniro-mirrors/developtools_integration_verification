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
 * @id TYP_03_20_015_FAIL_COALESCE_MIX_OR
 * @expect compile-fail
 * @section 3.20
 * @design ?? 与 || 不加括号混用应编译失败
 * @note 反向用例：spec §Nullish-Coalescing Expression 规定不能混用
 */
function testCoalesceMixOrFail(n: boolean | undefined, a: boolean, b: boolean): void {
  let r: boolean = n ?? a || b
}