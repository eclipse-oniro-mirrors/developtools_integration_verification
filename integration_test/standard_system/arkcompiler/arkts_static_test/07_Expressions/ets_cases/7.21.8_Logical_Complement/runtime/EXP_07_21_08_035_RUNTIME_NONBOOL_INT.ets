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
 * @id EXP_07_21_08_035_RUNTIME_NONBOOL_INT
 * @expect runtime
 * @section 7.21.8
 * @design 验证 !int 运行时 truthy/falsy 语义
 * @note 运行时用例：!0=true（falsy），!非零=false（truthy）
 */
function main(): void {
    // non-zero → truthy → ! = false
    if (!42 != false) {
        throw new Error('assertion failed: !42 != false')
    }
    // zero → falsy → ! = true
    if (!0 != true) {
        throw new Error('assertion failed: !0 != true')
    }
    // negative → truthy → ! = false
    if (!(-1) != false) {
        throw new Error('assertion failed: !(-1) != false')
    }
console.log('verified')
}
