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
 * @id SEM_15_01_05_100_FAIL_STRING_SUB
 * @expect compile-fail
 * @section 15.1.5
 * @design 验证二进制运算符 '-' 不可用于字符串：string - string 无效
 * @note 反向用例：字符串不支持减法运算
 */
function main(): void {
let r = 'hello' - 'o';
}
