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
 * @id EXP2_17_09_2_012_FAIL_METHODOVERLOAD_NAMECONFLICT
 * @expect compile-fail
 * @section 17.9.2
 * @design overload 名与方法同名但方法不在列表中 — 编译错误
 * @note 反向用例：类中有方法 m，overload 也叫 m 但不含该方法
 */
class NameConflict {
  process(a: int): int { return a }
  helper(a: string): string { return a }
  // overload 名 "process" 与方法名同名但 process 不在列表中
  overload process { helper }
}
