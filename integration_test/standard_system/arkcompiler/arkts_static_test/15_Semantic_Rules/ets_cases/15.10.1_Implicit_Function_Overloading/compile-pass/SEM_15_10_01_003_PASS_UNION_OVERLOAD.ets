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
 * @id SEM_15_10_01_003_PASS_UNION_OVERLOAD
 * @expect compile-pass
 * @section 15.10.1
 * @design 验证联合类型参数重载：参数类型为联合类型时的重载解析
 * @note 正向用例：parse(int|string) 和 parse(boolean) 可区分解析
 */
function parse(x: int|string): string { return 'num_or_str'; }
function parse(x: boolean): string { return 'bool'; }
function main(): void {
    let r1: string = parse(42);
    let r2: string = parse('hi');
    let r3: string = parse(true);
    console.log(`${r1} ${r2} ${r3}`);
}
