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
 * @id EXP2_17_09_3_007_FAIL_INTERFACEOVERLOAD_DUPLICATEOVERLOAD
 * @expect compile-fail
 * @section 17.9.3
 * @design 多接口继承同名 overload 但实现类未 override — 编译错误
 * @note 反向用例：两个接口有同名 overload，实现类未覆盖
 */
interface IX {
  x(a: int): string
  overload convert { x }
}

interface IY {
  y(a: string): string
  overload convert { y }
}

class BadMulti implements IX, IY {
  x(a: int): string { return 'x' }
  y(a: string): string { return 'y' }
  // 未 override convert — 两个接口都有 convert，产生冲突，应编译失败
}
