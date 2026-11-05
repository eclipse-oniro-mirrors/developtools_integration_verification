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
 * @id SEM_15_02_06_101_FAIL_func_optional_required_mismatch2
 * @expect compile-fail
 * @section 15.2.6
 * @design 第1个参数在类型中可选但 lambda 中必选，编译错误
 * @note 来自规范 15.2.6 例：foo = (p1: number, p2?: string): void => {} 编译错误
 */
function main(): void {
let foo: (x?: number, y?: string) => void = () : void => {
};
    foo = (p1: number, p2?: string): void => {}
}
