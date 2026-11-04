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
 * @id SEM_15_07_01_006_PASS_union_no_numeric_type
 * @expect compile-pass
 * @section 15.7.1
 * @design 规范 15.7.1 Note：联合类型不含数字类型时使用字面量默认类型
 * @note 正向用例：Object|string = 1 (int默认), x = 1.0 (double默认)
 */
function main(): void {
    let x: Object | string = 1;
    x = 1.0;
    console.log('verified');
}
