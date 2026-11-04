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
 * @id STMT_08_03_012_FAIL_access_block_var_outside
 * @expect compile-fail
 * @section 8.3
 * @design 块内声明的 let 变量作用域限定在块内，块外访问该变量应产生编译错误
 * @note 反向用例：在块外引用块内声明的变量，违反块作用域规则
 */
function testAccessBlockVarOutside(): void {
  {
    let secret: int = 42
  }
  // secret is not visible here — this MUST be a compile error
  let leaked: int = secret
}

function testNestedBlockVarNotVisibleInOuter(): void {
  let outer: int = 0
  {
    {
      let deep: int = 99
    }
    // deep is not visible here — this MUST be a compile error
    outer = deep
  }
}

function testBlockVarInExpressionOutside(): void {
  let result: int = 0
  {
    let val: int = 7
  }
  // val is not visible — using it in an expression MUST be a compile error
  result = val + 3
}
