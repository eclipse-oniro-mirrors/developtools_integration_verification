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
 * @id EXP2_17_11_3_010_FAIL_DUPLICATE_SAME_PARAMS
 * @expect compile-fail
 * @section 17.11.3
 * @design 同名命名构造函数且参数完全相同：验证两个命名构造函数同名同参产生编译错误
 * @note 反向用例：验证重复构造函数声明产生 ESE0130 编译错误。注意：仅产生 WARNING 而非 ERROR 的情况见设计问题报告
 */
class Foo {
  constructor Dup(n: int) {
    console.log('Dup1')
  }
  constructor Dup(n: int) {
    console.log('Dup2')
  }
}
