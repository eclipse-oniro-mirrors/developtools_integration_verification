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
 * @id EXP_07_16_010_FAIL_TYPE_PARAM_DIRECT
 * @expect compile-fail
 * @section 7.16
 * @design 验证类型参数 T 直接作为 instanceof 操作数编译时错误
 * @note 反向用例：类型参数不会被保留到 undefined，编译时错误
 */
class A<T> {
  foo(x: T): boolean {
    return x instanceof T
  }
}
