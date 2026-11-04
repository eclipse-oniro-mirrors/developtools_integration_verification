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
 * @id NAM_04_07_03_001_PASS_READONLY_PARAM_READ
 * @expect compile-pass
 * @section 4.7.3
 * @design 只读参数可读取
 * @note 正向用例：验证只读数组/元组参数可读取元素
 */
function foo(array: readonly number[], tuple: readonly [number, string]): void {
    let element: number = array[0];
    let tElem: number = tuple[0];
}
