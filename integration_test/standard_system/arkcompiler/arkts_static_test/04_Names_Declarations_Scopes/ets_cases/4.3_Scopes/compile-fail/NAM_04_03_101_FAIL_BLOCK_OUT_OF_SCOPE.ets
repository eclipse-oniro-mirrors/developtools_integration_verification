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
 * @id NAM_04_03_101_FAIL_BLOCK_OUT_OF_SCOPE
 * @expect compile-fail
 * @section 4.3
 * @design 块外引用块内变量
 * @note 反向用例：验证块外引用块内变量编译错误
 */
function test(): void {
    if (true) {
        let innerVar: number = 42;
    }
    let x: number = innerVar;
}
