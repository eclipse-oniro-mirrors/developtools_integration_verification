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
 * @id CLS_09_10_008_FAIL_OVERRIDE_PARAM_NOT_CONTRAVARIANT
 * @expect compile-fail
 * @section 9.10
 * @design 使用override关键字重写方法，但参数类型不满足逆变（派生类参数类型不是基类参数类型的超类型），编译失败
 * @note 反向用例：基类参数为AnimalBase，派生类声明override但参数为DogAnimal（DogAnimal是子类型不是超类型，违反逆变）
 */
class AnimalBase {
  public name: string = "animal"
}

class DogAnimal extends AnimalBase {
  public breed: string = ""
}

class Walker {
  public walk(a: AnimalBase): void {}
}

class DogWalker extends Walker {
  override walk(d: DogAnimal): void {
    // 错误：override声明但DogAnimal是AnimalBase的子类型，不是超类型，违反参数逆变
  }
}
