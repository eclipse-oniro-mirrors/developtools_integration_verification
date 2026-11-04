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
 * @id LEX_02_01_036_RUNTIME_UNICODE_STATIC_MEMBER_ACCESS
 * @expect runtime
 * @section 2.1
 * @design 测试因子checklist: static成员继承边界 - Unicode static字段通过类名访问的运行时行为
 * @note 运行时用例：实际执行验证Unicode static成员的访问正确性
 */
class 配置类 {
  static 应用名: string = "测试应用"
  static 版本号: number = 1
}

function main(): void {
  let 基本信息: string = 配置类.应用名 + " v" + 配置类.版本号.toString()
  if (基本信息 !== "测试应用 v1") { throw new Error("Unicode static: base info mismatch, got " + 基本信息) }

  配置类.版本号 = 2
  let 更新后信息: string = 配置类.应用名 + " v" + 配置类.版本号.toString()
  if (更新后信息 !== "测试应用 v2") { throw new Error("Unicode static: update mismatch, got " + 更新后信息) }
}