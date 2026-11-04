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
 * @id STMT_08_15_014_RUNTIME_try_finally_normal
 * @expect runtime
 * @section 8.15
 * @design 验证 try-finally（无 catch）正常完成时 finally 子句始终执行
 * @note try 块正常完成不抛错，finally 仍然执行，执行顺序为 try 后 finally
 */
function main(): void {
  let flag: int = 0;

  try {
    flag = 10;
  } finally {
    flag = flag + 1;
  }

  if (flag != 11) {
    throw new Error("finally did not execute after normal try completion");
  }

  console.log("verified");
}
