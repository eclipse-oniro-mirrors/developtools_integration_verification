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
 * @id EXP2_17_09_2_013_FAIL_METHODOVERLOAD_OVERRIDEMISSING
 * @expect compile-fail
 * @section 17.9.2
 * @design 子类覆盖 overload 但缺少父类方法 — 编译错误
 * @note 反向用例：子类 overload 列表不完整
 */
class BaseClass {
  methodA(a: int): string { return 'a' }
  methodB(a: string): string { return 'b' }
  overload process { methodA, methodB }
}

class BadOverride extends BaseClass {
  methodA(a: int): string { return 'override-a' }
  // methodB 缺失 — 应编译失败
  overload process { methodA }
}
