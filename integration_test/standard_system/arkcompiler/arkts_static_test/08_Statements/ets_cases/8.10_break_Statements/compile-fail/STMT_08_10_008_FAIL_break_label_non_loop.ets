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
 * @id STMT_08_10_008_FAIL_break_label_non_loop
 * @expect compile-fail
 * @section 8.10
 * @design break标签指向一个非循环/switch语句的标签（如标记的块语句），产生编译错误
 * @note compile-time error: break with label pointing to a non-loop/non-switch labeled statement
 */
function testBreakLabelNonLoop(): void {
    lab: {
        break lab;
    }
}
