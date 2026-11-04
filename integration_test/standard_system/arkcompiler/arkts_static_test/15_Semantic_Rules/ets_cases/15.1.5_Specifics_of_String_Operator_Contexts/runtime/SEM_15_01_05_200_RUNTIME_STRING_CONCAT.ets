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
 * @id SEM_15_01_05_200_RUNTIME_STRING_CONCAT
 * @expect runtime
 * @section 15.1.5
 * @design 验证字符串拼接运行时行为
 * @note 运行时用例：字符串 + 数值拼接结果正确
 */
function main(): void {
    let s: string = 'value: ';
    let n: int = 42;
    let r: string = s + n;
    if (r != 'value: 42') {
        throw new Error('assertion failed: expected 'value: 42' got '' + r + ''');
    }
console.log('verified');
}
