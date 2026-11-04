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
 * @id STMT_08_15_010_FAIL_catch_variable_out_of_scope
 * @expect compile-fail
 * @section 8.15
 * @design 验证 catch 子句中的 error 标识符在 catch 块外部不可访问，产生编译错误
 * @note catch(e) 中的 e 作用域仅限于 catch 子句的块内部，外部引用应产生编译时错误
 */
function testCatchVariableOutOfScope(): void {
  let x: int = 0;
  try {
    x = 1;
  } catch (e) {
    x = 2;
  }
  // catch variable e is out of scope here - must be compile-time error
  let y: int = e;
}
