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
 * @id EXP_07_15_003_PASS_NEW_STORE_VARIABLE
 * @expect compile-pass
 * @section 7.15
 * @design 验证 new 表达式结果赋值给变量并访问字段
 * @note 正向用例：创建实例并存储到变量
 */
class A {
  public v: string
  constructor(v: string) {
    this.v = v
  }
}
let a = new A('hello')
let s: string = a.v
