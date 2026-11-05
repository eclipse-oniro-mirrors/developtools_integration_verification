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
 * @id SEM_15_01_04_100_FAIL_BOOL_NUMERIC
 * @expect compile-fail
 * @section 15.1.4
 * @design 验证非数值运算符不可用于数值：boolean + int 无效
 * @note 反向用例：boolean 和 int 不能相加
 */
function main(): void {
let r = true + 1;
}
