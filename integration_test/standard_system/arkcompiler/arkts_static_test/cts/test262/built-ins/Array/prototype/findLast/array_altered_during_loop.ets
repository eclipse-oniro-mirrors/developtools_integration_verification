/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
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

// arktsid: findlast_array_altered_during_loop
// description: The range of elements processed is set before the first call to predicate
// Conversion notes:
//  - 回调谓词显式 return false（JS 依赖 ToBoolean(undefined)=false；ArkTS 谓词须返回 boolean）
//  - ArkTS findLast 循环动态读 actualLength（JS 捕获初始 len），但 splice/push 两场景谓词调用次数与元素序列均与 JS 一致

function main(): void {
    let arr: string[] = ['Shoes', 'Car', 'Bike'];
    let results: string[] = [];

    arr.findLast((kValue: string): boolean => {
        if (results.length === 0) {
            arr.splice(1, 1);
        }
        results.push(kValue);
        return false;
    });

    arktest.assertEQ(results.length, 3, 'predicate called three times');
    arktest.assertEQ(results[0], 'Bike', 'results[0]');
    arktest.assertEQ(results[1], 'Bike', 'results[1]');
    arktest.assertEQ(results[2], 'Shoes', 'results[2]');

    results = [];
    arr = ['Skateboard', 'Barefoot'];
    arr.findLast((kValue: string): boolean => {
        if (results.length === 0) {
            arr.pushOne('Motorcycle');
            arr[0] = 'Magic Carpet';
        }
        results.push(kValue);
        return false;
    });

    arktest.assertEQ(results.length, 2, 'predicate called twice');
    arktest.assertEQ(results[0], 'Barefoot', 'results[0]');
    arktest.assertEQ(results[1], 'Magic Carpet', 'results[1]');
}
