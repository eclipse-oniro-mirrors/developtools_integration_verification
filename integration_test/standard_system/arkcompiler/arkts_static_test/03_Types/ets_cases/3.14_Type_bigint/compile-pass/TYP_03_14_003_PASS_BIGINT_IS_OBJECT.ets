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
 * @id TYP_03_14_003_PASS_BIGINT_IS_OBJECT
 * @expect compile-pass
 * @section 3.14
 * @design 验证 bigint 是 Object 子类型
 * @note 正向用例：验证该特性编译通过的正确用法
 */
let b: bigint = 123n
let o: Object = b

function main(): void {
  if (!(o instanceof bigint)) throw new Error("should be bigint")
  console.log("verified")
}
