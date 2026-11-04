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
 * @id SEM_15_02_03_102_FAIL_BOOLEAN_LITERAL_NOT_NUMBER
 * @expect compile-fail
 * @section 15.2.3
 * @design 验证 boolean 字面量类型不是 number 的子类型
 * @note 反向用例：true 是 boolean 字面量类型，不是 number 的子类型，不能赋值给 number
 */
function main(): void {
let x: number = true;
}
