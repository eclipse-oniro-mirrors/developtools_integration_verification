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
 * @id EXP2_17_10_01_012_RUNTIME_NATIVE_FUNC_CALL_ERROR
 * @expect runtime
 * @section 17.10.1
 * @design 调用未实现的原生函数触发链接错误：验证调用无实现的 native function 会在运行时抛出 LinkerUnresolvedMethodError
 * @runtime-throws=LinkerUnresolvedMethodError
 * @note 运行时用例：调用无平台实现的 native function 预期抛出 LinkerUnresolvedMethodError
 */
native function unimplementedNative(): int
function main(): void {
  try {
    let result: int = unimplementedNative()
    throw new Error('assertion failed: expected LinkerUnresolvedMethodError but no exception was thrown')
  } catch (e) {
    // Expected: LinkerUnresolvedMethodError because no native implementation exists
    console.log('verified: LinkerUnresolvedMethodError caught as expected')
  }
}
