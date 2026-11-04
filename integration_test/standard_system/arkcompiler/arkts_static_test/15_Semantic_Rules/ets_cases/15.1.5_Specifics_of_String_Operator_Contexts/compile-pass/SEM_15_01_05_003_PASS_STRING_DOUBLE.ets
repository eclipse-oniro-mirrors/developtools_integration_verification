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
 * @id SEM_15_01_05_003_PASS_STRING_DOUBLE
 * @expect compile-pass
 * @section 15.1.5
 * @design 验证字符串与 double 拼接：string + double → string
 * @note 正向用例：浮点数通过字符串转换拼接
 */
function main(): void {
    let s: string = 'pi: ';
    let pi: double = 3.14;
    let r = s + pi;
    let t: string = r;
    console.log(t);
}
