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
 * @id CLS_09_04_009_PASS_STATIC_INIT_BLOCK
 * @expect compile-pass
 * @section 9.4
 * @design 静态初始化块（static block）基本用法编译通过
 * @note 正向用例：spec §9.4明确提及静态初始化块，
 *       验证static { ... }语法在类声明中合法
 *       Spec依据：spec §9.4 class body可包含static initialization block
 */
class StaticBlock009 {
  static x: number = 0
  static {
    StaticBlock009.x = 42
  }
}
