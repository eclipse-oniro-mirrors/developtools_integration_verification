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
 * @id EXP2_17_09_4_004_PASS_NAMECONFLICT_OVERLOADNAMESAMEASMETHOD
 * @expect compile-pass
 * @section 17.9.4
 * @design overload 名与某个方法名相同（该方法在列表中）
 * @note 正向用例：overload 名与方法同名且该方法在列表中
 */
class Worker {
  process(a: int): string { return 'int:' + a }
  processStr(a: string): string { return 'str:' + a }
  // overload 名 "process" 与方法 "process" 同名，process 在列表中
  overload process { process, processStr }
}
