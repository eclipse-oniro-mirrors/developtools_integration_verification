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
 * @id EXP_07_21_02_022_FAIL_BOOLEAN
 * @expect compile-fail
 * @section 7.21.2
 * @design 验证 boolean 类型后置递减报编译时错误。
 * @note 反向用例：boolean -- 应报编译时错误
 */
function testBooleanDecrement(): void {
    let b: boolean = true;
    b--;
}
