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
 * @id CLS_09_06_6_010_FAIL_OVERRIDE_READONLY_ON_NON_READONLY
 * @expect compile-fail
 * @section 9.6.6
 * @design override字段添加readonly修饰符覆盖非readonly字段导致编译错误
 * @note 反向用例：spec规定如果override字段是readonly而被override字段不是readonly，
 *       则产生compile-time error
 *       Spec依据：spec §9.6.6 示例class D — override readonly加到非readonly字段
 */
class BaseNonRead010 {
  n: number = 0
}
class OverrideReadOnNonRead extends BaseNonRead010 {
  override readonly n: number = 1
}
