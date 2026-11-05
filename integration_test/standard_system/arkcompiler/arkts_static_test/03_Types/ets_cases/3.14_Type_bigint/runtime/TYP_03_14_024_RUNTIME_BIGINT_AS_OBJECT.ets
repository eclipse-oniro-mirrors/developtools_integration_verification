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
 * @id TYP_03_14_024_RUNTIME_BIGINT_AS_OBJECT
 * @expect runtime
 * @section 3.14
 * @design 验证 bigint 作为 Object 子类型的运行时行为
 * @note 运行时用例：实际执行验证 bigint instanceof Object
 */
function main(): void {
  let b: bigint = 123n
  let o: Object = b

  if (!(o instanceof bigint)) throw new Error("should be bigint")
  if (!(o instanceof Object)) throw new Error("should be Object")

  console.log("verified")
}
