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
 * @id AMB_14_04_006_PASS_CLASS_METHODS
 * @expect compile-pass
 * @section 14.4
 * @design declare class 含方法声明（无体，有返回类型）
 * @note 正向用例：验证 ambient class 方法声明编译通过
 */
declare class WithMethods {
  foo(x: int): void
  bar(): string
  sum(a: int, b: int): int
}
