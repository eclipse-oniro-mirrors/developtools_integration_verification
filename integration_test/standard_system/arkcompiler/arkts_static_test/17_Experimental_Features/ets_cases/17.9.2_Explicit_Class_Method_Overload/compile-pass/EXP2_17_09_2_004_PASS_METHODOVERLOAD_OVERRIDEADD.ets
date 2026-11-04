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
 * @id EXP2_17_09_2_004_PASS_METHODOVERLOAD_OVERRIDEADD
 * @expect compile-pass
 * @section 17.9.2
 * @design 子类覆盖 overload 时可添加新方法
 * @note 正向用例：子类覆盖 overload 并添加额外方法
 */
class BaseWithExtra {
  methodA(a: int): string { return 'base-int:' + a }
  methodB(a: string): string { return 'base-str:' + a }
  overload process { methodA, methodB }
}

class DerivedWithExtra extends BaseWithExtra {
  methodA(a: int): string { return 'derived-int:' + a }
  methodB(a: string): string { return 'derived-str:' + a }
  methodC(a: boolean): string { return 'derived-bool:' + a }
  // 子类添加了 methodC
  overload process { methodA, methodB, methodC }
}
