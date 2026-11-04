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
 * @id CLS_09_03_1_011_FAIL_OVERRIDE_FIELD_BY_ACCESSOR
 * @expect compile-fail
 * @section 9.3.1
 * @design 覆盖超类字段→accessor导致编译错误
 * @note 反向用例：spec规定不能覆盖超类字段为accessor
 */
interface IFieldInt {
  n: number
}
class CFieldInt implements IFieldInt {
  n: number = 1
}
class C1Override extends CFieldInt {
  get n(): number { return 1 }
}
