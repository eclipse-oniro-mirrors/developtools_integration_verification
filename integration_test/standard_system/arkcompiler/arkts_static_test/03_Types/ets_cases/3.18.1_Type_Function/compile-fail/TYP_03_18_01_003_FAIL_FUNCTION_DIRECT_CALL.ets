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
 * @id TYP_03_18_01_003_FAIL_FUNCTION_DIRECT_CALL
 * @expect compile-fail
 * @section 3.18.1
 * @design Type Function 变量直接调用，spec 3.18.1 明确规定应产生编译时错误
 * @note 反向用例：spec 3.18.1 规定 "A value of type Function cannot be called directly"
 *       但 ArkTS 实际编译通过并运行正常
 *       ⚠️ SPEC 不一致：spec 要求报错，实现允许通过
 *       分类：D 类（Spec 与实现不一致）
 */
function bar(n: number): void {}

function testFunctionDirectCall(): void {
  let f: Function = bar
  f(1) // spec 3.18.1: compile-time error, "cannot be called directly"
  // 实际行为：ArkTS 编译通过，运行正常
}