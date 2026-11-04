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
 * @id SEM_15_01_05_001_PASS_STRING_OPERATOR_CONVERSION
 * @expect compile-pass
 * @section 15.1.5
 * @design 验证二元 '+' 运算符在一侧为 string 时进行字符串转换
 * @note 正向用例：string+int→string, int+string→string, string+字面量→string
 */
function main(): void {
    let s: string = 'value: ';
    let n: int = 42;
    let result1 = s + n;
    let result2 = n + s;
    let result3 = 'num' + 100;
    console.log(`result1=${result1}, result2=${result2}, result3=${result3}`);
}
