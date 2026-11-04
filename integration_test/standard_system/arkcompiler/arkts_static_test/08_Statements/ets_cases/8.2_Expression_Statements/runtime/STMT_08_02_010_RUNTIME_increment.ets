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
 * @id STMT_08_02_010_RUNTIME_increment
 * @expect runtime
 * @section 8.2
 * @design 验证自增自减表达式作为语句时的副作用，变量值正确变化
 * @note 运行时验证自增自减语句副作用
 */

let globalInc: int = 0;

function main(): void {
    // 测试后缀自增副作用
    let x: int = 0;
    x++;
    if (x != 1) {
        throw new Error("Postfix increment failed: expected x=1, got " + x);
    }
    x++;
    if (x != 2) {
        throw new Error("Postfix increment second call failed: expected x=2, got " + x);
    }

    // 测试前缀自增副作用
    let y: int = 5;
    ++y;
    if (y != 6) {
        throw new Error("Prefix increment failed: expected y=6, got " + y);
    }
    ++y;
    ++y;
    if (y != 8) {
        throw new Error("Prefix increment multiple calls failed: expected y=8, got " + y);
    }

    // 测试后缀自减副作用
    let a: int = 10;
    a--;
    if (a != 9) {
        throw new Error("Postfix decrement failed: expected a=9, got " + a);
    }
    a--;
    a--;
    if (a != 7) {
        throw new Error("Postfix decrement multiple calls failed: expected a=7, got " + a);
    }

    // 测试前缀自减副作用
    let b: int = 5;
    --b;
    if (b != 4) {
        throw new Error("Prefix decrement failed: expected b=4, got " + b);
    }

    // 测试全局变量自增副作用
    globalInc = 0;
    globalInc++;
    if (globalInc != 1) {
        throw new Error("Global increment failed: expected globalInc=1, got " + globalInc);
    }

    console.log("verified");
}
