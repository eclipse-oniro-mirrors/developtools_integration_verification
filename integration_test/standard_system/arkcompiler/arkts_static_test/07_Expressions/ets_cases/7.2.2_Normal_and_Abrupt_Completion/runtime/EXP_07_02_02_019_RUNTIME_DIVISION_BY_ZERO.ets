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
 * @id EXP_07_02_02_019_RUNTIME_DIVISION_BY_ZERO
 * @expect runtime
 * @section 7.2.2
 * @design 验证整数除零（变量零，非字面量零）时抛出 ArithmeticError
 * @note 运行时用例：验证该场景的运行时行为；字面量零在编译时报错，变量零在运行时抛异常
 * @runtime-throws=ArithmeticError
 */
function main(): void {
  let divisor: int = 0;
  let a: int = 10 / divisor;
  console.log('' + a);
}
