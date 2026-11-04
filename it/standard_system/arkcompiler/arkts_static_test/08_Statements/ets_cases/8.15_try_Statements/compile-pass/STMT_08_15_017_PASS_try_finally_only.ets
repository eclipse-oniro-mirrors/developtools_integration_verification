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
 * @id STMT_08_15_017_PASS_try_finally_only
 * @expect compile-pass
 * @section 8.15
 * @design 验证仅含 finally 子句（无 catch）的 try 语句编译通过
 * @note try 语句仅跟 finally 子句不跟 catch 子句是合法语法，finally 中的代码在控制流离开 try 块前执行
 */
function testTryFinallyOnly(): void {
    let a: int = 0;
    let b: int = 0;
    try {
        a = 1;
        b = 2;
    } finally {
        a = 10;
        b = 20;
    }
}
