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
 * @id EXP2_17_10_02_009_FAIL_NATIVE_METHOD_BLOCK_BODY
 * @expect compile-fail
 * @section 17.10.2
 * @design 原生方法不能有 block body：验证 native method 带 { } 函数体产生编译错误 ESE0083
 * @note 反向用例：验证该场景应产生编译时错误 - Native, Abstract and Declare methods cannot have body
 */
class BadNative {
  native foo(): void {
    console.log('should not compile')
  }
}
