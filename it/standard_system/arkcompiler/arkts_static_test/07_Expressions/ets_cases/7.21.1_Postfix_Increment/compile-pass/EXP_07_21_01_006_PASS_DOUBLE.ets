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
 * @id EXP_07_21_01_006_PASS_DOUBLE
 * @expect compile-pass
 * @section 7.21.1
 * @design 验证 double 类型后置递增编译通过。
 *         double 是数值类型，支持 ++ 操作符。
 * @note 正向用例：double 后置递增编译通过
 */
function testDoubleIncrement(): void {
    let x: double = 3.14;
    x++;
}
