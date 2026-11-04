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
 * @id CCY_16_CI_005_PASS_promise_chain_cross_module
 * @expect compile-pass
 * @section 16.6.3
 * @design Promise.then() 链式调用
 * @note 正向用例：验证 Promise.then 链式调用编译通过
 */
function main(): void {
    let p: Promise<void> = Promise.resolve<number>(42).then((): void => {
        console.log('verified');
});
}
