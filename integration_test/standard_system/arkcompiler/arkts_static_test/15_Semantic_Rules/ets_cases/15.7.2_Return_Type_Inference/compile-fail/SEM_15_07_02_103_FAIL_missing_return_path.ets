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
 * @id SEM_15_07_02_103_FAIL_missing_return_path
 * @expect compile-fail
 * @section 15.7.2
 * @design 规范 15.7.2：存在无return的执行路径时编译错误
 * @note 反向用例：boo的条件return导致某些路径无返回
 */
function boo(condition: boolean): int {
    if (condition) {
        return 1;
    }
}
function main(): void {
    let r: int = boo(true);
}
