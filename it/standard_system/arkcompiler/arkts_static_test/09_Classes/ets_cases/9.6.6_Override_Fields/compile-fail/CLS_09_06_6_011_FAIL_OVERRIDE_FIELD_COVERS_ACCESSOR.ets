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
 * @id CLS_09_06_6_011_FAIL_OVERRIDE_FIELD_COVERS_ACCESSOR
 * @expect compile-fail
 * @section 9.6.6
 * @design override字段覆盖父类getter/setter导致编译错误
 * @note 反向用例：spec规定字段不能用override覆盖父类的getter、setter或getter+setter pair
 *       Spec依据：spec §9.6.6 "A compile-time error occurs if a field overrides
 *       a getter, a setter, or both in a superclass."
 */
class BaseAccessor011 {
  get n(): number { return 0 }
}
class OverrideFieldAccessor extends BaseAccessor011 {
  override n: number = 1
}
