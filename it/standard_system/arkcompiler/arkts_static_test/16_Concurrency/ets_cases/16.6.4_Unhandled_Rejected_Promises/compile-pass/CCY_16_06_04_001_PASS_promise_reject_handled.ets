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
 * @id CCY_16_06_04_001_PASS_promise_reject_handled
 * @expect compile-pass
 * @section 16.6.4
 * @design 验证 Promise 拒绝通过 .catch() 处理，避免未处理拒绝
 * @note 正向用例：reject 后使用 .catch 捕获，未处理拒绝警告不应出现
 */
function handledReject(): Promise<number> {
    return new Promise((resolve: Function, reject: Function) => {
        reject(-1);
    }).catch((err: number) => {
        console.info('Rejection handled, code: ' + err);
        return 0;
    });
}

handledReject();
