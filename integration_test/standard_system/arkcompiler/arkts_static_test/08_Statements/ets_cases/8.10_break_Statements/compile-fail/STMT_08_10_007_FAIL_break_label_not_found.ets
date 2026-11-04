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
 * @id STMT_08_10_007_FAIL_break_label_not_found
 * @expect compile-fail
 * @section 8.10
 * @design break的标签不匹配任何封闭语句的标签，产生编译错误
 * @note compile-time error: break label does not match any enclosing statement label
 */
function testBreakLabelNotFound(): void {
    let i: int = 0;
    while (i < 10) {
        break nonexistent_label;
    }
}
