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
 * @id SEM_15_11_07_003_PASS_wide_hides_narrow
 * @expect compile-pass
 * @section 15.11.7
 * @design 宽类型隐藏窄类型
 * @note 正向用例
 */
function pick(x: int | string): string { return 'wide'; }
function pick(x: int): string { return 'narrow'; }
function main(): void {
    console.log(pick(1));
}
