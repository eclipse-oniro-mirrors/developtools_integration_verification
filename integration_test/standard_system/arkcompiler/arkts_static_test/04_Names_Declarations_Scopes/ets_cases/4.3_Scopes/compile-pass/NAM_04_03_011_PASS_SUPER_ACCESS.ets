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
 * @id NAM_04_03_011_PASS_SUPER_ACCESS
 * @expect compile-pass
 * @section 4.3
 * @design super 关键字访问父类成员
 * @note 正向用例：验证 super 在派生类中访问基类方法（§4.3 行 307）
 */
class Base {
    value(): number { return 42; }
}
class Derived extends Base {
    value(): number { return super.value() + 1; }
}
