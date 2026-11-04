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
 * @id SEM_15_07_01_102_FAIL_numeric_target_error
 * @expect compile-fail
 * @section 15.7.1
 * @design 规范 15.7.1 Case 1：目标类型是数字类型时无效赋值
 * @note 反向用例：double不能赋给long, byte越界128, double不能赋给float
 */
function main(): void {
    let l: long = 1;
    l = 1.0;
    let b: byte = 127;
    b = 128;
    let f: float = 123f;
    f = 3.14;
}
