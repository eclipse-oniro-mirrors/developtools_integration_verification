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
 * @id EXP_07_21_05_022_FAIL_BOOLEAN
 * @expect compile-fail
 * @section 7.21.5
 * @design 验证 boolean 类型一元正号报编译时错误。
 *         boolean 不可转换为数值类型。
 *  * @note 反向用例：验证该场景应产生编译时错误
 */
function testBooleanUnaryPlus(): void {
    let b: boolean = true;
    let x = +b;
}
