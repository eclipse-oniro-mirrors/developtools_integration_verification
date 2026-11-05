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
 * @id STMT_08_09_002_PASS_string_for_of
 * @expect compile-pass
 * @section 8.9
 * @design 使用for-of遍历string，验证变量类型正确推断为string
 * @note for-of可以遍历string，元素类型为string（单个字符），循环体内可拼接字符
 */
function testStringForOf(): void {
    let str: string = "hello";
    let result: string = "";
    for (let ch of str) {
        result += ch;
    }
}
