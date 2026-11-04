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
 * @id EXP2_17_11_2_010_FAIL_FINAL_IN_INTERFACE
 * @expect compile-fail
 * @section 17.11.2
 * @design 接口中声明 final 方法：验证接口方法不能使用 final 修饰符
 * @note 反向用例：验证接口中 final 方法产生编译错误或警告
 */
interface IFoo {
  final doit(): void
}
