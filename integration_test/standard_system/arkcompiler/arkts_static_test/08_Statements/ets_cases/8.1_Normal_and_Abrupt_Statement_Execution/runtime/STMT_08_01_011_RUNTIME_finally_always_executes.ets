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
 * @id STMT_08_01_011_RUNTIME_finally_always_executes
 * @expect runtime
 * @section 8.1
 * @design 验证 finally 块在异常完成后始终执行：throw 后执行、catch 中再次 throw 后仍执行、try 正常完成后也执行
 * @note finally 的语义保证无论 try 或 catch 如何完成（正常或异常），finally 中的代码都会被执行
 */

function main(): void {
  // Test 1: finally executes after throw in try, no catch
  let f1: boolean = false;
  let caught1: boolean = false;
  try {
    try {
      throw new Error("test finally after throw");
    } finally {
      f1 = true;
    }
  } catch (e) {
    caught1 = true;
  }
  if (f1 != true) {
    throw new Error("finally: expected finally to run after throw without catch");
  }
  if (caught1 != true) {
    throw new Error("finally: expected error to propagate after finally");
  }

  // Test 2: finally executes when catch re-throws
  let f2: boolean = false;
  let caught2: boolean = false;
  try {
    try {
      throw new Error("original");
    } catch (e) {
      throw new Error("re-thrown");
    } finally {
      f2 = true;
    }
  } catch (e) {
    caught2 = true;
  }
  if (f2 != true) {
    throw new Error("finally: expected finally to run after catch re-throw");
  }
  if (caught2 != true) {
    throw new Error("finally: expected re-thrown error to propagate");
  }

  // Test 3: finally executes after normal try completion (no throw)
  let f3: boolean = false;
  let afterTry: boolean = false;
  try {
    let x: int = 1;
    x = x + 1;
  } finally {
    f3 = true;
  }
  afterTry = true;
  if (f3 != true) {
    throw new Error("finally: expected finally to run after normal try completion");
  }
  if (afterTry != true) {
    throw new Error("finally: expected code after try-finally to execute");
  }

  // Test 4: finally executes with try-catch-finally, normal path
  let f4: boolean = false;
  let c4: boolean = false;
  try {
    let y: int = 42;
    y = y - 1;
  } catch (e) {
    c4 = true;
  } finally {
    f4 = true;
  }
  if (f4 != true) {
    throw new Error("finally: expected finally in try-catch-finally normal path");
  }
  if (c4 != false) {
    throw new Error("finally: catch should not execute on normal path");
  }

  // Test 5: finally executes with try-catch-finally, abrupt path
  let f5: boolean = false;
  let c5: boolean = false;
  let a5: boolean = false;
  try {
    throw new Error("abrupt");
  } catch (e) {
    c5 = true;
  } finally {
    f5 = true;
  }
  a5 = true;
  if (f5 != true) {
    throw new Error("finally: expected finally in try-catch-finally abrupt path");
  }
  if (c5 != true) {
    throw new Error("finally: catch should execute on abrupt path");
  }
  if (a5 != true) {
    throw new Error("finally: code after try-catch-finally should execute");
  }

  console.log("verified");
}
