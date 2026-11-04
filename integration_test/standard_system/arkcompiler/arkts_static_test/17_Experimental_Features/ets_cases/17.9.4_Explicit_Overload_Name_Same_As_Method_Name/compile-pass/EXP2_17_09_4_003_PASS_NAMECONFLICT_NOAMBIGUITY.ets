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
 * @id EXP2_17_09_4_003_PASS_NAMECONFLICT_NOAMBIGUITY
 * @expect compile-pass
 * @section 17.9.4
 * @design overload 名不在 overriding 中考虑，不产生歧义
 * @note 正向用例：方法重写时不受 overload 名干扰
 */
class BaseA {
  compute(a: int): string { return 'base-int:' + a }
  computeStr(a: string): string { return 'base-str:' + a }
  overload compute { compute, computeStr }
}

class DerivedA extends BaseA {
  // 合法重写 compute 方法
  compute(a: int): string { return 'derived-int:' + a }
  computeStr(a: string): string { return 'derived-str:' + a }
  overload compute { compute, computeStr }
}
