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
 * @id GEN_05_01_04_109_FAIL_WILDCARD_SYNTAX_UNREPRESENTABLE
 * @expect compile-fail
 * @section 5.1.4
 * @design wildcard type不能被ArkTS语法直接表示（不能写X<*>）
 * @note spec: wildcard type cannot be represented with the ArkTS syntax
 */
class X109<T> {}
let x109: X109<*> = new X109<number>()
