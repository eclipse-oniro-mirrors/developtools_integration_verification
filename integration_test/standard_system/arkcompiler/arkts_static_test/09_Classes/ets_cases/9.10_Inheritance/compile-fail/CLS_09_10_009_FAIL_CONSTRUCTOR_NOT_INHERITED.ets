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
 * @id CLS_09_10_009_FAIL_CONSTRUCTOR_NOT_INHERITED
 * @expect compile-fail
 * @section 9.10
 * @design 父类构造函数不被继承，子类默认构造函数无法调用需要参数的父类构造函数导致编译失败
 * @note 反向用例：父类仅有带参数构造函数（无参数化默认构造函数），子类未声明构造函数导致默认super()无参调用失败
 */
class Config {
  public name: string

  constructor(name: string) {
    this.name = name
  }
}

class DatabaseConfig extends Config {
  // 无显式构造函数，默认构造函数调用 super() 无参数
  // 但 Config 的构造函数需要 string 参数 -> 编译时错误
}
