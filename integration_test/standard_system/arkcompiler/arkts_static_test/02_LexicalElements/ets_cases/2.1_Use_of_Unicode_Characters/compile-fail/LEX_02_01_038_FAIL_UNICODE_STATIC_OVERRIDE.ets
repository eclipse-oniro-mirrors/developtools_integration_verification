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
 * @id LEX_02_01_038_FAIL_UNICODE_STATIC_OVERRIDE
 * @expect compile-fail
 * @section 2.1
 * @design 测试因子checklist: static成员继承边界 - 同一文件内重复类声明（合并声明）应编译失败
 * @note 反向用例：验证ArkTS不支持类的合并声明（Merging declarations is not supported）
 */
class 配置类 {
  计数: number = 0
}

class 配置类 {  // 错误：重复类声明
  名称: string = "测试"
}