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
 * @id TYP_03_17_02_004_PASS_UNSAFE_GET
 * @expect compile-pass
 * @section 3.17.2
 * @design 验证 unsafeGet 方法编译通过（spec/types.md:1250-1257）
 * @note 正向用例：Tuple 类型的 unsafeGet 方法可正常调用
 */
function logTuple(x: Object): void {
  if (x instanceof Tuple) {
    let elem: Any = x.unsafeGet(1)
    console.log(elem)
  }
}

function main(): void {
  let a: [string, string] = ["aa", "bb"]
  logTuple(a)
  console.log("verified")
}