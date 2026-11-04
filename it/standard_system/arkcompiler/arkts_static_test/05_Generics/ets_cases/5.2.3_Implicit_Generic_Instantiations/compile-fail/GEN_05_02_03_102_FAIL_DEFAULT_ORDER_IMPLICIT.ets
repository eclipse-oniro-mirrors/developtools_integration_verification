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
 * @id GEN_05_02_03_102_FAIL_DEFAULT_ORDER_IMPLICIT
 * @expect compile-fail
 * @section 5.2.3
 * @design 有默认值的类型参数后跟无默认值参数
 * @note 反向用例：验证有默认值的类型参数后不能有无默认值参数
 */
class C<T1, T2 = number, T3> {
  public value1: T1;
  public value2: T2;
  public value3: T3;
}
// 隐式实例化：T2 有默认值，T3 无默认值 → 违反顺序约束
// 编译器应在声明 C 时即报错，不论是否实例化
