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
 * @id GEN_05_01_03_011_PASS_INTERLEAVE_3LAYER
 * @expect compile-pass
 * @section 5.1.3
 * @design 3层嵌套variance interleaving in-out-in
 * @note spec: foo(p: (p: (p: T1)=>T2)=> T1) {} - in-out-in
 */
class X011<in T1, out T2> {
  foo(p: (p: (p: T1) => T2) => T1): void {}
}