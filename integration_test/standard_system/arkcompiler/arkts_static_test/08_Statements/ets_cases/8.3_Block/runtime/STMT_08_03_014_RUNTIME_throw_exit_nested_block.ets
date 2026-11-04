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
 * @id STMT_08_03_014_RUNTIME_throw_exit_nested_block
 * @expect runtime
 * @section 8.3
 * @design 验证 throw 从嵌套块中间位置退出：后续语句不执行，控制权转移到外层 catch
 * @note 运行时用例：spec 8.3 — block 执行到 throw 时停止，跳出所有嵌套块到最近的 catch
 */
function main(): void {
  let x: int = 0
  let y: int = 0
  let caught: boolean = false
  let trace: string = "start"

  try {
    x = 1
    {
      x = 2
      {
        x = 3
        trace = "before-throw"
        throw new Error("exit from nested block")
        // Everything below must NOT execute
        trace = "after-throw-should-not-execute"
        x = 999
      }
      // This must NOT execute — throw exits the inner block
      trace = "after-inner-block-should-not-execute"
      x = 998
    }
    // This must NOT execute — throw propagates past middle block
    trace = "after-middle-block-should-not-execute"
    x = 997
  } catch (e) {
    caught = true
    y = 1
  }

  // Verify throw stopped execution at the right point
  if (x != 3) {
    throw new Error("throw stop failed: x should be 3 but got " + x)
  }
  if (trace != "before-throw") {
    throw new Error("trace should be before-throw but got " + trace)
  }
  if (!caught) {
    throw new Error("throw was not caught")
  }
  if (y != 1) {
    throw new Error("catch block did not execute, y is " + y)
  }

  // Test throw exits only the innermost try, not outer logic
  let z: int = 0
  {
    try {
      {
        z = 10
        throw new Error("inner throw")
        z = 99
      }
    } catch (e) {
      z = z + 1
    }
    // This SHOULD execute — catch handled the throw, execution resumes in the block
    z = z + 100
  }
  if (z != 111) {
    throw new Error("throw-catch-resume failed: z should be 111 but got " + z)
  }

  console.log("verified")
}
