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
 * @id EXP_07_21_06_023_FAIL_OBJECT
 * @expect compile-fail
 * @section 7.21.6
 * @design 验证 Object 类型一元负号报编译时错误。
 * @note 反向用例：-Object 应报编译时错误
 */
function testObjectUnaryMinus(): void {
    let o: Object = 'not a number';
    let x = -o;
}
