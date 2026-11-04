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
 * @id EXP_07_20_023_FAIL_MIXED_COMPLEX
 * @expect compile-fail
 * @section 7.20
 * @design 验证 n ?? a || b && c（?? 与 || 和 && 复杂混用无括号）报编译时错误。
 *         spec 规定 ?? 不能与 || 或 && 无括号混用。
 * @note 反向用例：?? 与 || && 复杂混用应报编译时错误
 */
function foo(n: boolean | undefined, a: boolean, b: boolean, c: boolean): void {
    let x = n ?? a || b && c;  // error: '??' and '||'/'&&' cannot be mixed without parentheses
}
