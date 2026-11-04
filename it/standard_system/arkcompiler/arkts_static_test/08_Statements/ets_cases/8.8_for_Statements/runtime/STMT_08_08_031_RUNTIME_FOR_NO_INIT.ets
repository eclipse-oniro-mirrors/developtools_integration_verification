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
 * @id STMT_08_08_031_RUNTIME_FOR_NO_INIT
 * @expect runtime
 * @section 8.8
 * @design for 语句无初始化部分

 * @note 运行时用例：实际执行验证for无init
 */
function main(): void {
  let i: int = 0; let sum: int = 0
  for (; i < 5; i++) { sum = sum + i }
  if (sum != 10) { throw new Error("assertion: 0+1+2+3+4=10") }
  console.log("verified")
}
