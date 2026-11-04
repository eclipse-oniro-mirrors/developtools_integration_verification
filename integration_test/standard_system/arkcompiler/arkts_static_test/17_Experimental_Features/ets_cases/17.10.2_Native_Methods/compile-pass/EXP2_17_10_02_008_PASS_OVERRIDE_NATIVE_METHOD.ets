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
 * @id EXP2_17_10_02_008_PASS_OVERRIDE_NATIVE_METHOD
 * @expect compile-pass
 * @section 17.10.2
 * @design 子类覆盖父类的原生方法：验证 override 可以将父类的 native method 重写为普通方法
 * @note 正向用例：验证该特性编译通过的正确用法
 */
class BaseService {
  native getData(): string
}
class ExtendedService extends BaseService {
  override getData(): string {
    return 'override data'
  }
}
