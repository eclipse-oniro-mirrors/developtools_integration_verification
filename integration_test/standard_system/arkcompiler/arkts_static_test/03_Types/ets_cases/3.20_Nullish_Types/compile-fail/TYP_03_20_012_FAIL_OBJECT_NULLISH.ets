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
 * @id TYP_03_20_012_FAIL_OBJECT_NULLISH
 * @expect compile-fail
 * @section 3.20
 * @design Nullish types 不兼容 Object（spec 注释原例）
 * @note 反向用例：Object = null/undefined/nullish union 均失败
 */
class AnyClass12 {}

function nullish(o: Object, nullish1: null, nullish2: undefined, nullish3: null | undefined, nullish4: AnyClass12 | null | undefined): void {
  o = nullish1
  o = nullish2
  o = nullish3
  o = nullish4
}