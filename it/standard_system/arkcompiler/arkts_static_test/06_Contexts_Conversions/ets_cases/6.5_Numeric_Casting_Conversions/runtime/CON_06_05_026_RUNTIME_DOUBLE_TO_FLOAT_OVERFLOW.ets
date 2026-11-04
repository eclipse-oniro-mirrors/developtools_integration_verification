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
 * @id CON_06_05_026_RUNTIME_DOUBLE_TO_FLOAT_OVERFLOW
 * @expect runtime
 * @section 6.5
 * @design double��float���絽����
 * @note spec: float infinity from a finite double
 */
function main(): void {
    let huge: double = 1e40
    let f: float = huge.toFloat()
    if (f.isInfinite() != true) {
        throw new Error('overflow mismatch')
      }
    console.log('verified')
}
