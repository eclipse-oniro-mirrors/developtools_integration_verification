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
 * @id STMT_08_15_016_RUNTIME_try_catch_finally_error
 * @expect runtime
 * @section 8.15
 * @design 验证 try-catch-finally 中抛出错误时三个块均正确执行
 * @note try 抛错后控制权转给 catch，最后 finally 始终执行，顺序为 try→catch→finally
 */
function main(): void {
  let tryReached: int = 0;
  let catchReached: int = 0;
  let finallyReached: int = 0;
  let afterTryValue: int = 0;

  try {
    tryReached = 1;
    throw new Error("trigger catch");
    tryReached = -1;
  } catch (e) {
    catchReached = 1;
  } finally {
    finallyReached = 1;
  }
  afterTryValue = 42;

  if (tryReached != 1) {
    throw new Error("try block did not execute");
  }
  if (catchReached != 1) {
    throw new Error("catch block did not execute after error");
  }
  if (finallyReached != 1) {
    throw new Error("finally block did not execute");
  }
  if (afterTryValue != 42) {
    throw new Error("code after try-catch-finally did not execute");
  }

  console.log("verified");
}
