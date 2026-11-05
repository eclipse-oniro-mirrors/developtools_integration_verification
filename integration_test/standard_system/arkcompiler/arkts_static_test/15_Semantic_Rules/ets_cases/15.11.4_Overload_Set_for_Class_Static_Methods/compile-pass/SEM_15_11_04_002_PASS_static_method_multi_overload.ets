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
 * @id SEM_15_11_04_002_PASS_static_method_multi_overload
 * @expect compile-pass
 * @section 15.11.4
 * @design 类静态方法多个重载
 * @note ⽐正向用例
 */
class Calc {
    static compute(x: int): int { return x; }
    static compute(x: int, y: int): int { return x + y; }
}
function main(): void {
    let r: int = Calc.compute(1, 2);
    console.log(r.toString());
}
