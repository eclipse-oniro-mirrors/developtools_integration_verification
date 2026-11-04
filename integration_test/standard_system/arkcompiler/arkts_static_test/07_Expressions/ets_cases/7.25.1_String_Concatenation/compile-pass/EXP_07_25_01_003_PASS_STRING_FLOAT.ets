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
 * @id EXP_07_25_01_003_PASS_STRING_FLOAT
 * @expect compile-pass
 * @section 7.25.1
 * @design 验证 string + double/float 字符串拼接（浮点→十进制无精度丢失转换）编译通过
 * @note 正向用例：string + double/float 触发浮点→字符串转换
 */
function main(): void {
    let s: string = 'pi=' + 3.14159;
    let a: double = 2.71828;
    let t: string = 'e=' + a;
}
