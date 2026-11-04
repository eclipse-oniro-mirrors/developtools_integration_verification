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
 * @id SEM_15_01_03_001_PASS_EXPLICIT_TYPE_INIT
 * @expect compile-pass
 * @section 15.1.3
 * @design 验证有显式类型注解的变量初始化与赋值上下文规则一致
 * @note 正向用例：int/double/string 显式类型注解初始化应通过
 */
function main(): void {
    let x: int = 100;
    let y: double = 3.14;
    let z: string = 'hello';
    console.log(`x=${x}, y=${y}, z=${z}`);
}
