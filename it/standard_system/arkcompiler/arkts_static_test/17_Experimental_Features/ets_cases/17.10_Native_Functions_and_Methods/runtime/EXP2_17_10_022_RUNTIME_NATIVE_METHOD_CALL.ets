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
 * @id EXP2_17_10_022_RUNTIME_NATIVE_METHOD_CALL
 * @expect runtime
 * @section 17.10
 * @design 运行时验证 native 方法调用行为——native 方法在纯 ArkTS 环境中无平台实现，调用应抛出运行时错误
 * @note 运行时用例：通过类实例调用未实现的 native 方法，验证运行时抛出异常
 *       ⚠️ 环境限制：native 方法依赖平台实现，纯 ArkTS 环境无对应 native 实现
 */
class NativeAccess {
  native fetch(): string
}

function main(): void {
  let a: NativeAccess = new NativeAccess()
  let caught: boolean = false
  try {
    let s: string = a.fetch()
  } catch (e) {
    caught = true
  }
  if (!caught) {
    throw new Error('assertion failed: native method call should throw when not implemented')
  }
  console.log('verified')
}
