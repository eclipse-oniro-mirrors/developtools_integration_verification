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
 * @id EXP_07_11_04_003_PASS_STATIC_RETURN_ASSIGNED
 * @expect compile-pass
 * @section 7.11.4
 * @design 验证 static 非 void 方法返回值赋值给变量，编译通过
 * @note 正向用例：static 方法返回 int 类型，赋值给 int 变量，编译通过
 */
class Calculator {
  static getValue(): int {
    return 42;
  }
}

function main(): void {
  let x: int = Calculator.getValue();
}
