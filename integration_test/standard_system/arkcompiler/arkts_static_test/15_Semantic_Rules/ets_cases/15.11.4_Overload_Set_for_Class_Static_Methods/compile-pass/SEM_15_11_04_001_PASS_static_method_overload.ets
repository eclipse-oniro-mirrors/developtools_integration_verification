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
 * @id SEM_15_11_04_001_PASS_static_method_overload
 * @expect compile-pass
 * @section 15.11.4
 * @design 类静态方法重载集
 * @note 正向用例：Calc 类的静态方法 convert 重载
 */
class Calc {
    static convert(x: int): string { return 'int'; }
    static convert(x: string): string { return 'str'; }
}
function main(): void {
    let r: string = Calc.convert(42);
    console.log(r);
}
