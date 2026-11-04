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
 * @id CON_06_02_026_PASS_BIGINT_STRING_CONCAT
 * @expect compile-pass
 * @section 6.2
 * @design bigint + string 拼接
 * @note spec: console.log('BigInt is ' + 123n)
 */
function testBigintStringConcat(): void {
  let s: string = 'BigInt is ' + 123n
}