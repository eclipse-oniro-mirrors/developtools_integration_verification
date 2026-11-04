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
 * @id CCY_16_06_01_090_FAIL_launch_details_wrong
 * @expect compile-fail
 * @section 16.6.1
 * @design GAP：Spec §16.6.1 定义 launch 支持 domain/group/ID 参数，但实现仅接受 1 个参数
 * @note 反向用例：验证 launch 传入外部参数应编译报错（Expected 1 argument, got 2）
 *       ⚠️ SPEC 不一致：spec 要求 launch 支持 domain/group/worker thread ID 参数，
 *       实现中 launch 签名仅接受 lambda 一个参数，domain/group/ID 参数未实现
 *       分类：D 类（Spec 与实现不一致）
 */
function main(): void {
    launch<void>((): void => {}, 'invalid_domain');
}
