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
 * @id CLS_09_08_019_FAIL_OVERRIDE_GETTER_NON_COVARIANT
 * @expect compile-fail
 * @section 9.8
 * @design override getter 返回类型非协变应编译失败
 * @note 反向用例：子类 override getter 的返回类型必须可赋值给父类 getter 的返回类型（协变）
 */
class NumberHolder {
  get data(): int { return 0 }
}

class TextHolder extends NumberHolder {
  override get data(): string { return "" } // Compile-time error, string not assignable to int
}

class BooleanSource {
  get flag(): boolean { return false }
  set flag(v: boolean) {}
}

class IntSource extends BooleanSource {
  override get flag(): int { return 1 } // Compile-time error, int not assignable to boolean
  override set flag(v: int) {}
}
