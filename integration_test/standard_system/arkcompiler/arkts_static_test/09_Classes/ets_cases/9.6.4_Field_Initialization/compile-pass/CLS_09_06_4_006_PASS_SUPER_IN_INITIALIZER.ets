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
 * @id CLS_09_06_4_006_PASS_SUPER_IN_INITIALIZER
 * @expect compile-pass
 * @section 9.6.4
 * @design 字段初始化器中使用super产生compile-time warning（非error）
 * @note 编译器现在对super也产生Warning W0010，EXIT=0。符合spec要求。
 *       2026-07-17 确认编译器已修复（此前super不产生warning）。
 */
class SuperBase006 {
  method(): number { return 10 }
}
class SuperInitField extends SuperBase006 {
  public f0 = super.method()
}
