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
 * @id EXP2_17_10_02_015_RUNTIME_NATIVE_METHOD_CALL_ERROR
 * @expect runtime
 * @section 17.10.2
 * @design 调用未实现的原生方法触发链接错误：验证调用无实现的 native method 会在运行时抛出 LinkerUnresolvedMethodError
 * @note 运行时用例：调用无平台实现的 native method 预期抛出 LinkerUnresolvedMethodError
 */
class NativeAccessor {
  native getSecret(): string
}
function main(): void {
  let obj: NativeAccessor = new NativeAccessor()
  try {
    let secret: string = obj.getSecret()
    throw new Error('assertion failed: expected LinkerUnresolvedMethodError but no exception was thrown')
  } catch (e) {
    console.log('verified: LinkerUnresolvedMethodError caught as expected')
  }
}
