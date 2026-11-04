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
 * @id EXP2_17_09_2_011_FAIL_METHODOVERLOAD_INSTANCEMISMATCH
 * @expect compile-fail
 * @section 17.9.2
 * @design 实例 overload 不能包含 static 方法 — 编译错误
 * @note 反向用例：实例 overload 中包含 static 方法
 */
class InstanceFail {
  m1(a: int): int { return a }
  static m2(a: string): int { return a.length }
  overload busy { m1, m2 }
}
