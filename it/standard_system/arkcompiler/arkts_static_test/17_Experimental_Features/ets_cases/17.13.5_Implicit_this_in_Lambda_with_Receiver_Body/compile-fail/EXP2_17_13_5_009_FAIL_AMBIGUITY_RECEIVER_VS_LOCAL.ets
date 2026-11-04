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
 * @id EXP2_17_13_5_009_FAIL_AMBIGUITY_RECEIVER_VS_LOCAL
 * @expect compile-fail
 * @section 17.13.5
 * @design 接收者函数中this绑定到非接收者类型 — ESE0201
 * @note 反向用例：验证该场景应产生编译时错误
 */
class DataBag { public value: number = 0 }
function testAmbiguityLocal(): void {
  let processor = (this: DataBag): string => { let v: string = this; return v }
  let db: DataBag = new DataBag(); db.value = 42
  let r: string = processor(db)
}
