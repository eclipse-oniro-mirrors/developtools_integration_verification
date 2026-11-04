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
 * @id TYP_03_10_009_RUNTIME_NEVER_THROWS
 * @expect runtime
 * @section 3.10
 * @design 调用 never 函数抛异常
 * @runtime-throws=Error
 * @note 运行时用例：never 函数调用必抛错
 */
function panicAlways(): never {
  throw new Error("panic from never function")
}

function main(): void {
  panicAlways()
  // 此后代码不可达
  console.log("never reached")
}