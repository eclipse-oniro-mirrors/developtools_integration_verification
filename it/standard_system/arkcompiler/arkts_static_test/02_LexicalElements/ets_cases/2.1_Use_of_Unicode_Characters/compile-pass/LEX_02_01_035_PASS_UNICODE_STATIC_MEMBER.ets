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
 * @id LEX_02_01_035_PASS_UNICODE_STATIC_MEMBER
 * @expect compile-pass
 * @section 2.1
 * @design 测试因子checklist: static成员继承边界 - Unicode static字段访问（ArkTS要求通过类名限定）
 * @note 正向用例：验证Unicode标识符在static字段中的正确使用
 */
class 配置类 {
  static 计数: number = 0
  static 名称: string = "测试"
}

function main(): void {
  let 计数值: number = 配置类.计数
  let 名称值: string = 配置类.名称
  配置类.计数 = 10
}