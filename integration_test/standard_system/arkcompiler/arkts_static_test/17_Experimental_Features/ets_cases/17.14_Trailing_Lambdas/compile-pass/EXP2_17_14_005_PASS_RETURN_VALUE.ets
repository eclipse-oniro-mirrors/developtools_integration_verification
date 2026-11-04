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
 * @id EXP2_17_14_005_PASS_RETURN_VALUE
 * @expect compile-pass
 * @section 17.14
 * @design Trailing lambda 包含 return 语句返回 int 值
 * @note 正向用例：验证 trailing lambda 可以返回值
 */
function compute(callback: () => int): void {
  let result: int = callback()
  console.log("result: " + result)
}

compute() { return 42 }
