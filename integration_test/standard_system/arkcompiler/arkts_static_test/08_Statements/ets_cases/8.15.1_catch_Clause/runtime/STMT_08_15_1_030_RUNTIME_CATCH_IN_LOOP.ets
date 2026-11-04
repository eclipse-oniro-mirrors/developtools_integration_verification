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
 * @id STMT_08_15_1_030_RUNTIME_CATCH_IN_LOOP
 * @expect runtime
 * @section 8.15.1
 * @design 循环中每次 catch 独立处理异常

 * @note 运行时用例：实际执行验证循环catch
 */
function main(): void {
  let errors: int = 0
  for (let i: int = 0; i < 5; i++) {
    try { if (i % 2 == 0) throw new Error() } catch (e) { errors++ }
  }
  if (errors != 3) { throw new Error("assertion: 3 errors (i=0,2,4)") }
  console.log("verified")
}
