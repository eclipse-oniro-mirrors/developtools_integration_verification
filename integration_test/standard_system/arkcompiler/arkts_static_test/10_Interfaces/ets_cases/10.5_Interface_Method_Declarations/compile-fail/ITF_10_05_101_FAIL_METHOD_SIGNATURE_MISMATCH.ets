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
 * @id ITF_10_05_101_FAIL_METHOD_SIGNATURE_MISMATCH
 * @expect compile-fail
 * @section 10.5
 * @design 方法签名不匹配
 * @note 反向用例：验证接口方法签名与实现不匹配
 */
interface Named {
    getName(): string;
}
class BadImpl implements Named {
    getName(): number { return 42; }
}
