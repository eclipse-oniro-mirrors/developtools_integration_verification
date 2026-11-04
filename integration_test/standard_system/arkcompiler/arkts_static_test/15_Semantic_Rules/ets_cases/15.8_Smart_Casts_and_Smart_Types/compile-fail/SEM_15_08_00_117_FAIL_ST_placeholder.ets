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
 * @id SEM_15_08_00_117_FAIL_ST_placeholder
 * @expect compile-fail
 * @section 15.8
 * @design 智能转换拒绝：未收窄的联合类型直接赋值
 * @note 反向用例：string|int 未通过 instanceof/null 检查直接赋值给 string
 */
function main(): void {
    let x: string | int = 42;
    let s: string = x;
}
