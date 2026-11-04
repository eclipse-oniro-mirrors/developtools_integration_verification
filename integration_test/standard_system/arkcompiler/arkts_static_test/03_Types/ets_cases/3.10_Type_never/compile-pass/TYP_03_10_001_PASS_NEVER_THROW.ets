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
 * @id TYP_03_10_001_PASS_NEVER_THROW
 * @expect compile-pass
 * @section 3.10
 * @design never 函数通过 throw 永不返回
 * @note 正向用例：spec §3.10 例子
 */
function fooThrow(): never {
  throw new Error("foo() never returns")
}

function testNeverThrow(): void {
  // x never gets a value
  let x: never = fooThrow()
}