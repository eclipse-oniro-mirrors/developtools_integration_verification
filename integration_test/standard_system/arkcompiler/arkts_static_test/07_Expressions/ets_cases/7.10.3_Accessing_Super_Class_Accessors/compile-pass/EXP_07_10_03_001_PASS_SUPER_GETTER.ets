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
 * @id EXP_07_10_03_001_PASS_SUPER_GETTER
 * @expect compile-pass
 * @section 7.10.3
 * @design 通过 super 调用超类的 getter：super.property 在子类 getter 中访问超类访问器
 * @note 正向用例：验证 super.identifier 可用于访问超类 getter
 */
class Base {
    get value(): int {
        return 42
    }
}
class Derived extends Base {
    get value(): int {
        return super.value + 1
    }
}
let d: Derived = new Derived()
let v: int = d.value
