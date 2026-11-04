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
 * @id STMT_08_03_015_RUNTIME_return_from_nested_block
 * @expect runtime
 * @section 8.3
 * @design 验证 void 函数中嵌套块内的 return 语句提前退出整个函数：return 之后的语句均不执行
 * @note 运行时用例：spec 8.3 — block 作为函数体，return 终止执行，即使 return 在深层嵌套中
 */
let g_trace: string = ""

function earlyReturnFromNestedBlock(shouldReturn: boolean): void {
  g_trace = g_trace + "A"
  {
    g_trace = g_trace + "B"
    {
      g_trace = g_trace + "C"
      if (shouldReturn) {
        g_trace = g_trace + "R"
        return
      }
      g_trace = g_trace + "D"
    }
    g_trace = g_trace + "E"
  }
  g_trace = g_trace + "F"
}

function returnFromBlockInsideIf(flag: boolean): void {
  g_trace = g_trace + "1"
  {
    if (flag) {
      g_trace = g_trace + "2"
      return
    }
    g_trace = g_trace + "3"
  }
  g_trace = g_trace + "4"
}

function main(): void {
  // Test 1: return is NOT taken — all statements execute
  g_trace = ""
  earlyReturnFromNestedBlock(false)
  if (g_trace != "ABCDEF") {
    throw new Error("no-return path failed: expected ABCDEF, got " + g_trace)
  }

  // Test 2: return IS taken from deeply nested block — stops at R
  g_trace = ""
  earlyReturnFromNestedBlock(true)
  if (g_trace != "ABCR") {
    throw new Error("early-return path failed: expected ABCR, got " + g_trace)
  }

  // Test 3: return from block inside if-statement in nested block
  g_trace = ""
  returnFromBlockInsideIf(true)
  if (g_trace != "12") {
    throw new Error("return-from-if path failed: expected 12, got " + g_trace)
  }

  // Test 4: no return — block inside if falls through
  g_trace = ""
  returnFromBlockInsideIf(false)
  if (g_trace != "134") {
    throw new Error("no-return-from-if path failed: expected 134, got " + g_trace)
  }

  console.log("verified")
}
