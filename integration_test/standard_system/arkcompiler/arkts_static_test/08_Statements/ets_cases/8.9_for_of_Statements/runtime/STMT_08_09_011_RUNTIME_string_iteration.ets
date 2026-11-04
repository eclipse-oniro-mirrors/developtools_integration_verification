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
 * @id STMT_08_09_011_RUNTIME_string_iteration
 * @expect runtime
 * @section 8.9
 * @design 运行时验证string的for-of迭代结果正确
 * @note 遍历string验证字符拼接和迭代次数
 */
function main(): void {
    let str: string = "abc";
    let result: string = "";
    let count: int = 0;
    for (let ch of str) {
        result += ch;
        count++;
    }
    if (result != "abc") {
        throw new Error("String iteration result mismatch");
    }
    if (count != 3) {
        throw new Error("String iteration count mismatch");
    }
    console.log("verified");
}
