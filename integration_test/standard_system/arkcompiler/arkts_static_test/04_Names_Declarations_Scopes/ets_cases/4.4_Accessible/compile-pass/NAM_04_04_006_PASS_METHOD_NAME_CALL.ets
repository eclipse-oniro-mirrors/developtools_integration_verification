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
 * @id NAM_04_04_006_PASS_METHOD_NAME_CALL
 * @expect compile-pass
 * @section 4.4
 * @design 方法名可用于调用
 * @note 正向用例：验证类实例方法名可用于调用（§4.4 行 367）
 */
class Greeter {
    greet(): string { return "hello"; }
}
let g: Greeter = new Greeter();
let msg: string = g.greet();
