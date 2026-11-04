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
 * @id SEM_15_01_08_001_PASS_comprehensive_expr
 * @expect compile-pass
 * @section 15.1.8
 * @design 语义基础总结：综合表达式验证
 * @note 正向用例：多种类型的表达式综合验证
 */
function main(): void {
    let x: int = 10;
    let y: string = 'hello';
    let z: boolean = true;
    console.log(`${x} ${y} ${z}`);
}
