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
 * @id EXP2_17_08_010_PASS_TRY_CATCH_FINALLY
 * @expect compile-pass
 * @section 17.8
 * @design 验证 try-catch-finally 异常处理在 ArkTS 中编译通过
 * @note 正向用例：验证 try-catch、try-finally、try-catch-finally 编译通过
 */
function testTryCatch(): void {
  try {
    let x: number = 10 / 2
  } catch (e) {
    let msg: string = 'error caught'
  }
}

function testTryFinally(): void {
  let executed: boolean = false
  try {
    executed = true
  } finally {
    let cleanup: number = 0
  }
}

function testTryCatchFinally(): void {
  try {
    let val: number = 100
  } catch (e) {
    let msg: string = 'caught'
  } finally {
    let finalStep: boolean = true
  }
}

function testThrowStatement(): void {
  let condition: boolean = true
  if (condition) {
    throw new Error('test error')
  }
}

function testMultipleCatches(): void {
  try {
    let x: number = 10
  } catch (e) {
    let msg: string = 'error'
  }
}
