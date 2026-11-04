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
 * @id SEM_15_01_06_005_PASS_PROPERTY_ACCESS
 * @expect compile-pass
 * @section 15.1.6
 * @design 其他上下文：属性访问表达式推断
 * @note 正向用例：对象属性访问后的类型推断
 */
class Point { public x: int = 0; public y: int = 0; }
function main(): void {
    let p: Point = new Point();
    p.x = 10;
    let val = p.x;
    let v: int = val;
    console.log(`${v}`);
}
