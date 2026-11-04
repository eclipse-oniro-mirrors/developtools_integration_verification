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
 * @id STMT_08_12_008_PASS_return_in_union_return_type_function
 * @expect compile-pass
 * @section 8.12
 * @design 测试返回类型为union类型(T|undefined)的函数中return语句的使用
 * @note 正向测试：union包含undefined时允许plain return；允许return该union中任一成员类型的表达式
 */

function findItem(arr: int[], target: int): int | undefined {
    for (let i: int = 0; i < arr.length; i++) {
        if (arr[i] == target) {
            return i;
        }
    }
    return;
}

function maybeGetValue(flag: boolean): string | undefined {
    if (flag) {
        return "valid";
    }
    return;
}

function getOrNull(cond: boolean): number | undefined {
    if (cond) {
        return 42;
    } else {
        return;
    }
}
