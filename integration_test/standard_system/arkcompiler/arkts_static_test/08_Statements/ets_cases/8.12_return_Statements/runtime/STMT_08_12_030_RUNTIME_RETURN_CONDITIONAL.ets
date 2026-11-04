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
 * @id STMT_08_12_030_RUNTIME_RETURN_CONDITIONAL
 * @expect runtime
 * @section 8.12
 * @design 条件 return 分支

 * @note 运行时用例：实际执行验证条件return
 */
function absVal(x: int): int { if (x < 0) { return -x } return x }
function main(): void {
  if (absVal(-5) != 5) { throw new Error("assertion: abs(-5)=5") }
  if (absVal(3) != 3) { throw new Error("assertion: abs(3)=3") }
  console.log("verified")
}
