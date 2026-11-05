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
 * @id EXP_07_35_04_002_PASS_LAMBDA_UNINITIALIZED_CAPTURE
 * @expect compile-pass
 * @section 7.35.4
 * @design Lambda 捕获未初始化变量 — es2panda 编译通过
 * @note 正向用例：⚠️ SPEC 不一致：spec §7.35.2 要求编译错误，但 es2panda 编译通过
 */
function testLambdaUninitializedCapture(): void {
  let x: int
  let f: () => int = () => x
  console.log(f().toString())
}
