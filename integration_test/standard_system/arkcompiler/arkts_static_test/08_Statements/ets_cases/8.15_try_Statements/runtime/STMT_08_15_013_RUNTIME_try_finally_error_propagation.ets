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
 * @id STMT_08_15_013_RUNTIME_try_finally_error_propagation
 * @expect runtime
 * @section 8.15
 * @design 验证 try-finally（无 catch）中抛出错误时 finally 执行且错误向上传播
 * @note finally 在错误传播前执行；调用方能够捕获传播的错误
 */
let g_finallyExecuted: int = 0;

function throwInTryFinally(): void {
  try {
    throw new Error("error in try");
  } finally {
    g_finallyExecuted = 1;
  }
}

function main(): void {
  let errorCaught: int = 0;

  try {
    throwInTryFinally();
  } catch (e) {
    errorCaught = 1;
  }

  if (g_finallyExecuted != 1) {
    throw new Error("finally was not executed before error propagation");
  }
  if (errorCaught != 1) {
    throw new Error("error was not propagated to caller");
  }

  console.log("verified");
}
