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
 * @id GEN_05_01_03_105_FAIL_INTERLEAVE_3LAYER
 * @expect compile-fail
 * @section 5.1.3
 * @design 3层variance interleaving中out T出现在in位置
 * @note spec: interleaving flips positions; out T ending up in in-position = CTE
 */
class X105<out T> {
  foo(p: (p: T) => void): void {}
}
