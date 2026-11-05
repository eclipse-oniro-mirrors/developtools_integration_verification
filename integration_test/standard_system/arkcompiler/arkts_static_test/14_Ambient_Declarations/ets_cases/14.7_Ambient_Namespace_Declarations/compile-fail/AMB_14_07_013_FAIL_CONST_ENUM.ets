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
 * @id AMB_14_07_013_FAIL_CONST_ENUM
 * @expect compile-fail
 * @section 14.7
 * @design declare namespace 中 const enum 当前版本不支持
 * @note 反向用例：const enum 应产生编译时错误（编译器全局限制）
 */
declare namespace A {
  const enum E {A, B}
}
