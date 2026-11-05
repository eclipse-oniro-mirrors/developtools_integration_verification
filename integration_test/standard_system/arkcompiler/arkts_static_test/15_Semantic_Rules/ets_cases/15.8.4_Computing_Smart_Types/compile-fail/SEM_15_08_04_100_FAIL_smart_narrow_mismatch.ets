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
 * @id SEM_15_08_04_100_FAIL_smart_narrow_mismatch
 * @expect compile-fail
 * @section 15.8.4
 * @design 智能类型拒绝：未收窄的联合类型不能赋值
 * @note 反向用例：string|int 未收窄直接赋值给 string 导致编译失败
 */
function main(): void {
    let x: string|int = 1;
    let s: string = x;
}
