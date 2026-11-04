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
 * @id STMT_08_12_018_RUNTIME_return_from_multiple_control_flow_paths
 * @expect runtime
 * @section 8.12
 * @design 运行时验证从多种控制流路径（for循环、while循环、if-else分支）中return值的正确性
 * @note 运行时测试：函数包含for循环内return、while循环内return、if-else多分支return，通过不同参数触发各路径并断言返回值
 */

function classifyNumber(x: int): string {
    if (x > 0) {
        return "positive";
    } else if (x < 0) {
        return "negative";
    }
    return "zero";
}

function findFirstEven(arr: int[]): int {
    let i: int = 0;
    while (i < arr.length) {
        if (arr[i] % 2 == 0) {
            return arr[i];
        }
        i = i + 1;
    }
    return -1;
}

function sumUntilThreshold(arr: int[], limit: int): int {
    let total: int = 0;
    for (let k: int = 0; k < arr.length; k++) {
        total = total + arr[k];
        if (total >= limit) {
            return total;
        }
    }
    return total;
}

function main(): void {
    let r1: string = classifyNumber(5);
    if (r1 != "positive") {
        throw new Error("classifyNumber(5) should be positive, got " + r1);
    }
    let r2: string = classifyNumber(-3);
    if (r2 != "negative") {
        throw new Error("classifyNumber(-3) should be negative, got " + r2);
    }
    let r3: string = classifyNumber(0);
    if (r3 != "zero") {
        throw new Error("classifyNumber(0) should be zero, got " + r3);
    }

    let nums: int[] = [1, 3, 6, 7, 9];
    let even: int = findFirstEven(nums);
    if (even != 6) {
        throw new Error("findFirstEven([1,3,6,7,9]) should be 6, got " + even);
    }
    let nums2: int[] = [1, 3, 5];
    let noEven: int = findFirstEven(nums2);
    if (noEven != -1) {
        throw new Error("findFirstEven([1,3,5]) should be -1, got " + noEven);
    }

    let data: int[] = [2, 4, 1, 8, 3];
    let sum1: int = sumUntilThreshold(data, 10);
    if (sum1 != 15) {
        throw new Error("sumUntilThreshold with limit 10 should be 15, got " + sum1);
    }
    let sum2: int = sumUntilThreshold(data, 50);
    if (sum2 != 18) {
        throw new Error("sumUntilThreshold with limit 50 should be 18, got " + sum2);
    }

    console.log("verified");
}
