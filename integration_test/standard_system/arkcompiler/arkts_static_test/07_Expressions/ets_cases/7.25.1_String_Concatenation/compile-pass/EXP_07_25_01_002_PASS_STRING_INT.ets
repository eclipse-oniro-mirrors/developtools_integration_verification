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
 * @id EXP_07_25_01_002_PASS_STRING_INT
 * @expect compile-pass
 * @section 7.25.1
 * @design 验证 string + int 字符串拼接（整数→十进制字符串转换）编译通过
 * @note 正向用例：string + int 触发字符串转换，int 转为十进制字符串拼接
 */
function main(): void {
    let s: string = 'value=' + 42;
    let a: int = 100;
    let t: string = 'num=' + a;
}
