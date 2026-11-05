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
 * @id EXP_07_21_08_037_RUNTIME_NONBOOL_NULL_UNDEFINED
 * @expect runtime
 * @section 7.21.8
 * @design 验证 !null / !undefined / !Object 运行时 truthy/falsy 语义
 * @note 运行时用例：null/undefined → falsy → ! = true; Object → truthy → ! = false
 */
function main(): void {
    if (!null != true) {
        throw new Error('assertion failed: !null != true')
    }
    if (!undefined != true) {
        throw new Error('assertion failed: !undefined != true')
    }
    let o: Object = {}
    if (!o != false) {
        throw new Error('assertion failed: !Object != false')
    }
console.log('verified')
}
