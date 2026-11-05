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
 * @id EXP2_17_07_01_011_FAIL_GENERIC_USE_TYPE_PARAM
 * @expect compile-fail
 * @section 17.7.1
 * @design 根据 spec，static $_invoke 不能访问泛型类型参数。在泛型类的 $_invoke 签名或实现中使用类型参数应产生编译时错误。
 * @note 反向用例：验证泛型类 $_invoke 使用类型参数应编译失败
 */
class GenericInvokeFail<T> {
    static $_invoke(value: T): T {
        return value
    }
}
