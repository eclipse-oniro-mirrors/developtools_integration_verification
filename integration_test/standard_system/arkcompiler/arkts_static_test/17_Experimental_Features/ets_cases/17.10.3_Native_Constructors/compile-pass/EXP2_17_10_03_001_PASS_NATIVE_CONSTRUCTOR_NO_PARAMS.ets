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
 * @id EXP2_17_10_03_001_PASS_NATIVE_CONSTRUCTOR_NO_PARAMS
 * @expect compile-pass
 * @section 17.10.3
 * @design 无参数 native 构造函数声明：验证 native constructor() 声明的编译
 * @note 正向用例：验证无参数 native 构造函数声明可编译通过
 */
class NativeCtorNoParams {
  native constructor()
}

function testNativeCtorNoParams(): void {
  let obj: NativeCtorNoParams | null = null
  console.log('native constructor class type reference OK')
}
