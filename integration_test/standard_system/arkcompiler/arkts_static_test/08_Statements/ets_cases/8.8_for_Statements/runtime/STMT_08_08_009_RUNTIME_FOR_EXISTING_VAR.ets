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
 * @id STMT_08_08_009_RUNTIME_FOR_EXISTING_VAR
 * @expect runtime
 * @section 8.8
 * @design 使用已存在变量作为循环索引，验证循环后索引变量值正确
 * @note 运行时用例：int idx = 0; for (; idx < 5; idx++) 之后 idx == 5
 */
function main(): void {
    let idx: int = 0
    for (; idx < 5; idx++) {
        // empty body
    }
    if (idx != 5) {
        throw new Error("existing var after for failed, expected 5 but got " + idx)
    }
    console.log("verified")
}
