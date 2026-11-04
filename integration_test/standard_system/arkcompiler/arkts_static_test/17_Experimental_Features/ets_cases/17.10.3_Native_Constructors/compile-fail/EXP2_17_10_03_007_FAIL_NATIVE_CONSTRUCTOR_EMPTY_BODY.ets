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
 * @id EXP2_17_10_03_007_FAIL_NATIVE_CONSTRUCTOR_EMPTY_BODY
 * @expect compile-fail
 * @section 17.10.3
 * @design native 构造函数不能有任何函数体（包括空 body `{}`）：验证即使是空 body 也会产生编译时错误
 * @note 反向用例：验证 native 构造函数带空 body `{}` 时产生 ESE0084 编译错误
 */
class NativeCtorFailEmptyBody {
  native constructor() {}
}
