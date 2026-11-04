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
 * @id CON_06_05_025_RUNTIME_DOUBLE_TO_FLOAT_UNDERFLOW
 * @expect runtime
 * @section 6.5
 * @design double��float���絽��
 * @note spec: float zero from a nonzero double
 */
function main(): void {
    let tiny: double = 1e-50
    let f: float = tiny.toFloat()
    if (f != 0.0) {
    throw new Error('underflow mismatch')
  }
    console.log('verified')
}
