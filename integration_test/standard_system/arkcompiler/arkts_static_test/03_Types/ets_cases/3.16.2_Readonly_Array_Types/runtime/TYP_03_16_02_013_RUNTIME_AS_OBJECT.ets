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
 * @id TYP_03_16_02_013_RUNTIME_AS_OBJECT
 * @expect runtime
 * @section 3.16.2
 * @design 验证只读数组作为 Object 子类型运行时行为
 * @note 运行时用例：实际执行验证只读数组 instanceof
 */
function main(): void {
  let arr: readonly number[] = [1, 2, 3]
  let o: Object = arr

  if (!(o instanceof Array)) throw new Error("should be Array")
  if (!(o instanceof Object)) throw new Error("should be Object")

  console.log("verified")
}
