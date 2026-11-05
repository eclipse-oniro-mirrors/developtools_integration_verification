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
 * @id SEM_15_03_00_100_FAIL_DIFF_TYPES_NOT_IDENTICAL
 * @expect compile-fail
 * @section 15.3
 * @design 验证不同类型不具同一性：int 和 string 不是同一类型
 * @note 反向用例：int 不可赋值给 string
 */
function main(): void {
    let x: int = 42;
    let y: string = x;
}
