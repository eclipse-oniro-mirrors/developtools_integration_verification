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
 * @id STMT_08_15_006_FAIL_try_no_catch_no_finally
 * @expect compile-fail
 * @section 8.15
 * @design 验证 try 块没有 catch 也没有 finally 时产生编译错误
 * @note 规范要求 try 语句必须包含 catch 子句或 finally 子句（或两者），否则编译错误
 */
function testTryNoCatchNoFinally(): void {
    let x: int = 0;
    try {
        x = 1;
    }
}
