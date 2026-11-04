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
 * @id NAM_04_07_03_100_FAIL_READONLY_ASSIGN
 * @expect compile-fail
 * @section 4.7.3
 * @design 对只读参数赋值
 * @note 反向用例：验证对只读数组参数赋值编译错误
 */
function fooBad(arr: readonly number[]): void {
    arr[0] = 42;
}
