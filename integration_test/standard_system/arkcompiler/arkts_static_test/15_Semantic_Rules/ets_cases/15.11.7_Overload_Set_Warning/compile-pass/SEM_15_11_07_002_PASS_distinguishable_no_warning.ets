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
 * @id SEM_15_11_07_002_PASS_distinguishable_no_warning
 * @expect compile-pass
 * @section 15.11.7
 * @design 可区分重载无警告：不同类型参数可区分
 * @note 正向用例：int 和 string 参数区分明确
 */
function f(x: int): string { return 'i'; }
function f(x: string): string { return 's'; }
function main(): void {
    console.log(f(1));
}
