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
 * @id LEX_02_02_029_PASS_TEMPLATE_LITERAL_LINE_SEP
 * @expect compile-pass
 * @section 2.2
 * @design 测试因子checklist: 控制流与smart cast - 模板字符串中的行终止符处理
 * @note 正向用例：验证模板字符串内换行作为内容保留
 */
function main(): void {
  let 多行文本: string = `第一行
第二行
第三行`
  let 含表达式: string = `结果: ${42}` // 行内注释+模板字符串
  let 空白混合: string = `  前导空格
  缩进行
末行`
}