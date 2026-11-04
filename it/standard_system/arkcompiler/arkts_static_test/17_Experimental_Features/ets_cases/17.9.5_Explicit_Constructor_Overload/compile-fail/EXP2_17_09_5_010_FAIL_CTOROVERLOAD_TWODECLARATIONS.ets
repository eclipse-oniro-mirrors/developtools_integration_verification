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
 * @id EXP2_17_09_5_010_FAIL_CTOROVERLOAD_TWODECLARATIONS
 * @expect compile-fail
 * @section 17.9.5
 * @design 每个类只能有一个显式 constructor overload — 编译错误
 * @note 反向用例：同一个类中声明两个 overload constructor
 */
class DoubleCtor {
  constructor a(a: int) {}
  constructor b(a: string) {}
  overload constructor { a, b }
  overload constructor { a, b }
}
