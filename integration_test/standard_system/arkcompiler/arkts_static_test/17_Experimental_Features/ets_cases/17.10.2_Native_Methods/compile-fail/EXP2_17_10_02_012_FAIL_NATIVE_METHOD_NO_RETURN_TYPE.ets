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
 * @id EXP2_17_10_02_012_FAIL_NATIVE_METHOD_NO_RETURN_TYPE
 * @expect compile-fail
 * @section 17.10.2
 * @design 原生方法必须有显式返回类型：验证 native method 无显式返回类型产生编译错误 ESE0018
 * @note 反向用例：验证该场景应产生编译时错误 - Native and Declare methods should have explicit return type
 */
class NoReturnType {
  native foo(a: int)
}
