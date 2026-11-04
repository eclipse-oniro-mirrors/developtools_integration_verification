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
 * @id LEX_02_09_09_021_RT_NULL_TYPEOF
 * @expect runtime
 * @section 2.9.9
 * @design typeof null 运行时返回值验证
 * @note runtime 用例：验证 typeof null 的运行时行为
 */
function main(): void {
  let x: null = null
  let t: string = typeof x
  if (t !== "object") { throw new Error("typeof null expected 'object', got " + t) }
}
