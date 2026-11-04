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
 * @id STMT_08_12_005_PASS_multiple_return_paths
 * @expect compile-pass
 * @section 8.12
 * @design 测试函数中多个return语句分支持续编译通过
 * @note 正向测试：函数中包含多条件return路径，每条路径均返回正确类型，编译通过
 */
function testMultipleReturns(b: boolean): string {
    if (b) {
        return "true";
    }
    return "false";
}

function testEarlyReturn(x: int): int {
    if (x < 0) {
        return 0;
    }
    return x;
}
