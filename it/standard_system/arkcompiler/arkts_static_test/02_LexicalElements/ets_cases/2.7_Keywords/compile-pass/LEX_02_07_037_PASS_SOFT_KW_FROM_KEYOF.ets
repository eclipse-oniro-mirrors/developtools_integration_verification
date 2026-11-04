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
 * @id LEX_02_07_037_PASS_SOFT_KW_FROM_KEYOF
 * @expect compile-pass
 * @section 2.7
 * @design 软关键字: keyof 在类型上下文中
 * @note 正向用例：keyof 类型操作符 (from 需要模块上下文，此处省略)
 */
class Item037 {
  name: string = ""
  count: int = 0
}

function test037(): void {
  let item: Item037 = new Item037()
  item.name = "apple"
  item.count = 10
}
