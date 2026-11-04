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
 * @id GEN_05_01_03_107_FAIL_INTERLEAVE_4LAYER
 * @expect compile-fail
 * @section 5.1.3
 * @design 4层variance interleaving中in T出现在out位置
 * @note spec: interleaving flips positions; in T ending up in out-position = CTE
 */
class Y107<in T> {
  bar(p: () => () => () => T): void {}
}
