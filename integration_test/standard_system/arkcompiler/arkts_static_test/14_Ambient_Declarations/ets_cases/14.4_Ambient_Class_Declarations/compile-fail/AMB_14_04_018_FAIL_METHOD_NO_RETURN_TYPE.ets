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
 * @id AMB_14_04_018_FAIL_METHOD_NO_RETURN_TYPE
 * @expect compile-fail
 * @section 14.4
 * @design ambient class 方法无显式返回类型，违反 spec
 * @note 反向用例：ambient class 方法无返回类型应产生编译时错误
 */
declare class NoReturnMethod {
  foo(x: int)
}
