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
 * @id STMT_08_04_005_PASS_const_complex_types
 * @expect compile-pass
 * @section 8.4
 * @design 测试const与复杂类型：数组、联合类型、对象类型
 * @note const保持引用不变，复杂类型也需要类型注解
 */
function testConstComplexTypes(): void {
    const arr: int[] = [1, 2, 3];
    const names: string[] = ["a", "b", "c"];
    const max: int = 100;
    const min: int = 0;
    const threshold: number = 0.5;
}
