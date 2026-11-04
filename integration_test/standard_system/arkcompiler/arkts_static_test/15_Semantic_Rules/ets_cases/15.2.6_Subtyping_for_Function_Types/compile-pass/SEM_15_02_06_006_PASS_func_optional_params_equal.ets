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
 * @id SEM_15_02_06_006_PASS_func_optional_params_equal
 * @expect compile-pass
 * @section 15.2.6
 * @design 相同可选参数类型合法
 * @note 来自规范 15.2.6 例：foo = (p1?:number, p2?:string): void => {} OK
 */
function main(): void {
let foo: (x?: number, y?: string) => void = (p1?: number, p2?: string): void => {
};
}
