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
 * @id STMT_08_08_024_PASS_FOR_ARRAY
 * @expect compile-pass
 * @section 8.8
 * @design 数组作为 for 条件，受 Extended Conditional Expressions 支持，当前编译通过
 * @note spec §15.14.1 truthiness：Any other nonNullish type 恒为 true（死循环风险，仅验证编译通过）
 */
function testForArrayCondFail(): void {
  for (let i: int = 0; [1,2,3]; i++) { console.log("bad") }
}
