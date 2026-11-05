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
 * @id GEN_05_01_02_003_PASS_FUNC_DEFAULT
 * @expect compile-pass
 * @section 5.1.2
 * @design 泛型函数默认类型参数
 * @note 正向用例：验证泛型函数有默认类型参数
 */
function foo<T = number>(input: T): T {
    return input;
}
let r: number = foo(1);
