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
 * @id NAM_04_04_104_FAIL_IF_BLOCK_LEAK
 * @expect compile-fail
 * @section 4.4
 * @design 条件块作用域泄漏
 * @note 反向用例：验证if块内声明的变量在块外不可访问（块作用域隔离）
 */
function check(flag: boolean): void {
    if (flag) {
        let temp: number = 100;
    }
    let result: number = temp;
}
