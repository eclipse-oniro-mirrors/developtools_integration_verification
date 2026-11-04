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
 * @id EXP_07_06_02_006_PASS_OVERRIDE_COMPATIBLE
 * @expect compile-pass
 * @section 7.6.2
 * @design Override-compatible 签名：foo(p: Base) 同时实现 foo(p: Drv1) 和 foo(p: Drv2)
 * @note 正向用例：验证单个更宽参数类型的方法可实现多个重载
 */
class Base {}
class Drv1 extends Base {}
class Drv2 extends Base {}

interface A {
    foo(p: Drv1): Base
    foo(p: Drv2): Base
}
const a1: A = { foo(p: Base): Drv1 { return new Drv1() } }
